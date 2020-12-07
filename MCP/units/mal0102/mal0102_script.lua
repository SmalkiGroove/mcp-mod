local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local aWeapons = import('/lua/aeonweapons.lua')
local AAASonicPulseBatteryWeapon = aWeapons.AAASonicPulseBatteryWeapon

MAL0102 = Class(TLandUnit) {
    Weapons = {
        MainGun = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleFlash = {'/effects/emitters/sonic_pulse_muzzle_flash_02_emit.bp',},
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        TLandUnit.OnDetachedFromTransport(self, transport, bone)
    end,

}

TypeClass = MAL0102