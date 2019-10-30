local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local AWeapons = import('/lua/aeonweapons.lua')
local MCPWeaponFile = import('/mods/MCP/lua/MCPWeapons.lua')
local TMAnovacatbluelaserweapon = MCPWeaponFile.TMAnovacatbluelaserweapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local ADFCannonOblivionWeapon = AWeapons.ADFCannonOblivionWeapon
local AAAZealotMissileWeapon = AWeapons.AAAZealotMissileWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local AANChronoTorpedoWeapon = AWeapons.AANChronoTorpedoWeapon

MCPA4LXH = Class(AWalkingLandUnit) {
	Weapons = {
		laserblue = Class(TMAnovacatbluelaserweapon) {
		},
		laserblue2 = Class(TMAnovacatbluelaserweapon) {
		},
		Torpedo2 = Class(AANChronoTorpedoWeapon) {
		},
		MainGun = Class(TDFGaussCannonWeapon) {  
			FxMuzzleFlashScale = 3.95,
			FxMuzzleFlash = EffectTemplate.ASDisruptorCannonChargeMuzzle01,
		}, 
		MainGun2 = Class(TDFGaussCannonWeapon) {  
			FxMuzzleFlashScale = 3.95,
			FxMuzzleFlash = EffectTemplate.ASDisruptorCannonChargeMuzzle01,
		}, 
		MainGun3 = Class(ADFCannonOblivionWeapon) {  
			FxMuzzleFlashScale = 2,
		}, 
		AntiAirMissiles2 = Class(AAAZealotMissileWeapon) {
		},
		robottalk = Class(AAAZealotMissileWeapon) {
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

	OnKilled = function(self, instigator, damagetype, overkillRatio)
		AWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,


	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SZthuthaamArtilleryHit'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'BROT3HADES', army, v):ScaleEmitter(6.85))
		end
		for k, v in MCPEffectTemplate['AeonUnitDeathRing03'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Turret', army, v):ScaleEmitter(3.25))
		end
		for k, v in MCPEffectTemplate['UEFDeath01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Turret', army, v):ScaleEmitter(1.85))
		end
	end,
}
TypeClass = MCPA4LXH