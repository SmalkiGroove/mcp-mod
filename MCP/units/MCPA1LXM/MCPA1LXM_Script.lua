local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon

MCPA1LXM = Class(CWalkingLandUnit) {

    Weapons = {
        DeathWeapon = Class(SCUDeathWeapon) {
	},
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.2,   
            FxMuzzleFlash = EffectTemplate.AOblivionCannonMuzzleFlash02,
	}, 
        MainGun2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1,   
            FxMuzzleFlash = EffectTemplate.AIFBallisticMortarFlash02,
	}, 
    },
OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = MCPA1LXM