local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local SDFAireauBolterWeapon = import('/lua/seraphimweapons.lua').SDFAireauBolterWeapon02
local EffectTemplate = import('/lua/EffectTemplates.lua')

MCPS1BGPD = Class(TStructureUnit) {
	Weapons = {
		MainGun = Class(SDFAireauBolterWeapon) {
			FxMuzzleFlashScale = 2.4, 
		},
	},

	OnStopBeingBuilt = function(self,builder,layer)
		TStructureUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateRotator(self, 'Pod01', 'y', nil, 150, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Pod02', 'y', nil, 250, 0, 0))
		self:CreatTheEffects()   
	end,

	OnKilled = function(self, instigator, damagetype, overkillRatio)
		TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,

	CreatTheEffects = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(0.08))
		end
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(0.28))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff03', army, v):ScaleEmitter(0.08))
		end
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff04', army, v):ScaleEmitter(0.12))
		end
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff05', army, v):ScaleEmitter(0.12))
		end
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Muzzle01', army, v):ScaleEmitter(0.10))
		end
	end,

	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SZthuthaamArtilleryHit'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'BRPT1EXPD', army, v):ScaleEmitter(2.85))
		end
	end,
}

TypeClass = MCPS1BGPD