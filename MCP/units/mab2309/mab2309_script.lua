local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit

MAB2309 = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon02) {},
    },
}

TypeClass = MAB2309
