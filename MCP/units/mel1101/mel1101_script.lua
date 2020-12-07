local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TAAGinsuRapidPulseWeapon = WeaponsFile.TAAGinsuRapidPulseWeapon
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MEL1101 = Class(TWalkingLandUnit) {

    Weapons = {
        RightBeam = Class(TAAGinsuRapidPulseWeapon) {},
        rocket = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.4,
        },
        DeathWeapon = Class(SCUDeathWeapon) {},
        smallerguns = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.4,
            FxMuzzleFlash = EffectTemplate.OhCannonMuzzleFlash02,
        },
        BigGun1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.4,
            FxMuzzleFlash = EffectTemplate.OhCannonMuzzleFlash02,
        },
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        TWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
    end,

}

TypeClass = MEL1101