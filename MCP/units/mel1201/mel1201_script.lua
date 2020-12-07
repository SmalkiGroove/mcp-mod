local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local SWeapons = import ('/lua/seraphimweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local SDFSinnuntheWeapon = SWeapons.SDFSinnuntheWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MEL1201 = Class(TWalkingLandUnit) {

    Weapons = {
        autogauss3 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.05,
        },
        autogauss2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.05,
        },
        autogauss1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.05,
        },
        biggun = Class(SDFSinnuntheWeapon) {
            FxMuzzleFlash = MCPEffectTemplate.BRNT2EXLMmuzzle,
            FxMuzzleFlashScale = 8.05,
        },
        DeathWeapon = Class(SCUDeathWeapon) {},
        smallerguns = Class(TDFGaussCannonWeapon) {
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

TypeClass = MEL1201