local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local WeaponsFile = import('/lua/aeonweapons.lua')
local ADFCannonOblivionWeapon = WeaponsFile.ADFCannonOblivionWeapon02

MAB4305 = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(ADFCannonOblivionWeapon) {},
    },
}

TypeClass = MAB4305