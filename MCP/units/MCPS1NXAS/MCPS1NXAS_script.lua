local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SIFZthuthaamArtilleryCannon = import('/lua/seraphimweapons.lua').SIFZthuthaamArtilleryCannon
local SWeapon = import('/lua/seraphimweapons.lua')
local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator


MCPS1NXAS = Class(SSeaUnit) {
    Weapons = {
        MainGun = Class(SIFZthuthaamArtilleryCannon) {},
		UpgradeAntiAir01 = Class(SWeapon.SAAShleoCannonWeapon){},
		UpgradeAntiAir02 = Class(SWeapon.SAAShleoCannonWeapon){},
		AntiNavyUpgradeGun01 = Class(SWeapon.SDFShriekerCannon){},
		AntiNavyUpgradeGun02 = Class(SWeapon.SDFShriekerCannon){},
		LaserGun01 = Class(SDFUltraChromaticBeamGenerator) {},
    },
	
    OnCreate = function(self)
		SSeaUnit.OnCreate(self)
		self:ShowBone('Upgrade05_01', true)

    end,		
	
}
TypeClass = MCPS1NXAS
