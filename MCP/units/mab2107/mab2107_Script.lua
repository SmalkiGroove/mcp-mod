local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local AIFArtilleryMiasmaShellWeapon = import('/lua/aeonweapons.lua').AIFArtilleryMiasmaShellWeapon

MAB2107 = Class(AStructureUnit) {

    Weapons = {
        MainGun = Class(AIFArtilleryMiasmaShellWeapon) {},
    },
}

TypeClass = MAB2107
