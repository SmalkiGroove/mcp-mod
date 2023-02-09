local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit 
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon

MAL0204 = Class(AWalkingLandUnit) { 
    Weapons = { 
        MainGun = Class(ADFLaserLightWeapon) {},
    }, 
} 

TypeClass = MAL0204