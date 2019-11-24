local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAAOlarisCannonWeapon = SeraphimWeapons.SAAOlarisCannonWeapon
local SDFThauCannon = SeraphimWeapons.SDFThauCannon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MCPS2LXB = Class( SWalkingLandUnit ) {
	Weapons = {
		autoattack = Class(SAAOlarisCannonWeapon) {
			FxMuzzleFlashScale = 0.0, 
		},
		RightAAGun = Class(SAAOlarisCannonWeapon) {
		},
		MainTurret = Class(SDFThauCannon) {
		},
	},

	OnStopBeingBuilt = function(self,builder,layer)
		SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer) 
	end,

	CreatTheEffects = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(0.55))
		end
		for k, v in EffectTemplate['SDFSinnutheWeaponFXTrails01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(0.35))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff03', army, v):ScaleEmitter(0.11))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff04', army, v):ScaleEmitter(0.11))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff05', army, v):ScaleEmitter(0.13))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'eff06', army, v):ScaleEmitter(0.13))
		end
	end,

	OnKilled = function(self, instigator, damagetype, overkillRatio)
		SWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,

	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SDFExperimentalPhasonProjHit01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'BRPT2EXBOT', army, v):ScaleEmitter(2.3))
		end
	end,
}

TypeClass = MCPS2LXB