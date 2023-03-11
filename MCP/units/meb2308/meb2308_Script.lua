local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MEB2308 = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
			FxMuzzleFlashScale = 6, 
        },
    },
}

TypeClass = MEB2308