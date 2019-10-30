local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit

MCPA3BARPD = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon02) {},
    },
}

TypeClass = MCPA3BARPD
