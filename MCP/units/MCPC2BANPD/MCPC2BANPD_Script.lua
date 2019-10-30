local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit

local cWeapons = import('/lua/cybranweapons.lua')

local CDFLaserDisintegratorWeapon = cWeapons.CDFLaserDisintegratorWeapon01
local CIFSmartCharge = cWeapons.CIFSmartCharge


MCPC2BANPD = Class(CStructureUnit) {
	
    Weapons = {
        Disintigrator = Class(CDFLaserDisintegratorWeapon) {},
		AntiTorpedo = Class(CIFSmartCharge) {},
    },


}

TypeClass = MCPC2BANPD