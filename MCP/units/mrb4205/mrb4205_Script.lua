local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit

local cWeapons = import('/lua/cybranweapons.lua')

local CDFLaserDisintegratorWeapon = cWeapons.CDFLaserDisintegratorWeapon01
local CIFSmartCharge = cWeapons.CIFSmartCharge


MRB4205 = Class(CStructureUnit) {
	
    Weapons = {
        Disintigrator = Class(CDFLaserDisintegratorWeapon) {},
		AntiTorpedo = Class(CIFSmartCharge) {},
    },


}

TypeClass = MRB4205