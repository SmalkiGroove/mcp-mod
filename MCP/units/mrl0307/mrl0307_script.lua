local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local CIFMissileLoaTacticalWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaTacticalWeapon

MRL0307 = Class(CWalkingLandUnit) {
    Weapons = {
        MissileRack = Class(CIFMissileLoaTacticalWeapon) {},
    },
}

TypeClass = MRL0307
