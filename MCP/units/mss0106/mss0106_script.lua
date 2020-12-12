local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon

MSS0106 = Class(SSeaUnit) {
    Weapons = {
        MainGun = Class(SIFZthuthaamArtilleryCannon) {},
    },
}
TypeClass = MSS0106
