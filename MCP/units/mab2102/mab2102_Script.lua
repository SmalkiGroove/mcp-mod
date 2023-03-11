local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MAB2102 = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.2,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
        },
    },
}

TypeClass = MAB2102