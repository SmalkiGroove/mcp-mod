local AeonWeapons = import('/lua/aeonweapons.lua')
local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local WeaponFile = import('/lua/terranweapons.lua')
local ADFCannonOblivionWeapon = AeonWeapons.ADFCannonOblivionWeapon
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon
local AANChronoTorpedoWeapon = AeonWeapons.AANChronoTorpedoWeapon
local AAASonicPulseBatteryWeapon = AeonWeapons.AAASonicPulseBatteryWeapon

MCPA2NAS = Class(ASeaUnit) {
    Weapons = {
        AAGun = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        AAGun2 = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        FrontTurret = Class(ADFCannonOblivionWeapon) {},
        FrontTurret2 = Class(ADFCannonOblivionWeapon) {},
        torp01 = Class(AANChronoTorpedoWeapon) {},
    },

    BackWakeEffect = {},

    OnStopBeingBuilt = function(self,builder,layer)
        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Sonar', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Sonar01', 'y', nil, 130, 0, 0))

        ASeaUnit.OnStopBeingBuilt(self,builder,layer)    
    end,
}

TypeClass = MCPA2NAS