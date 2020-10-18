-- UEF Small Yield Nuclear Bomb

local CybranHailfire01Projectile = import('/mods/MCP/lua/MCPProjectiles.lua').CybranHailfire01ChildProjectile

CybranHailfire01child = Class(CybranHailfire01Projectile) {
   OnCreate = function(self)
        CybranHailfire01Projectile.OnCreate(self)
        for k, v in self.FxTrails do
            CreateEmitterOnEntity(self,self:GetArmy(),v)
        end
   end,
}

TypeClass = CybranHailfire01child
