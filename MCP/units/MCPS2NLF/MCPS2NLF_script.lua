local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local Buff                 = import('/lua/sim/Buff.lua')
local EffectTemplate       = import('/lua/EffectTemplates.lua')
local Entity               = import('/lua/sim/Entity.lua').Entity
local AIUtils              = import('/lua/AI/aiutilities.lua')


MCPS2NLF = Class(SSeaUnit) {

    ShieldEffects = {
        '/effects/emitters/seraphim_regenerative_aura_01_emit.bp',
    },


    # Copy of XSL0001_script's RegenBuffThread with slight alterations (Enhancement and RegenField)
    RegenBuffThread = function(self)
        while not self:IsDead() do
            # Get friendly units in the area (including self)
            local units = AIUtils.GetOwnUnitsAroundPoint(self:GetAIBrain(), categories.ALLUNITS, self:GetPosition(), self:GetBlueprint().RegenAura.RegenRadius)

            # Give them a 5 second regen buff
            for _,unit in units do
                Buff.ApplyBuff(unit, 'SeraphimRegenFieldMoo')
            end

            #Wait 5 seconds
            WaitSeconds(5)
        end
    end,


    OnStopBeingBuilt = function( self, builder, layer )

        SSeaUnit.OnStopBeingBuilt( self, builder, layer )

   self.ShieldEffectsBag = {}
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
                    RegenPercent = {
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

}


TypeClass = MCPS2NLF
