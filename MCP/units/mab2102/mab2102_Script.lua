local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local AWeapons = import('/lua/aeonweapons.lua')
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local AAAZealotMissileWeapon = AWeapons.AAAZealotMissileWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MAB2102 = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.2,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
        },
        AntiAirMissiles = Class(AAAZealotMissileWeapon) {
	},
    },
}

TypeClass = MAB2102