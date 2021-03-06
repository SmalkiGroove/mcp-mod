local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile = import('/lua/cybranweapons.lua')
local WeaponsFile2 = import('/lua/terranweapons.lua')
local CCannonMolecularWeapon = WeaponsFile.CCannonMolecularWeapon
local TDFGaussCannonWeapon = WeaponsFile2.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MRL0102 = Class(CWalkingLandUnit) {

    Weapons = {
        HeavyBolter = Class(CCannonMolecularWeapon) {
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
            FxMuzzleFlashScale = 1.15,
        },
        rocket = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.45,
        },
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        CWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
    end,
    
}

TypeClass = MRL0102