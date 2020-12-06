local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')

MEA1101 = Class(AAirUnit) {
    Weapons = {
        mediumgauss1 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 1.0, 
	},
        mediumgauss2 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 1.0, 
	},
        biggauss1 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 6.0, 
            FxMuzzleFlash = EffectTemplate.TFlakCannonMuzzleFlash01,
	},
        smallerguns1 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 1, 
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank,
	},
        smallerguns2 = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 1, 
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank,
	},
        rockets = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.25,
	},
    },

    MovementAmbientExhaustBones = {'ex01','ex02','ex03','ex04',},
    DestructionPartsChassisToss = {'BRNAT1EXGS',},
    DestroyNoFallRandomChance = 1.1,

	OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object13', 'y', nil, -750, 0, 0))
        self:CreatTheEffects()
    end,

    OnMotionHorzEventChange = function(self, new, old )
		AAirUnit.OnMotionHorzEventChange(self, new, old)
	
		if self.ThrustExhaustTT1 == nil then 
			if self.MovementAmbientExhaustEffectsBag then
				fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
			else
				self.MovementAmbientExhaustEffectsBag = {}
			end
			self.ThrustExhaustTT1 = self:ForkThread(self.MovementAmbientExhaustThread)
		end
		
        if new == 'Stopped' and self.ThrustExhaustTT1 ~= nil then
			KillThread(self.ThrustExhaustTT1)
			fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
			self.ThrustExhaustTT1 = nil
        end		 
    end,
    
    MovementAmbientExhaustThread = function(self)
		while not self:IsDead() do
			local ExhaustEffects = {
				'/effects/emitters/dirty_exhaust_smoke_01_emit.bp',
				'/effects/emitters/dirty_exhaust_sparks_01_emit.bp',			
			}
			local ExhaustBeam = '/effects/emitters/missile_exhaust_fire_beam_03_emit.bp'
			local army = self:GetArmy()			
			
			for kE, vE in ExhaustEffects do
				for kB, vB in self.MovementAmbientExhaustBones do
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateBeamEmitterOnEntity( self, vB, army, ExhaustBeam ))
				end
			end
			
			WaitSeconds(2)
			fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
							
			WaitSeconds(util.GetRandomFloat(1,7))
		end	
    end,

CreatTheEffects = function(self)
	local army =  self:GetArmy()
	for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff03', army, v):ScaleEmitter(1.5))
	end
	for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(1.3))
	end
	for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(1.3))
	end
end,


OnKilled = function(self, instigator, damagetype, overkillRatio)
        AAirUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['UEFDeath02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRNAT1EXGS', army, v):ScaleEmitter(1.25))
	end
end,
}

TypeClass = MEA1101