local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAMissileNaniteWeapon = CybranWeaponsFile.CAAMissileNaniteWeapon
local CDFHeavyMicrowaveLaserGeneratorCom = CybranWeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')

MRA1201 = Class(AAirUnit) {
    Weapons = {
        MainGun = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
	},
        MainGun2 = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
	},
        MainGun3 = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
	},
        Missile01 = Class(CAAMissileNaniteWeapon) {},
    },

    MovementAmbientExhaustBones = {
                            'ex01',
                            'ex02',
                            'ex03',
                            'ex04',
    },

    DestructionPartsChassisToss = {'BRMAT2GUNSHIP',},
    DestroyNoFallRandomChance = 1.1,

OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
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





OnKilled = function(self, instigator, damagetype, overkillRatio)
        AAirUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['CybranT2BeetleHit01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRMAT2GUNSHIP', army, v):ScaleEmitter(2.35))
	end
end,
}

TypeClass = MRA1201