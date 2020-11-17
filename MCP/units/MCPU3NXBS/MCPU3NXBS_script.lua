
local AeonWeapons = import('/lua/aeonweapons.lua')
local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local SWeapons = import ('/lua/seraphimweapons.lua')
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon
local AANChronoTorpedoWeapon = AeonWeapons.AANChronoTorpedoWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SDFChronotronCannonWeapon = SWeapons.SDFChronotronCannonWeapon

MCPU3NXBS = Class(ASeaUnit) {
    Weapons = {
        Torpedo1 = Class(AANChronoTorpedoWeapon) {},
        FrontTurret = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurret2 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurret3 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurret4 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurret5 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurret6 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 1.0,
                        },
        FrontTurretBack = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
                        FxMuzzleFlashScale = 2.0,
                        },
        FrontTurretbig1 = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
                        FxMuzzleFlashScale = 1.0,
    },
        FrontTurretbig2 = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
                        FxMuzzleFlashScale = 1.0,
    },
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
    },

    BackWakeEffect = {},

    OnStopBeingBuilt = function(self,builder,layer)
        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Sonara', 'y', nil, 90, 0, 0))

        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = MCPU3NXBS
