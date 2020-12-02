local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local Buff                 = import('/lua/sim/Buff.lua')
local AIUtils              = import('/lua/AI/aiutilities.lua')


MCPS2NLF = Class(SSeaUnit) {

    ShieldEffects = {
        '/effects/emitters/seraphim_regenerative_aura_01_emit.bp',
    },


    -- Copy of XSL0001_script's RegenBuffThread with slight alterations (Enhancement and RegenField)
    RegenBuffThread = function(self)
        while self:GetScriptBit('RULEUTC_ShieldToggle') and not self:IsDead() do
            -- Get friendly units in the area (including self)
            local units = AIUtils.GetOwnUnitsAroundPoint(self:GetAIBrain(), categories.ALLUNITS, self:GetPosition(), self:GetBlueprint().RegenAura.RegenRadius)

            -- Give them a 5 second regen buff
            for _,unit in units do
                Buff.ApplyBuff(unit, 'SeraphimRegenFieldMoo')
            end

            -- Wait 5 seconds
            WaitSeconds(5)
        end
    end,


    OnStopBeingBuilt = function( self, builder, layer )

        SSeaUnit.OnStopBeingBuilt( self, builder, layer )

        self.ShieldEffectsBag = {}
        
        self:SetScriptBit('RULEUTC_ShieldToggle', true)
        self:ForkThread(self.ResourceThread)
    end,


    OnScriptBitSet = function(self, bit)
        SSeaUnit.OnScriptBitSet(self, bit)
        if bit == 0 then
        self:SetMaintenanceConsumptionActive()
        self:ForkThread(self.RegenBuffThread)
        end
    end,

    OnScriptBitClear = function(self, bit)
        SSeaUnit.OnScriptBitClear(self, bit)
        if bit == 0 then
        self:SetMaintenanceConsumptionInactive()
        end
    end,


    OnCreate = function(self)

        SSeaUnit.OnCreate(self)

        if not self.ShieldEffectsBag then
            self.ShieldEffectsBag = {}
        end

        local bpRA = self:GetBlueprint().RegenAura

        if not Buffs['SeraphimRegenFieldMoo'] then
            BuffBlueprint {
                Name        = 'SeraphimRegenFieldMoo',
                DisplayName = 'SeraphimRegenFieldMoo',
                BuffType    = 'COMMANDERAURA',
                Stacks      = 'REPLACE',
                Duration    = 5,
                Affects     = {
                    Regen = {
                        Add   = 0,
                        Mult  = bpRA.RegenPerSecond or 0.1,
                        Ceil  = bpRA.RegenCeiling,
                        Floor = bpRA.RegenFloor,
                    },
                },
            }
        end

        table.insert( self.ShieldEffectsBag, CreateAttachedEmitter( self, 'XSS0304', self:GetArmy(), '/effects/emitters/seraphim_regenerative_aura_01_emit.bp' ) )
        self.RegenThreadHandle = self:ForkThread(self.RegenBuffThread)

    end,




    ResourceThread = function(self)
        if not self.Dead then
            local energy = self:GetAIBrain():GetEconomyStored('Energy')
            if  energy <= 10 then
                self:SetScriptBit('RULEUTC_ShieldToggle', false)
                self:ForkThread(self.ResourceThread2)
            else
                self:ForkThread(self.EconomyWaitUnit)
            end
        end
    end,

    EconomyWaitUnit = function(self)
        if not self.Dead then
        WaitSeconds(2)
            if not self.Dead then
                self:ForkThread(self.ResourceThread)
            end
        end
    end,

    ResourceThread2 = function(self)
        if not self.Dead then
            local energy = self:GetAIBrain():GetEconomyStored('Energy')
            if  energy > 300 then
                self:SetScriptBit('RULEUTC_ShieldToggle', true)
                self:ForkThread(self.ResourceThread)
            else
                self:ForkThread(self.EconomyWaitUnit2)
            end
        end
    end,

    EconomyWaitUnit2 = function(self)
        if not self.Dead then
        WaitSeconds(2)
            if not self.Dead then
                self:ForkThread(self.ResourceThread2)
            end
        end
    end,

}


TypeClass = MCPS2NLF
