local AHoverLandUnit = import('/lua/aeonunits.lua').AHoverLandUnit
local ADFDisruptorWeapon = import('/lua/aeonweapons.lua').ADFDisruptorWeapon
local ADFCannonQuantumWeapon = import('/lua/aeonweapons.lua').ADFCannonQuantumWeapon

MCPA3LHT = Class(AHoverLandUnit) {
    Weapons = {
        MainGun = Class(ADFDisruptorWeapon) {},
        SideGuns = Class(ADFCannonQuantumWeapon) {},
    },

}

TypeClass = MCPA3LHT
