local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local MiniPhasonLaser = import('/mods/MCP/lua/MCPWeapons.lua').MiniPhasonLaser
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

MAS1201 = Class(ASeaUnit) {
    Weapons = {
        FrontTurret = Class(MiniPhasonLaser) {},
        FrontTurret2 = Class(MiniPhasonLaser) {},
        BackTurret = Class(MiniPhasonLaser) {},
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles03 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles04 = Class(AAAZealotMissileWeapon) {},
    },

    BackWakeEffect = {},
}

TypeClass = MAS1201