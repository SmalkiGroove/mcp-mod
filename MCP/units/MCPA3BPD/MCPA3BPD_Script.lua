local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local MiniPhasonLaser = import('/mods/MCP/lua/MCPWeapons.lua').MiniPhasonLaser

MCPA3BPD = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(MiniPhasonLaser){},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        AStructureUnit.OnStopBeingBuilt(self,builder,layer)
        if not self.SpinManip then 
            self.SpinManip = CreateRotator(self, 'Rotator', 'y', nil, 50, 50, 50)
            self.Trash:Add(self.SpinManip)
        end
                
        if self.SpinManip then
            self.SpinManip:SetTargetSpeed(500)
        end
    end,

}

TypeClass = MCPA3BPD
