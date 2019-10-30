local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAAShleoCannonWeapon = SeraphimWeapons.SAAShleoCannonWeapon

MCPS2ACF = Class(SAirUnit) {
    Weapons = {
        ShleoAAGun01 = Class(SAAShleoCannonWeapon) {
	  FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_02_emit.bp',},
        },
    },
}

TypeClass = MCPS2ACF