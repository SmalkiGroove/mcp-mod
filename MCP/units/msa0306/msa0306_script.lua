local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SANHeavyCavitationTorpedo = SeraphimWeapons.SANHeavyCavitationTorpedo

MSA0306 = Class(SAirUnit) {
    Weapons = {
        Bomb = Class(SANHeavyCavitationTorpedo) {},
    },
}
TypeClass = MSA0306
