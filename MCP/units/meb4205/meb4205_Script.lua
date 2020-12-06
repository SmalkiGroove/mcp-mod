local TSubUnit = import('/lua/terranunits.lua').TSubUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

MEB4205 = Class(TSubUnit) {
	SwitchAnims = true,
    IsWaiting = false,
	
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {},
	},	

}

TypeClass = MEB4205


