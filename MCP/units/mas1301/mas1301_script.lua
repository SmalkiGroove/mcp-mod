local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local WeaponsFile = import('/lua/aeonweapons.lua')
local AAAZealotMissileWeapon = WeaponsFile.AAAZealotMissileWeapon
local ADFCannonOblivionNaval = WeaponsFile.ADFCannonOblivionNaval
local DreadnoughtLaser = import('/mods/MCP/lua/MCPWeapons.lua').DreadnoughtLaser
local AAMWillOWisp = import('/lua/aeonweapons.lua').AAMWillOWisp

MAS1301 = Class(ASeaUnit) {
    BackWakeEffect = {},
	Weapons = {
        FrontTurret01 = Class(ADFCannonOblivionNaval) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        },

        FrontTurret02 = Class(ADFCannonOblivionNaval) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        },

        BackTurret01 = Class(ADFCannonOblivionNaval) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        },

        BackTurret02 = Class(ADFCannonOblivionNaval) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        },

        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
		
        Laser01 = Class(DreadnoughtLaser) {},
        Laser02 = Class(DreadnoughtLaser) {},
        Laser03 = Class(DreadnoughtLaser) {},
        Laser04 = Class(DreadnoughtLaser) {},
		
        AntiMissile = Class(AAMWillOWisp) {},
	},
}

TypeClass = MAS1301

