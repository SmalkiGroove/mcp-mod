local TEnergyCreationUnit = import('/lua/terranunits.lua').TEnergyCreationUnit


MCPU2BWHYDRO = Class( TEnergyCreationUnit ) {
    DestructionPartsHighToss = {'Exhaust01',},
    DestructionPartsLowToss = {'Exhaust01','Exhaust02','Exhaust03','Exhaust04','Exhaust05',},
    DestructionPartsChassisToss = {'UEB1102'},
    AirEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    AirEffectsBones = {'Exhaust01'},
    WaterEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    WaterEffectsBones = {'Exhaust01'},

    OnStartBuild = function(self, unitBeingBuilt, order)
        TEnergyCreationUnit.OnStartBuild(self, unitBeingBuilt, order)		
        if not self.AnimationManipulator then return end				
        self.AnimationManipulator:SetRate(0)
        self.AnimationManipulator:Destroy()
        self.AnimationManipulator = nil
    end,

    PlayActiveAnimation = function(self)
        TEnergyCreationUnit.PlayActiveAnimation(self)
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
            --self.Effect1 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/hook/effects/emitters/uec1501_smoke_03_emit.bp')
            --self.Trash:Add(self.Effecct1)				
        end
        self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationOpen, true)
    end,

    OnProductionPaused = function(self)
        TEnergyCreationUnit.OnProductionPaused(self)
        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(0)
    end,

    OnProductionUnpaused = function(self)
        TEnergyCreationUnit.OnProductionUnpaused(self)

        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(1)

    end,
}

TypeClass = MCPU2BWHYDRO
