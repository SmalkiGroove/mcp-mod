local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon

MRB2102 = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(CAAAutocannon) {
	},
    },
}

TypeClass = MRB2102