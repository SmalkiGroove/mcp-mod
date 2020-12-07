local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local WeaponsFile2 = import('/lua/aeonweapons.lua')
local SWeapons = import ('/lua/seraphimweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local ADFQuantumAutogunWeapon = WeaponsFile2.ADFQuantumAutogunWeapon
local SDFChronotronCannonWeapon = SWeapons.SDFChronotronCannonWeapon

MAL1201 = Class(CWalkingLandUnit) {

    Weapons = {
        rocket1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.1,
	},
        rocket2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.1,
	},
        DeathWeapon = Class(SCUDeathWeapon) {
	},
        robottalk = Class(ADFQuantumAutogunWeapon) {
            FxMuzzleFlashScale = 0,
	},
        MainGun2 = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlashScale = 3.55,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
	},
        MainGun2a = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlashScale = 3.55,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
	},
        MainGun3 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 2.2,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        MainGun3a = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 2.2,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
    },
OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
      
      if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
         self:SetWeaponEnabledByLabel('robottalk', false)
      else
         self:SetWeaponEnabledByLabel('robottalk', true)
      end      
    end,
OnKilled = function(self, instigator, damagetype, overkillRatio)
        CWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['AeonUnitDeathRing02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BROT2EXBM', army, v):ScaleEmitter(1.00))
	end
end,
}

TypeClass = MAL1201