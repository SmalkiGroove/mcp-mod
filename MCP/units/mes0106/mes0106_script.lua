local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local Entity = import('/lua/sim/Entity.lua').Entity

MES0106 = Class(TSeaUnit) {

    Weapons = {
		MainGun = Class(TIFArtilleryWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, 360, 0, 180))
    end,
}

TypeClass = MES0106