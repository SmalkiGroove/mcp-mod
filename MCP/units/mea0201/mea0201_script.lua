local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon

MEA0201 = Class(TAirUnit) {
    
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

TypeClass = MEA0201