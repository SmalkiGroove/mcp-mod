local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAAShleoCannonWeapon = SeraphimWeapons.SAAShleoCannonWeapon

MSA0201 = Class(SAirUnit) {
    Weapons = {
        ShleoAAGun01 = Class(SAAShleoCannonWeapon) {
	  FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_02_emit.bp',},
        },
    },
}

TypeClass = MSA0201