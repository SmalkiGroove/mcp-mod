local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CDFProtonCannonWeapon = import('/lua/cybranweapons.lua').CDFProtonCannonWeapon
       
MRB2309 = Class(CStructureUnit) {
    Weapons = {
        FrontCannon01 = Class(CDFProtonCannonWeapon) {},
    },
}
TypeClass = MRB2309
