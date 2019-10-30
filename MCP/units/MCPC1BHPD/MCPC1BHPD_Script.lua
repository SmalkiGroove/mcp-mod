local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon

MCPC1BHPD = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(CAAAutocannon) {
	},
    },
}

TypeClass = MCPC1BHPD