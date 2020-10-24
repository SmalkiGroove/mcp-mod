local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TIFArtilleryWeapon = WeaponsFile.TIFArtilleryWeapon

MCPU3LART = Class(TWalkingLandUnit) {
    Weapons = {
        topguns = Class(TIFArtilleryWeapon) {
            FxMuzzleFlashScale = 0.3, 
        },
        guns = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0, 
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self:SetMaintenanceConsumptionInactive()
        self:SetScriptBit('RULEUTC_JammingToggle', true)
        self:RequestRefreshUI()
    end,
}

TypeClass = MCPU3LART