local AssaultTorpedoSubProjectile = import('/mods/MCP/lua/MCPProjectiles.lua').AssaultTorpedoSubProjectile

CANKrilTorpedo01 = Class(AssaultTorpedoSubProjectile) {

    FxEnterWater = {'/effects/emitters/water_splash_ripples_ring_01_emit.bp',
                    '/effects/emitters/water_splash_plume_01_emit.bp',
                },
    TrailDelay = 2,

    OnEnterWater = function(self)
        AssaultTorpedoSubProjectile.OnEnterWater(self)
        local army = self:GetArmy()
        for i in self.FxEnterWater do
            CreateEmitterAtEntity(self,army,self.FxEnterWater[i])
        end
    end,
}

TypeClass = CANKrilTorpedo01
