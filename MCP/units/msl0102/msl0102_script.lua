local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon

MSL0102 = Class(SWalkingLandUnit) {
    Weapons = {
        LaserTurret = Class(SAAShleoCannonWeapon) {},
    },
}

TypeClass = MSL0102
