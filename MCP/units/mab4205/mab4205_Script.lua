local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

MAB4205 = Class(AStructureUnit) {

    Weapons = {
        MissileRack = Class(ADFCannonQuantumWeapon) {},
	},	
}

TypeClass = MAB4205