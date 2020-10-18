local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local aWeapons = import('/lua/aeonweapons.lua')
local AAASonicPulseBatteryWeapon = aWeapons.AAASonicPulseBatteryWeapon
local WeaponsFileAutoAttack = import('/lua/terranweapons.lua')
local AutoAttackWeapon = WeaponsFileAutoAttack.TDFLandGaussCannonWeapon

MCPA1LMT = Class(TLandUnit) {
    Weapons = {
        autoattack = Class(AutoAttackWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
        MainGun = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_02_emit.bp',},
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

}

TypeClass = MCPA1LMT