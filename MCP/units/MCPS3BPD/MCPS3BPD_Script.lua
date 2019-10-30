local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local WeaponsFile = import ('/lua/seraphimweapons.lua')
local SDFAireauWeapon = WeaponsFile.SDFAireauWeapon

MCPS3BPD = Class(SStructureUnit) {
    Weapons = {
        MainGun = Class(SDFAireauWeapon) {},
    },
}

TypeClass = MCPS3BPD
