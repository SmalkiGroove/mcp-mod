local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit 
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon 

MAL0204 = Class(AWalkingLandUnit) { 
    Weapons = { 
        MainGun = Class(ADFLaserLightWeapon) {}, 
        RocketBackpack = Class(AAAZealotMissileWeapon) {},
    }, 
} 

TypeClass = MAL0204