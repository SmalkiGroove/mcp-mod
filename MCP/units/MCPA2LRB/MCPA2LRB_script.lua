local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit 
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon 

MCPA2LRB = Class(AWalkingLandUnit) { 
    Weapons = { 
        MainGun = Class(ADFLaserLightWeapon) {}, 
        RocketBackpack = Class(AAAZealotMissileWeapon) {},
    }, 
} 

TypeClass = MCPA2LRB