local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFShipGaussCannonWeapon = import('/lua/terranweapons.lua').TDFShipGaussCannonWeapon

MEB2309 = Class(TStructureUnit) {
    Weapons = {
        FrontTurret02 = Class(TDFShipGaussCannonWeapon) {},
    },
}

TypeClass = MEB2309
