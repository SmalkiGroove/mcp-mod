local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CDFProtonCannonWeapon = import('/lua/cybranweapons.lua').CDFProtonCannonWeapon
       
MCPC3BARPD = Class(CStructureUnit) {
    Weapons = {
        FrontCannon01 = Class(CDFProtonCannonWeapon) {},
    },
}
TypeClass = MCPC3BARPD
