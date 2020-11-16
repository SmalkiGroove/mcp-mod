local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local WeaponsFile = import('/lua/aeonweapons.lua')
local ADFCannonOblivionWeapon = WeaponsFile.ADFCannonOblivionWeapon02

MCPA3BHANB = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(ADFCannonOblivionWeapon) {},
    },
}

TypeClass = MCPA3BHANB