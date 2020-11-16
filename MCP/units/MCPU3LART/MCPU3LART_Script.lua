local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

MCPU3LART = Class(TWalkingLandUnit)
{
    Weapons = {
        MainGun = Class(TIFArtilleryWeapon) {},
        GaussCannons = Class(TDFGaussCannonWeapon) {},
    },
}

TypeClass = MCPU3LART
