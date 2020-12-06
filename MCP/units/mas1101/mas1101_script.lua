local AeonWeapons = import('/lua/aeonweapons.lua')
local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

MAS1101 = Class(ASeaUnit) {
    Weapons = {
        FrontTurret = Class(ADFCannonQuantumWeapon) {},
        FrontTurret2 = Class(ADFCannonQuantumWeapon) {},
        FrontTurret3 = Class(ADFCannonQuantumWeapon) {},
        FrontTurret4 = Class(ADFCannonQuantumWeapon) {},
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
    },

    BackWakeEffect = {},

    OnStopBeingBuilt = function(self,builder,layer)
        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Sonar', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Sonar01', 'y', nil, 130, 0, 0))

        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = MAS1101