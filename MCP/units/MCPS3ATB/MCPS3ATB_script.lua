local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SANHeavyCavitationTorpedo = SeraphimWeapons.SANHeavyCavitationTorpedo

MCPS3ATB = Class(SAirUnit) {
    Weapons = {
        Bomb = Class(SANHeavyCavitationTorpedo) {},
    },
}
TypeClass = MCPS3ATB
