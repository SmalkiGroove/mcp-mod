local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local Entity = import('/lua/sim/Entity.lua').Entity

MES0102 = Class(TSeaUnit) {

    Weapons = {
		MainGun = Class(TDFGaussCannonWeapon) {},
        AAGun = Class(TAALinkedRailgun) {},		
    },

}

TypeClass = MES0102