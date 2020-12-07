local AHoverLandUnit = import('/lua/aeonunits.lua').AHoverLandUnit
local ADFDisruptorWeapon = import('/lua/aeonweapons.lua').ADFDisruptorWeapon
local ADFCannonQuantumWeapon = import('/lua/aeonweapons.lua').ADFCannonQuantumWeapon

MAL0306 = Class(AHoverLandUnit) {
    Weapons = {
        MainGun = Class(ADFDisruptorWeapon) {},
        SideGuns = Class(ADFCannonQuantumWeapon) {},
    },

}

TypeClass = MAL0306
