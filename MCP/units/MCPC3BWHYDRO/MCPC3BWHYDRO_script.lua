local CEnergyCreationUnit = import('/lua/cybranunits.lua').CEnergyCreationUnit

MCPC3BWHYDRO = Class(CEnergyCreationUnit) {
    AirEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    AirEffectsBones = {'Exhaust01', 'Exhaust02', 'Exhaust03', 'Exhaust04',},
    WaterEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    WaterEffectsBones = {'Exhaust01', 'Exhaust02', 'Exhaust03', 'Exhaust04',},

    OnStartBuild = function(self, unitBeingBuilt, order)
        CEnergyCreationUnit.OnStartBuild(self, unitBeingBuilt, order)		
        if not self.AnimationManipulator then return end				
        self.AnimationManipulator:SetRate(0)
        self.AnimationManipulator:Destroy()
        self.AnimationManipulator = nil
    end,

    PlayActiveAnimation = function(self)
        CEnergyCreationUnit.PlayActiveAnimation(self)
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
            self.Effect1 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/geyser_01_emit.bp')
			self.Effect1 = CreateAttachedEmitter(self,'Exhaust02',self:GetArmy(), '/effects/emitters/geyser_01_emit.bp')
			self.Effect1 = CreateAttachedEmitter(self,'Exhaust03',self:GetArmy(), '/effects/emitters/geyser_01_emit.bp')
			self.Effect1 = CreateAttachedEmitter(self,'Exhaust04',self:GetArmy(), '/effects/emitters/hydrocarbon_smoke_01_emit.bp')
			self.Effect2 = CreateAttachedEmitter(self,'URB02',self:GetArmy(), '/effects/emitters/underwater_vent_bubbles_01_emit.bp')
			self.Effect2 = CreateAttachedEmitter(self,'URB02',self:GetArmy(), '/effects/emitters/geyser_01_emit.bp')
            self.Trash:Add(self.Effecct1)				
        end
        self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationOpen, true)
    end,

    OnProductionPaused = function(self)
        CEnergyCreationUnit.OnProductionPaused(self)
        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(0)
    end,

    OnProductionUnpaused = function(self)
        CEnergyCreationUnit.OnProductionUnpaused(self)

        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(1)

    end,
}

TypeClass = MCPC3BWHYDRO