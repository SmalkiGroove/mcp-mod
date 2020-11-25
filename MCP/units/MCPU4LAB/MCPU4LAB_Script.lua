
local TerranWeaponFile = import('/lua/terranweapons.lua')
local ModWeaponFile = import('/mods/MCP/lua/MCPWeapons.lua')
local ModEffectTemplates = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local EffectUtil = import('/lua/EffectUtilities.lua')
local Effects = import('/lua/effecttemplates.lua')
local Entity = import('/lua/sim/Entity.lua').Entity
local utilities = import('/lua/Utilities.lua')
local RandomFloat = utilities.GetRandomFloat
local EffectTemplate = import('/lua/EffectTemplates.lua')
local explosion = import('/lua/defaultexplosions.lua')
local CreateBuildCubeThread = EffectUtil.CreateBuildCubeThread
local CreateDeathExplosion = explosion.CreateDefaultHitExplosionAtBone

local TDFRiotWeapon = TerranWeaponFile.TDFRiotWeapon
local EXCEMPArrayBeam01 = ModWeaponFile.EXCEMPArrayBeam01
local TDFHiroPlasmaCannon = TerranWeaponFile.TDFHiroPlasmaCannon
local TSAMLauncher = TerranWeaponFile.TSAMLauncher
local TDFGaussCannonWeapon = TerranWeaponFile.TDFLandGaussCannonWeapon
local EXCEMPArrayBeam01 = ModWeaponFile.EXCEMPArrayBeam01
local ExWifeMaincannonWeapon01 = ModWeaponFile.ExWifeMaincannonWeapon01

MCPU4LAB = Class(TWalkingLandUnit) {
    Weapons = {
		EXTargetPainter = Class(EXCEMPArrayBeam01) {},
		HeadWeapon = Class(EXCEMPArrayBeam01)
        {
            OnWeaponFired = function(self, muzzle)
                if not self.JawTopRotator then 
                    self.JawBottomRotator = CreateRotator(self.unit, 'Jaw_Bone', 'x')

                    self.unit.Trash:Add(self.JawBottomRotator)
                end

                self.JawBottomRotator:SetGoal(30):SetSpeed(100)

                EXCEMPArrayBeam01.OnWeaponFired(self, muzzle)

                self:ForkThread(function()
                    WaitSeconds(1.5)

                    self.JawBottomRotator:SetGoal(0):SetSpeed(50)
                end)
            end,
        },
		LeftMainLaser2 = Class(ExWifeMaincannonWeapon01) {},  
        RightMainLaser2 = Class(ExWifeMaincannonWeapon01) {}, 
		HeavyPlasmaChinGun = Class(TDFRiotWeapon) {},
		HeavyPlasmaLeft = Class(TDFHiroPlasmaCannon) {},
		HeavyPlasmaRight = Class(TDFHiroPlasmaCannon) {},
		TacticalMissiles = Class(TSAMLauncher) {}, 
		RightTurret01 = Class(TDFGaussCannonWeapon) {
				FxMuzzleFlashScale = 0.25,
		},
        LeftTurret01 = Class(TDFGaussCannonWeapon) {
				FxMuzzleFlashScale = 0.25,
		},
		AALeft = Class(TSAMLauncher) {},
		AARight = Class(TSAMLauncher) {},
    },

	OnCreate = function(self,builder,layer)
        TWalkingLandUnit.OnCreate(self)
			Army = self:GetArmy()
    end,

	StartBeingBuiltEffects = function(self, builder, layer)
		TWalkingLandUnit.StartBeingBuiltEffects(self, builder, layer)
		self.OnBeingBuiltEffectsBag:Add( self:ForkThread( CreateBuildCubeThread, builder, self.OnBeingBuiltEffectsBag )	)			
    end,

	OnStopBeingBuilt = function(self,builder,layer)
		TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator1 = CreateRotator(self, 'Jaw_Bone', 'x')
        self.Rotator2 = CreateRotator(self, 'Head', 'x')
        self.Rotator3 = CreateRotator(self, 'Head', 'y')
		self.Rotator4 = CreateRotator(self, 'NewTorso', 'x')
        self.Rotator5 = CreateRotator(self, 'Right_Cannon', 'x')
        self.Rotator6 = CreateRotator(self, 'Left_Cannon', 'x')
		self.Rotator7 = CreateRotator(self, 'Right_Cannon', 'y')
        self.Rotator8 = CreateRotator(self, 'Left_Cannon', 'y')
        self.Trash:Add(self.Rotator1)
		self.Trash:Add(self.Rotator2)
		self.Trash:Add(self.Rotator3)
		self.Trash:Add(self.Rotator4)
		self.Trash:Add(self.Rotator5)
		self.Trash:Add(self.Rotator6)

		if self.Rotator4 then
            self.Rotator4:SetGoal(-30):SetSpeed(50)
        end
        self:ForkThread(function()
        	WaitSeconds(1)

        	self.Rotator4:SetGoal(0):SetSpeed(25)
        end)
		if self.Rotator5 then
            self.Rotator5:SetGoal(30):SetSpeed(50)
        end
		if self.Rotator7 then
            self.Rotator7:SetGoal(30):SetSpeed(50)
        end
        self:ForkThread(function()
        	WaitSeconds(1)
            self.Rotator5:SetGoal(0):SetSpeed(25)        
        	self.Rotator7:SetGoal(0):SetSpeed(25)
        end)
		if self.Rotator6 then
            self.Rotator6:SetGoal(30):SetSpeed(50)
        end
		if self.Rotator8 then
            self.Rotator8:SetGoal(-30):SetSpeed(50)
        end
        self:ForkThread(function()
        	WaitSeconds(1)
            self.Rotator6:SetGoal(0):SetSpeed(25)			
        	self.Rotator8:SetGoal(0):SetSpeed(25)
        end)


        if self.Rotator1 then
            self.Rotator1:SetGoal(30):SetSpeed(100)
        end
        self:ForkThread(function()
        	WaitSeconds(1)

        	self.Rotator1:SetGoal(0):SetSpeed(50)
        end)
        if self.Rotator2 then
            self.Rotator2:SetGoal(-40):SetSpeed(100)
        end
        self:ForkThread(function()
        	WaitSeconds(1)

        	self.Rotator2:SetGoal(0):SetSpeed(50)
        end)
        if self.Rotator3 then
            self.Rotator3:SetGoal(-20):SetSpeed(100)
        end
        self:ForkThread(function()
        	WaitSeconds(1)

        	self.Rotator3:SetGoal(20):SetSpeed(100)
        	WaitSeconds(1)
        	self.Rotator3:SetGoal(0):SetSpeed(100)
        end)        
    end,

	DestroyOnKilled = false,

}

TypeClass = MCPU4LAB