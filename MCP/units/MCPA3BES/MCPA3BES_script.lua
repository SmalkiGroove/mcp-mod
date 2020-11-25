local AConstructionStructureUnit = import('/lua/aeonunits.lua').AConstructionStructureUnit

MCPA3BES = Class(AConstructionStructureUnit) {

    OnStartBuild = function(self, unitBeingBuilt, order)
        AConstructionStructureUnit.OnStartBuild(self, unitBeingBuilt, order)
        --self.BuildingOpenAnimManip:SetRate(1)
        self.PanelsOpen = true
    end,

    OnStopBuild = function(self, unitBeingBuilt)
        AConstructionStructureUnit.OnStopBuild(self, unitBeingBuilt)
        --self.BuildingOpenAnimManip:SetRate(-1)
        self.PanelsOpen = nil
    end,

    PlayAnimationThread = function(self, anim, rate)
        if anim == 'AnimationDeath' then
            if self.PanelsOpen then
                local bp = __blueprints.mcpa3bes.Display[anim]
                self.DeathAnimManip = CreateAnimator(self)
                self.DeathAnimManip:PlayAnim(bp[1].Animation):SetRate(math.random(bp[1].AnimationRateMin, bp[1].AnimationRateMax))
                self.Trash:Add(self.DeathAnimManip)
                WaitFor(self.DeathAnimManip)
            end
        else
            AConstructionStructureUnit.PlayAnimationThread(self, anim, rate)
        end
    end,
}

TypeClass = MCPA3BES
