local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

MEB2107 = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TIFArtilleryWeapon) {
        },
	},
}

TypeClass = MEB2107