local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local CWeapons = import('/lua/cybranweapons.lua')
local CDFHeavyDisintegratorWeapon = CWeapons.CDFHeavyDisintegratorWeapon

MCPC1BRFA = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(CDFHeavyDisintegratorWeapon) {
            FxMuzzleFlashScale = 1.85,
		},
	},
}

TypeClass = MCPC1BRFA