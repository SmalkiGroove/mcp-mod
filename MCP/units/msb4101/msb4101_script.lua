local SShieldStructureUnit = import('/lua/seraphimunits.lua').SShieldStructureUnit

MSB4101 = Class(SShieldStructureUnit) {
    
   # ShieldEffects = {
   #             '/effects/emitters/seraphim_shield_generator_t2_01_emit.bp',
   #             '/effects/emitters/seraphim_shield_generator_t2_01_emit.bp',
   #             '/effects/emitters/seraphim_shield_generator_t2_01_emit.bp',
   #             },



    OnCreate = function(self)
        SShieldStructureUnit.OnCreate(self)
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'B01', 'y', nil, 0, 60, 360):SetTargetSpeed(0),
        }
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        SShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
        
        ChangeState(self, self.OpeningState)
    end,

    OnDestroy = function(self)
        SShieldStructureUnit.OnDestroy(self)
        ChangeState(self, self.DeadState)
    end,

    OpeningState = State {
        Main = function(self)
            if self:GetBlueprint().Audio.Activate then
                self:PlaySound(self:GetBlueprint().Audio.Activate)
            end

            #for k, v in self.Spinners do
            #    v:SetSpinDown(false)
            #end
            self.Spinners.Spinner1:SetTargetSpeed(180)
            WaitSeconds(5)
            ChangeState(self, self.IdleOpenState)
        end,
    },

    IdleOpenState = State {
        Main = function(self)
            self.Effect1 = CreateAttachedEmitter(self,'Exhaust05',self:GetArmy(), '/effects/emitters/seraphim_shield_generator_t2_01_emit.bp')
            self.Trash:Add(self.Effecct1)
            self.Effect2 = CreateAttachedEmitter(self,'Exhaust01',self:GetArmy(), '/effects/emitters/seraphim_shield_generator_t2_03_emit.bp')
            self.Trash:Add(self.Effecct2)
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
            SShieldStructureUnit.OnDamage(self, instigator, amount, vector, damageType)
            self.DamageSeconds = 10
        end,
    },

    DeadState = State {
        Main = function(self)

        end,
    },

    


    OnShieldEnabled = function(self)
        SShieldStructureUnit.OnShieldEnabled(self)
            ChangeState(self, self.OpeningState)
    end,

    OnShieldDisabled = function(self)
        SShieldStructureUnit.OnShieldDisabled(self)
            ChangeState(self, self.ClosingState)
    end,


}
TypeClass = MSB4101



