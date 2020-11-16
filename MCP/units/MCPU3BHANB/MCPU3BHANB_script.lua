local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

MCPU3BHANB = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TIFArtilleryWeapon) {
            FxMuzzleFlashScale = 3,
        }
    },
}

TypeClass = MCPU3BHANB