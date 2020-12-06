local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

local Entity = import('/lua/sim/Entity.lua').Entity


MES0106 = Class(TSeaUnit) {

    Weapons = {
		    MainGun = Class(TIFArtilleryWeapon) {},
        UpgradeGun01 = Class(TDFGaussCannonWeapon) {},
        UpgradeGun02 = Class(TDFGaussCannonWeapon) {},
        UpgradeAAGun01 = Class(TAALinkedRailgun) {},
		    UpgradeAAGun02 = Class(TAALinkedRailgun) {},
    },

    OnCreate = function(self)
        TSeaUnit.OnCreate(self)
        self:HideBone('Origine01_01', true)
        self:HideBone('Origine02_01', true)
    end,
	
    OnStopBeingBuilt = function(self, builder, layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, 360, 0, 180))
    end,
	

}

TypeClass = MES0106