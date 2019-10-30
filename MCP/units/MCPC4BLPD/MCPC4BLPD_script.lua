local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local LaserWeapon = import('/lua/cybranweapons.lua').CDFHeavyMicrowaveLaserGeneratorCom

MCPC4BLPD = Class(CStructureUnit) {   
    Weapons = {
        MainGun = Class(LaserWeapon) { FxMuzzleFlashScale = 2,},
    },
}

TypeClass = MCPC4BLPD
