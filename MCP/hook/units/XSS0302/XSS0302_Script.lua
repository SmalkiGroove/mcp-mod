local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SDFHeavyQuarnonCannon = SeraphimWeapons.SDFHeavyQuarnonCannon
local SAMElectrumMissileDefense = SeraphimWeapons.SAMElectrumMissileDefense
local SAAOlarisCannonWeapon = SeraphimWeapons.SAAOlarisCannonWeapon
local SLaanseMissileWeapon = SeraphimWeapons.SLaanseMissileWeapon

XSS0302 = Class(SSeaUnit) {
    Weapons = {
        BackTurret = Class(SDFHeavyQuarnonCannon) {},
        FrontTurret = Class(SDFHeavyQuarnonCannon) {},
        MidTurret = Class(SDFHeavyQuarnonCannon) {},
        AntiMissileLeft = Class(SAMElectrumMissileDefense) {},
        AntiMissileRight = Class(SAMElectrumMissileDefense) {},
        AntiAirLeft = Class(SAAOlarisCannonWeapon) {},
        AntiAirRight = Class(SAAOlarisCannonWeapon) {},
        CruiseMissile = Class(SLaanseMissileWeapon) {},
    },
}

TypeClass = XSS0302