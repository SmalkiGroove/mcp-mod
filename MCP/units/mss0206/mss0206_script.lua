local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon
local SAAOlarisCannonWeapon = SeraphimWeapons.SAAOlarisCannonWeapon

MSS0206 = Class(SSeaUnit) {
    Weapons = {
        FrontGun01 = Class(SIFSuthanusArtilleryCannon) {},
        FrontGun02 = Class(SIFSuthanusArtilleryCannon) {},
        AAGun = Class(SAAOlarisCannonWeapon) {},
    },
    BackWakeEffect = {},
}

TypeClass = MSS0206
