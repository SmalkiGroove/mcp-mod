local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local SWeapons = import ('/lua/seraphimweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local SDFSinnuntheWeapon = SWeapons.SDFSinnuntheWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPU2LXM = Class(TWalkingLandUnit) {

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
        autoattack = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
        DeathWeapon = Class(SCUDeathWeapon) {},
        smallerguns = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.4,
            FxMuzzleFlash = EffectTemplate.OhCannonMuzzleFlash02,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.SetAIAutoattackWeapon(self)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        TWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
        self.SetAIAutoattackWeapon(self)
    end,

    SetAIAutoattackWeapon = function(self)
        if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
            self:SetWeaponEnabledByLabel('autoattack', false)
        else
            self:SetWeaponEnabledByLabel('autoattack', true)
        end
    end,
    
}

TypeClass = MCPU2LXM