local CAirUnit = import('/lua/cybranunits.lua').CAirUnit
local CIFNaniteTorpedoWeapon = import('/lua/cybranweapons.lua').CIFNaniteTorpedoWeapon


MRA0306 = Class(CAirUnit) {
    Weapons = {
        Bomb = Class(CIFNaniteTorpedoWeapon) {},
    },
    OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionActive()
        self:EnableUnitIntel('RadarStealth')
    end,
}

TypeClass = MRA0306
