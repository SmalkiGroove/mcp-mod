local EffectTemplate = import('/lua/EffectTemplates.lua')
local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local WeaponFile = import('/lua/terranweapons.lua')
local TSAMLauncher = WeaponFile.TSAMLauncher
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon

MES0206 = Class(TSeaUnit) {
    DestructionTicks = 200,

    Weapons = {
        FrontTurret01 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 4.0, 
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
},
        FrontTurret02 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 4.0, 
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
},
        FrontTurret03 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 4.0, 
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
},
        FrontTurret04 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 4.0, 
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
},
        BackTurret02 = Class(TSAMLauncher) {
            FxMuzzleFlash = EffectTemplate.TAAMissileLaunchNoBackSmoke,
      		  },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner02', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, -50, 0, 0))

        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        
    end,

}

TypeClass = MES0206
