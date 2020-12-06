local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon

MSB2107 = Class(SStructureUnit) {

    Weapons = {
        MainGun = Class(SIFZthuthaamArtilleryCannon) {},
    },
}

TypeClass = MSB2107
