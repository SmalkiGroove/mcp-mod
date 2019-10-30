local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local AWeaponsFile = import('/lua/aeonweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local TSAMLauncher = WeaponsFile.TSAMLauncher
local ACruiseMissileWeapon = AWeaponsFile.ACruiseMissileWeapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPU4LXMF = Class(TLandUnit) {

    Weapons = {
        rocket = Class(ACruiseMissileWeapon) {
            FxMuzzleFlash = EffectTemplate.CIFCruiseMissileLaunchSmoke,
            FxMuzzleFlashScale = 2.2,
        },
        MissileRack01 = Class(TSAMLauncher) {
        },
        DeathWeapon = Class(SCUDeathWeapon) {
        },
        trigun01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 7.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        trigun02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 7.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        trigun03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 7.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        trigun04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 7.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun05 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun06 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun07 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        sidegun08 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 4.0,
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
        },
        autoattack = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.SetAIAutoattackWeapon(self)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        TLandUnit.OnDetachedFromTransport(self, transport, bone)
        self.SetAIAutoattackWeapon(self)
    end,

    SetAIAutoattackWeapon = function(self)
        if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
            self:SetWeaponEnabledByLabel('autoattack', false)
        else
            self:SetWeaponEnabledByLabel('autoattack', true)
        end
    end,

    OnKilled = function(self, instigator, damagetype, overkillRatio)
        TLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()
    end,

    CreatTheEffectsDeath = function(self)
        local army =  self:GetArmy()
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks01', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks02', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks03', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks04', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02b'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks05', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks06', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks07', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'tracks08', army, v):ScaleEmitter(2.5))
        end
        for k, v in MCPEffectTemplate['UEFDeath02a'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'Object53', army, v):ScaleEmitter(2.5))
        end
    end,
    
}

TypeClass = MCPU4LXMF