local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CDFHeavyMicrowaveLaserGeneratorDefense = import('/mods/MCP/lua/MCPweapons.lua').CDFHeavyMicrowaveLaserGeneratorDefense
local CWeaponsFile = import('/lua/cybranweapons.lua')
local CIFGrenadeWeapon = CWeaponsFile.CIFGrenadeWeapon
local CAANanoDartWeapon = CWeaponsFile.CAANanoDartWeapon

MCPC3BHPD = Class(CStructureUnit) {
		
	Weapons = {	
        MainGun = Class(CDFHeavyMicrowaveLaserGeneratorDefense) {},
		Missile02 = Class(CAANanoDartWeapon) {},
        ArtyGun01 = Class(CIFGrenadeWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cannon_muzzle_smoke_02_emit.bp',
            },
            FxMuzzleFlashScale = 0.5,
        },
        ArtyGun02 = Class(CIFGrenadeWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cannon_muzzle_smoke_02_emit.bp',
            },
            FxMuzzleFlashScale = 0.5,
        },
        ArtyGun03 = Class(CIFGrenadeWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cannon_muzzle_smoke_02_emit.bp',
            },
            FxMuzzleFlashScale = 0.5,
        },	
        ArtyGun04 = Class(CIFGrenadeWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cannon_muzzle_smoke_02_emit.bp',
            },
            FxMuzzleFlashScale = 0.5,
        },			
	},	

}

TypeClass = MCPC3BHPD