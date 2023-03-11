local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MRB2202 = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
			FxMuzzleFlashScale = 2.0, 
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
	    },
    },
}

TypeClass = MRB2202