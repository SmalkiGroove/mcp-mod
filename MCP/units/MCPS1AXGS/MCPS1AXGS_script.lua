local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local AeonWeapons = import('/lua/aeonweapons.lua')
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SAAOlarisCannonWeapon = SeraphimWeapons.SAAOlarisCannonWeapon
local SDFThauCannon = SeraphimWeapons.SDFThauCannon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPS1AXGS = Class(SAirUnit) {
	Weapons = {
		autoattack = Class(TDFGaussCannonWeapon) {
			FxMuzzleFlashScale = 0.0, 
		},
		RightAAGun = Class(SAAOlarisCannonWeapon) {
		},
		RightAAGun2 = Class(SAAOlarisCannonWeapon) {
		},
		MainTurret = Class(SDFThauCannon) {
		},
	},

OnStopBeingBuilt = function(self,builder,layer)
	SAirUnit.OnStopBeingBuilt(self,builder,layer)
		self:CreatTheEffects()
		if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
			self:SetWeaponEnabledByLabel('autoattack', false)
		else
			self:SetWeaponEnabledByLabel('autoattack', true)
		end      
	end,

	CreatTheEffects = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SJammerCrystalAmbient'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'AttachPoint', army, v):ScaleEmitter(1.5))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Effect02', army, v):ScaleEmitter(0.18))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Contrail_Right', army, v):ScaleEmitter(0.18))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Effect04', army, v):ScaleEmitter(0.18))
		end
	end,


	OnKilled = function(self, instigator, damagetype, overkillRatio)
		SAirUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,

	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in MCPEffectTemplate['AeonBattleShipHit01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'BRPAT1EXGUNSHIP', army, v):ScaleEmitter(1.65))
		end
	end,
}

TypeClass = MCPS1AXGS