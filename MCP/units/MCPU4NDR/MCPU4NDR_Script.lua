local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local WeaponsFile2 = import('/mods/MCP/lua/MCPWeapons.lua')
local TAALinkedRailgun = WeaponsFile.TAALinkedRailgun
local ZCannonWeapon = WeaponsFile2.ZCannonWeapon
local TDFShipGaussCannonWeapon = WeaponsFile.TDFShipGaussCannonWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPU4NDR = Class(TSeaUnit) {
    SteamEffects = MCPEffectTemplate.WeaponSteam02,

    Weapons = {
        FrontAMCCannon01 = Class(ZCannonWeapon) {
            Cannon = 1,
        },
        
        FrontAMCCannon02 = Class(ZCannonWeapon) {
            Cannon = 2,
        },
        
        BackAMCCannon = Class(ZCannonWeapon) {
            Cannon = 3,
        },
        
        AAGunLeft01 = Class(TAALinkedRailgun) {},
        AAGunLeft02 = Class(TAALinkedRailgun) {},
        AAGunLeft03 = Class(TAALinkedRailgun) {},
        AAGunLeft04 = Class(TAALinkedRailgun) {},
        AAGunRight01 = Class(TAALinkedRailgun) {},
        AAGunRight02 = Class(TAALinkedRailgun) {},
        AAGunRight03 = Class(TAALinkedRailgun) {},
        AAGunRight04 = Class(TAALinkedRailgun) {},
        FrontDeckGun01 = Class(TDFShipGaussCannonWeapon) {},
        LeftDeckgun01 = Class(TDFShipGaussCannonWeapon) {},
        LeftDeckgun02 = Class(TDFShipGaussCannonWeapon) {},
        LeftDeckgun03 = Class(TDFShipGaussCannonWeapon) {},
        BackDeckgun = Class(TDFShipGaussCannonWeapon) {},
        RightDeckgun01 = Class(TDFShipGaussCannonWeapon) {},
        RightDeckgun02 = Class(TDFShipGaussCannonWeapon) {},
        RightDeckgun03 = Class(TDFShipGaussCannonWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, -45))
        self.Trash:Add(CreateRotator(self, 'Spinner02', 'y', nil, 90))
        self.SteamEffectsBag = {}
    end,
}

TypeClass = MCPU4NDR
