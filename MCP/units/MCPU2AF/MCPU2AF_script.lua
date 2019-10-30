local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon

MCPU2AF = Class(TAirUnit) {
    
    Weapons = {
        aamissiles1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
        aamissiles2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        TAirUnit.OnDetachedFromTransport(self, transport, bone)
    end,

}

TypeClass = MCPU2AF