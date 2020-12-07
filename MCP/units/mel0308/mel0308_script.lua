local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

MEL0308 = Class(TWalkingLandUnit)
{
    Weapons = {
        MainGun = Class(TIFArtilleryWeapon) {},
        GaussCannons = Class(TDFGaussCannonWeapon) {},
    },
}

TypeClass = MEL0308
