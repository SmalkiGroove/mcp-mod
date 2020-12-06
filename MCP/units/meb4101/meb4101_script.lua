local TShieldStructureUnit = import('/lua/terranunits.lua').TShieldStructureUnit

MEB4101 = Class(TShieldStructureUnit) {


    OnCreate = function(self)
        TShieldStructureUnit.OnCreate(self)
        self.Sliders = {
            Slider1 = CreateSlider(self, 'B03'),
            Slider2 = CreateSlider(self, 'B04'),
            Slider3 = CreateSlider(self, 'B05'),
            Slider4 = CreateSlider(self, 'B06'),

            Slider11 = CreateSlider(self, 'B33'),
            Slider22 = CreateSlider(self, 'B44'),
            Slider33 = CreateSlider(self, 'B55'),
            Slider44 = CreateSlider(self, 'B66'),
        }
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'B01', 'y', nil, 0, 60, 360):SetTargetSpeed(0),
            Spinner2 = CreateRotator(self, 'B02', 'y', nil, 0, 30, 360):SetTargetSpeed(0),
            Spinner3 = CreateRotator(self, 'B22', 'y', nil, 0, 30, 360):SetTargetSpeed(0),
        }
        for k, v in self.Sliders do
            self.Trash:Add(v)
        end
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        TShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
        
        ChangeState(self, self.OpeningState)
    end,

    OnDestroy = function(self)
        TShieldStructureUnit.OnDestroy(self)
        ChangeState(self, self.DeadState)
    end,

    #OnDamage = function(self, instigator, amount, vector, damageType)
    #    TEnergyCreationUnit.OnDamage(self, instigator, amount, vector, damageType)
    #    self.DamageSeconds = 10
    #    ChangeState(self, self.ClosingState)
    #end,

    OpeningState = State {
        Main = function(self)
            if self:GetBlueprint().Audio.Activate then
                self:PlaySound(self:GetBlueprint().Audio.Activate)
            end

            self.Sliders.Slider11:SetGoal(0,0,-10)
            self.Sliders.Slider11:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider22:SetGoal(-10,0,0)
            self.Sliders.Slider22:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider33:SetGoal(0,0,10)
            self.Sliders.Slider33:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider44:SetGoal(10,0,0)
            self.Sliders.Slider44:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider1:SetGoal(0,0,-6)
            self.Sliders.Slider1:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider2:SetGoal(-6,0,0)
            self.Sliders.Slider2:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider3:SetGoal(0,0,6)
            self.Sliders.Slider3:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider4:SetGoal(6,0,0)
            self.Sliders.Slider4:SetSpeed(6)
            for k, v in self.Sliders do
                WaitFor(v)
            end
            for k, v in self.Spinners do
                v:SetSpinDown(false)
            end
            self.Spinners.Spinner1:SetTargetSpeed(180)
            self.Spinners.Spinner2:SetTargetSpeed(-90)
            self.Spinners.Spinner3:SetTargetSpeed(90)
            WaitSeconds(5)
            ChangeState(self, self.IdleOpenState)
        end,
    },

    IdleOpenState = State {
        Main = function(self)
            self.Effect1 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/economy_electricity_01_emit.bp')
            self.Trash:Add(self.Effecct1)
            self.Effect2 = CreateAttachedEmitter(self,'Exhaust03',self:GetArmy(), '/effects/emitters/economy_electricity_01_emit.bp')
            self.Trash:Add(self.Effecct2)
            self.Effect3 = CreateAttachedEmitter(self,'Exhaust04',self:GetArmy(), '/effects/emitters/terran_shield_generator_t2_01_emit.bp')
            self.Trash:Add(self.Effecct3)
            self.Effect4 = CreateAttachedEmitter(self,'Exhaust04',self:GetArmy(), '/effects/emitters/terran_shield_generator_t2_02_emit.bp')
            self.Trash:Add(self.Effecct4)
        end,
    },


    ClosingState = State {
        Main = function(self)
            for k, v in self.Spinners do
                v:SetSpinDown(true)
                v:SetTargetSpeed(360)
            end
            for k,v in self.Spinners do
                WaitFor(v)
            end
            if self.Effect1 then
                self.Effect1:Destroy()
            end
            if self.Effect2 then
                self.Effect2:Destroy()
            end
            if self.Effect3 then
                self.Effect3:Destroy()
            end
            if self.Effect4 then
                self.Effect4:Destroy()
            end
            self.Sliders.Slider4:SetGoal(0,0,0)
            self.Sliders.Slider4:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider3:SetGoal(0,0,0)
            self.Sliders.Slider3:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider2:SetGoal(0,0,0)
            self.Sliders.Slider2:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider1:SetGoal(0,0,0)
            self.Sliders.Slider1:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider44:SetGoal(0,0,0)
            self.Sliders.Slider44:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider33:SetGoal(0,0,0)
            self.Sliders.Slider33:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider22:SetGoal(0,0,0)
            self.Sliders.Slider22:SetSpeed(10)
            WaitSeconds(1)
            self.Sliders.Slider11:SetGoal(0,0,0)
            self.Sliders.Slider11:SetSpeed(10)
            for k, v in self.Sliders do
                WaitFor(v)
            end


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
        TShieldStructureUnit.OnShieldEnabled(self)
            ChangeState(self, self.OpeningState)
    end,

    OnShieldDisabled = function(self)
        TShieldStructureUnit.OnShieldDisabled(self)
            ChangeState(self, self.ClosingState)
    end,
}

TypeClass = MEB4101