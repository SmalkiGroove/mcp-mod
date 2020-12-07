local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local LaserWeapon = import('/lua/cybranweapons.lua').CDFHeavyMicrowaveLaserGeneratorCom

MRB2403 = Class(CStructureUnit) {   
    Weapons = {
        MainGun = Class(LaserWeapon) { FxMuzzleFlashScale = 2,},
    },
}

TypeClass = MRB2403
