local TSubUnit = import('/lua/terranunits.lua').TSubUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

MCPU2BANPD = Class(TSubUnit) {
	SwitchAnims = true,
    IsWaiting = false,
	
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {},
	},	

}

TypeClass = MCPU2BANPD


