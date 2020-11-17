local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFHeavyMicrowaveLaserGeneratorCom = CybranWeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')

MCPC1AXGS = Class(AAirUnit) {
    Weapons = {
        gun01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        gun02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        gun03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        gun04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        MainGun = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
	},
    },

    MovementAmbientExhaustBones = {
                            'ex01',
                            'ex02',
    },

    DestructionPartsChassisToss = {'BRMAT1EXGS',},
    DestroyNoFallRandomChance = 1.1,

OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
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
	for k, v in EffectTemplate['SmokePlumeLightDensityMed01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(0.7))
	end
	for k, v in EffectTemplate['SmokePlumeLightDensityMed01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(0.7))
	end
	for k, v in EffectTemplate['CMicrowaveLaserMuzzle01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(0.8))
	end
	for k, v in EffectTemplate['CMicrowaveLaserMuzzle01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff02', army, v):ScaleEmitter(0.8))
	end
	for k, v in EffectTemplate['CMicrowaveLaserMuzzle01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff03', army, v):ScaleEmitter(0.8))
	end
	for k, v in EffectTemplate['CMicrowaveLaserMuzzle01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'eff04', army, v):ScaleEmitter(0.8))
	end

end,


OnKilled = function(self, instigator, damagetype, overkillRatio)
        AAirUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['CybranT2BeetleHit01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRMAT1EXGS', army, v):ScaleEmitter(2.35))
	end
end,
}

TypeClass = MCPC1AXGS