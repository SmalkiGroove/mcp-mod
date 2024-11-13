local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')

MRL0308 = Class(CWalkingLandUnit) {
    Weapons = {
        HeavyBolter = Class(CDFElectronBolterWeapon ) {},
    },
    
    OnCreate = function(self)
        if self.Blueprint.General.BuildBones then
            self:SetupBuildBones()
        end
        CWalkingLandUnit.OnCreate(self)
    end,

    CreateBuildEffects = function(self, unitBeingBuilt, order)
       EffectUtil.SpawnBuildBots(self, unitBeingBuilt, 10, self.BuildEffectsBag)
       EffectUtil.CreateCybranBuildBeams(self, unitBeingBuilt, self.Blueprint.General.BuildBones.BuildEffectBones, self.BuildEffectsBag)
    end,

    OnStartBuild = function(self, unitBeingBuilt, order)
        CWalkingLandUnit.OnStartBuild(self, unitBeingBuilt, order)

        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        self.AnimationManipulator:PlayAnim(self.Blueprint.Display.AnimationOpen, false):SetRate(1.5)
        
        self.UnitBeingBuilt = unitBeingBuilt
        self.UnitBuildOrder = order
        self.BuildingUnit = true
    end,
    
    OnStopBuild = function(self, unitBeingBuilt)
        CWalkingLandUnit.OnStopBuild(self, unitBeingBuilt)
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        self.AnimationManipulator:PlayAnim(self.Blueprint.Display.AnimationClose, false):SetRate(1)
    end,
}

TypeClass = MRL0308
