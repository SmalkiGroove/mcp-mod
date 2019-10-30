local TMobileFactoryUnit = import('/lua/terranunits.lua').TMobileFactoryUnit
local WeaponsFile = import('/lua/terranweapons.lua')

local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local TAAFlakArtilleryCannon = WeaponsFile.TAAFlakArtilleryCannon
local TIFCruiseMissileLauncher = WeaponsFile.TIFCruiseMissileLauncher
local TDFHiroPlasmaCannon = WeaponsFile.TDFHiroPlasmaCannon
local TANTorpedoAngler = WeaponsFile.TANTorpedoAngler
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon

local EffectTemplate = import('/lua/EffectTemplates.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')


MCPU4LXF = Class(TMobileFactoryUnit) {
	Weapons = {
        RightTurret01 = Class(TDFGaussCannonWeapon) {},
        LeftTurret01 = Class(TDFGaussCannonWeapon) {},
		CenterTurret01 = Class(TDFGaussCannonWeapon) {},
        RightRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        LeftRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        Torpedo = Class(TANTorpedoAngler) {},
		MainGun = Class(TIFArtilleryWeapon) {
            FxMuzzleFlashScale = 1.8,
        },
		AAGun1 = Class(TAAFlakArtilleryCannon) {
            PlayOnlyOneSoundCue = true,
        },
		AAGun2 = Class(TAAFlakArtilleryCannon) {
            PlayOnlyOneSoundCue = true,
        },
		CruiseMissile01 = Class(TIFCruiseMissileLauncher) {},
		TMD1 = Class(TDFHiroPlasmaCannon) {},
		TMD2 = Class(TDFHiroPlasmaCannon) {},
		
    },
}

TypeClass = MCPU4LXF