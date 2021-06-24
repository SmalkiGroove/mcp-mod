local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SWeapon = import('/lua/seraphimweapons.lua')

MSS0102 = Class(SSeaUnit) {
    Weapons = {
        MainGun = Class(SWeapon.SDFShriekerCannon){},
        AntiAir = Class(SWeapon.SAAShleoCannonWeapon){},
    },
}
TypeClass = MSS0102
