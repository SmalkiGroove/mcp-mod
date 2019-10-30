local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MCPA3LXHM = Class(AWalkingLandUnit) {
	Weapons = {
		MainGun = Class(TDFGaussCannonWeapon) {
			FxMuzzleFlashScale = 4.85,
			FxMuzzleFlash = EffectTemplate.AIFBallisticMortarFlash02,
		},
			Riotgun = Class(TDFRiotWeapon) {
			FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank,
			FxMuzzleFlashScale = 0.75, 
		},
		EMPgun = Class(TDFGaussCannonWeapon) {
			FxMuzzleFlashScale = 0,
		},
		robottalk = Class(TDFGaussCannonWeapon) {
			FxMuzzleFlashScale = 0,
		},
		DeathWeapon = Class(SCUDeathWeapon) {
		},
	}, 
	OnStopBeingBuilt = function(self,builder,layer)
		AWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
		if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
			self:SetWeaponEnabledByLabel('robottalk', false)
		else
			self:SetWeaponEnabledByLabel('robottalk', true)
		end      
	end,
}
TypeClass = MCPA3LXHM