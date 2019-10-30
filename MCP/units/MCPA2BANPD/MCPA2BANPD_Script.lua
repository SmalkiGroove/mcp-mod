local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

MCPA2BANPD = Class(AStructureUnit) {

    Weapons = {
        MissileRack = Class(ADFCannonQuantumWeapon) {},
	},	
}

TypeClass = MCPA2BANPD