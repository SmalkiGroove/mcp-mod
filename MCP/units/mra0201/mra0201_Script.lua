local CAirUnit = import('/lua/cybranunits.lua').CAirUnit
local CWeapons = import('/lua/cybranweapons.lua')
local CDFHeavyDisintegratorWeapon = CWeapons.CDFHeavyDisintegratorWeapon

MRA0201 = Class(CAirUnit) {
    Weapons = {
        aircraft = Class(CDFHeavyDisintegratorWeapon) {
            FxMuzzleFlashScale = 0,
	},
        AutoCannon = Class(CDFHeavyDisintegratorWeapon) {
            FxMuzzleFlashScale = 0.3,
	},
        AutoCannon2 = Class(CDFHeavyDisintegratorWeapon) {
            FxMuzzleFlashScale = 0.3,
	},
    },
}

TypeClass = MRA0201
