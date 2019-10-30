local NullShell = import('/lua/sim/defaultprojectiles.lua').NullShell
local BlackOpsBalanceEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

BasiliskNukeEffect03 = Class(NullShell) {
    
    OnCreate = function(self)
        NullShell.OnCreate(self)
        self:ForkThread(self.EffectThread)
    end,
    
    EffectThread = function(self)
        local army = self:GetArmy()
        for k, v in BlackOpsBalanceEffectTemplate.BasiliskNukeHeadEffects03 do
            CreateAttachedEmitter(self, -1, army, v) 
        end            
    
        WaitSeconds(6)
        for k, v in BlackOpsBalanceEffectTemplate.BasiliskNukeHeadEffects02 do
            CreateAttachedEmitter(self, -1, army, v) 
        end    
    end,      
}

TypeClass = BasiliskNukeEffect03
