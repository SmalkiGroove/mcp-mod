local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TSAMLauncher = WeaponsFile.TSAMLauncher
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPU1LXBT = Class(TLandUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 6.5,
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
	},
        smallgun01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
	},
        smallgun02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
	},
        smallgun03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
	},
        smallgun04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
	},
        autoattack = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 0.0, 
	},
        MissileRack01 = Class(TSAMLauncher) {
	},
    },
OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)
      
      if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
         self:SetWeaponEnabledByLabel('autoattack', false)
      else
         self:SetWeaponEnabledByLabel('autoattack', true)
      end      
    end,

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['UEFDeath04'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRNT1EXMOB', army, v):ScaleEmitter(2.7))
	end
end,
}

TypeClass = MCPU1LXBT