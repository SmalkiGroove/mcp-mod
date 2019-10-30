local AShieldStructureUnit = import('/lua/aeonunits.lua').AShieldStructureUnit

MCPA1BSHIELD = Class(AShieldStructureUnit) {
    AmbientEffects = 'AT1PowerAmbient',

   #ShieldEffects = {
   #     '/effects/emitters/aeon_shield_generator_t2_01_emit.bp',
   #     '/effects/emitters/aeon_shield_generator_t2_02_emit.bp',
   #     '/effects/emitters/aeon_shield_generator_t3_03_emit.bp',
   #     '/effects/emitters/aeon_shield_generator_t3_04_emit.bp',
   # },
    


    OnCreate = function(self)
        AShieldStructureUnit.OnCreate(self)
        self.Sliders = {
            Slider1 = CreateSlider(self, 'B01'),
            Slider2 = CreateSlider(self, 'B02'),
            Slider3 = CreateSlider(self, 'B03'),
            Slider4 = CreateSlider(self, 'B04'),
            Slider5 = CreateSlider(self, 'B05'),
            Slider6 = CreateSlider(self, 'B06'),
            Slider7 = CreateSlider(self, 'B07'),
            Slider8 = CreateSlider(self, 'B08'),

            Slider9 = CreateSlider(self, 'B09'),
            Slider10 = CreateSlider(self, 'B10'),
            Slider11 = CreateSlider(self, 'B11'),
            Slider12 = CreateSlider(self, 'B12'),
            Slider13 = CreateSlider(self, 'B13'),
            Slider14 = CreateSlider(self, 'B14'),
            Slider15 = CreateSlider(self, 'B15'),
            Slider16 = CreateSlider(self, 'B16'),

            Slider17 = CreateSlider(self, 'Sphere'),
        }
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'G01', 'y', nil, 0, 60, 360):SetTargetSpeed(0),
            Spinner2 = CreateRotator(self, 'G02', 'y', nil, 0, 30, 360):SetTargetSpeed(0),
        }
        for k, v in self.Sliders do
            self.Trash:Add(v)
        end
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        AShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
        
        ChangeState(self, self.OpeningState)
    end,

    OnDestroy = function(self)
        AShieldStructureUnit.OnDestroy(self)
        ChangeState(self, self.DeadState)
    end,

    OpeningState = State {
        Main = function(self)
            if self:GetBlueprint().Audio.Activate then
                self:PlaySound(self:GetBlueprint().Audio.Activate)
            end

            self.Sliders.Slider1:SetGoal(0,20,0)
            self.Sliders.Slider1:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider2:SetGoal(0,20,0)
            self.Sliders.Slider2:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider3:SetGoal(0,20,0)
            self.Sliders.Slider3:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider4:SetGoal(0,20,0)
            self.Sliders.Slider4:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider5:SetGoal(0,20,0)
            self.Sliders.Slider5:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider6:SetGoal(0,20,0)
            self.Sliders.Slider6:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider7:SetGoal(0,20,0)
            self.Sliders.Slider7:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider8:SetGoal(0,20,0)
            self.Sliders.Slider8:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider9:SetGoal(0,10,0)
            self.Sliders.Slider9:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider10:SetGoal(0,10,0)
            self.Sliders.Slider10:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider11:SetGoal(0,10,0)
            self.Sliders.Slider11:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider12:SetGoal(0,10,0)
            self.Sliders.Slider12:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider13:SetGoal(0,10,0)
            self.Sliders.Slider13:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider14:SetGoal(0,10,0)
            self.Sliders.Slider14:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider15:SetGoal(0,10,0)
            self.Sliders.Slider15:SetSpeed(6)
            WaitSeconds(1)

            self.Sliders.Slider16:SetGoal(0,10,0)
            self.Sliders.Slider16:SetSpeed(6)
            for k, v in self.Sliders do
                WaitFor(v)
            end
            for k, v in self.Spinners do
                v:SetSpinDown(false)
            end
            self.Spinners.Spinner1:SetTargetSpeed(180)
            self.Spinners.Spinner2:SetTargetSpeed(-180)
            WaitSeconds(5)
            self.Sliders.Slider17:SetGoal(0,12,0)
            self.Sliders.Slider17:SetSpeed(6)
            WaitSeconds(1)
            ChangeState(self, self.IdleOpenState)
        end,
    },

    IdleOpenState = State {
        Main = function(self)
            self.Effect1 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/aeon_shield_generator_t2_01_emit.bp')
            self.Trash:Add(self.Effecct1)
            self.Effect2 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/aeon_shield_generator_t2_02_emit.bp')
            self.Trash:Add(self.Effecct2)
            self.Effect3 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/aeon_shield_generator_t2_03_emit.bp')
            self.Trash:Add(self.Effecct3)
        end,
    },


    ClosingState = State {
        Main = function(self)
            self.Sliders.Slider17:SetGoal(0,0,0)
            self.Sliders.Slider17:SetSpeed(6)
            WaitSeconds(1)
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
            self.Sliders.Slider16:SetGoal(0,0,0)
            self.Sliders.Slider16:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider15:SetGoal(0,0,0)
            self.Sliders.Slider15:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider14:SetGoal(0,0,0)
            self.Sliders.Slider14:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider13:SetGoal(0,0,0)
            self.Sliders.Slider13:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider12:SetGoal(0,0,0)
            self.Sliders.Slider12:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider11:SetGoal(0,0,0)
            self.Sliders.Slider11:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider10:SetGoal(0,0,0)
            self.Sliders.Slider10:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider9:SetGoal(0,0,0)
            self.Sliders.Slider9:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider8:SetGoal(0,0,0)
            self.Sliders.Slider8:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider7:SetGoal(0,0,0)
            self.Sliders.Slider7:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider6:SetGoal(0,0,0)
            self.Sliders.Slider6:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider5:SetGoal(0,0,0)
            self.Sliders.Slider5:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider4:SetGoal(0,0,0)
            self.Sliders.Slider4:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider3:SetGoal(0,0,0)
            self.Sliders.Slider3:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider2:SetGoal(0,0,0)
            self.Sliders.Slider2:SetSpeed(15)
            WaitSeconds(1)
            self.Sliders.Slider1:SetGoal(0,0,0)
            self.Sliders.Slider1:SetSpeed(15)
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
            AShieldStructureUnit.OnDamage(self, instigator, amount, vector, damageType)
            self.DamageSeconds = 10
        end,
    },

    DeadState = State {
        Main = function(self)

        end,
    },

    


    OnShieldEnabled = function(self)
        local bp = self:GetBlueprint()
        if not self.Rotator then
            self.Rotator = CreateRotator(self, 'Sphere', 'z', nil, 0, 50, 0)
            self.Trash:Add(self.Rotator)
        end
        self.Rotator:SetSpinDown(false)
        self.Rotator:SetTargetSpeed(self.RotateSpeed)
        ChangeState(self, self.OpeningState)
    end,

    OnShieldDisabled = function(self)
        AShieldStructureUnit.OnShieldDisabled(self)
            ChangeState(self, self.ClosingState)
    end,
}

TypeClass = MCPA1BSHIELD