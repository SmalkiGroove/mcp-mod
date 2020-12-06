local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SAAOlarisCannonWeapon = SeraphimWeapons.SAAOlarisCannonWeapon
local SDFThauCannon = SeraphimWeapons.SDFThauCannon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MSA1101 = Class(SAirUnit) {
	Weapons = {
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

TypeClass = MSA1101