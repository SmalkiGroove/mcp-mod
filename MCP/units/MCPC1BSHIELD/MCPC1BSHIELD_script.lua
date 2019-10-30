local CEnergyCreationUnit = import('/lua/cybranunits.lua').CEnergyCreationUnit
local CShieldStructureUnit = import('/lua/cybranunits.lua').CShieldStructureUnit

MCPC1BSHIELD = Class(CShieldStructureUnit) {
    
    ShieldEffects = {
                '/effects/emitters/cybran_shield_01_generator_01_emit.bp',
                '/effects/emitters/cybran_shield_01_generator_02_emit.bp',
                '/effects/emitters/cybran_shield_01_generator_03_emit.bp',
                },


    OnCreate = function(self)
        CShieldStructureUnit.OnCreate(self)
        self.Sliders = {
            Slider1 = CreateSlider(self, 'B01'),
            Slider2 = CreateSlider(self, 'B02'),
            Slider3 = CreateSlider(self, 'B03'),
            Slider4 = CreateSlider(self, 'B04'),
        }
        for k, v in self.Sliders do
            self.Trash:Add(v)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        CShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
        
        ChangeState(self, self.OpeningState)
    end,

    OnDestroy = function(self)
        CShieldStructureUnit.OnDestroy(self)
        ChangeState(self, self.DeadState)
    end,

    OpeningState = State {
        Main = function(self)
            if self:GetBlueprint().Audio.Activate then
                self:PlaySound(self:GetBlueprint().Audio.Activate)
            end

            self.Sliders.Slider1:SetGoal(0,12,0)
            self.Sliders.Slider1:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider2:SetGoal(0,12,0)
            self.Sliders.Slider2:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider3:SetGoal(0,12,0)
            self.Sliders.Slider3:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider4:SetGoal(0,12,0)
            self.Sliders.Slider4:SetSpeed(6)
            for k, v in self.Sliders do
                WaitFor(v)
            end
            WaitSeconds(1)
            ChangeState(self, self.IdleOpenState)
        end,
    },

    IdleOpenState = State {
        Main = function(self)
            self.Effect1 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/cybran_shield_01_generator_01_emit.bp')
            self.Trash:Add(self.Effecct1)
            self.Effect2 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/cybran_shield_01_generator_02_emit.bp')
            self.Trash:Add(self.Effecct2)
            self.Effect3 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/cybran_shield_01_generator_03_emit.bp')
            self.Trash:Add(self.Effecct3)
        end,
    },


    ClosingState = State {
        Main = function(self)
            if self.Effect1 then
                self.Effect1:Destroy()
            end
            if self.Effect2 then
                self.Effect2:Destroy()
            end
            if self.Effect3 then
                self.Effect3:Destroy()
            end
            self.Sliders.Slider4:SetGoal(0,0,0)
            self.Sliders.Slider4:SetSpeed(4)
            WaitSeconds(1)
            self.Sliders.Slider3:SetGoal(0,0,0)
            self.Sliders.Slider3:SetSpeed(4)
            WaitSeconds(1)
            self.Sliders.Slider2:SetGoal(0,0,0)
            self.Sliders.Slider2:SetSpeed(4)
            WaitSeconds(1)
            self.Sliders.Slider1:SetGoal(0,0,0)
            self.Sliders.Slider1:SetSpeed(4)
            #for k, v in self.Sliders do
            #    WaitFor(v)
            WaitSeconds(5)
            #end
        end,

    },

    ClosedIdleState = State {
        Main = function(self)
            while self.DamageSeconds > 0 do
                WaitSeconds(1)
                self.DamageSeconds = self.DamageSeconds - 1
            end
            ChangeState(self, self.OpeningState)
        end,

        OnDamage = function(self, instigator, amount, vector, damageType)
            TShieldStructureUnit.OnDamage(self, instigator, amount, vector, damageType)
            self.DamageSeconds = 10
        end,
    },

    DeadState = State {
        Main = function(self)

        end,
    },

    


    OnShieldEnabled = function(self)
        CShieldStructureUnit.OnShieldEnabled(self)
            ChangeState(self, self.OpeningState)
    end,

    OnShieldDisabled = function(self)
        CShieldStructureUnit.OnShieldDisabled(self)
            ChangeState(self, self.ClosingState)
    end,
}

TypeClass = MCPC1BSHIELD