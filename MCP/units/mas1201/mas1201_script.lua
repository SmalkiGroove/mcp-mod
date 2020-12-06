local AeonWeapons = import('/lua/aeonweapons.lua')
local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

MAS1201 = Class(ASeaUnit) {
    Weapons = {
        FrontTurret = Class(ADFCannonQuantumWeapon) {},
        FrontTurret2 = Class(ADFCannonQuantumWeapon) {},
        BackTurret = Class(ADFCannonQuantumWeapon) {},
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles03 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles04 = Class(AAAZealotMissileWeapon) {},
    },

    BackWakeEffect = {},
}

TypeClass = MAS1201