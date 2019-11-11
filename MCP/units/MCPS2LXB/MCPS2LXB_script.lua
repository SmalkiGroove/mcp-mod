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

	OnKilled = function(self, instigator, damagetype, overkillRatio)
		SWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,

	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SDFExperimentalPhasonProjHit01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'MCPS2LXB', army, v):ScaleEmitter(2.3))
		end
	end,
}

TypeClass = MCPS2LXB