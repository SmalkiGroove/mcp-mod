local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SDFPhasicAutoGunWeapon = import('/lua/seraphimweapons.lua').SDFPhasicAutoGunWeapon
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeaponAirUnit

MSA0305 = Class(SAirUnit) {
    Weapons = {
        AutoCannon1 = Class(SAALosaareAutoCannonWeapon) {},
        TurretLeft = Class(SDFPhasicAutoGunWeapon) {},
        TurretRight = Class(SDFPhasicAutoGunWeapon) {},
    },
}
TypeClass = MSA0305
