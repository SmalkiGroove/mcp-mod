local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MRB2308 = Class(CStructureUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
		    FxMuzzleFlashScale = 8,
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
        },
    },
}

TypeClass = MRB2308
