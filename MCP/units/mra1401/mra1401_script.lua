local CAirUnit = import('/lua/cybranunits.lua').CAirUnit
local CybranWeapons = import('/lua/cybranweapons.lua')
local CDFRocketIridiumWeapon = CybranWeapons.CDFRocketIridiumWeapon
local CAAMissileNaniteWeapon = CybranWeapons.CAAMissileNaniteWeapon
local CDFHeavyElectronBolterWeapon = CybranWeapons.CDFHeavyElectronBolterWeapon
local CDFLaserDisintegratorWeapon = CybranWeapons.CDFLaserDisintegratorWeapon01
local CDFHeavyMicrowaveLaserGeneratorCom = CybranWeapons.CDFHeavyMicrowaveLaserGeneratorCom
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')
local EffectTemplates = import("/lua/effecttemplates.lua")


MRA1401 = Class(CAirUnit) {
    Weapons = {
        Missile01 = Class(CDFRocketIridiumWeapon) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
        Missile02 = Class(CDFRocketIridiumWeapon) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
		Laser01 = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
        Laser02 = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
        Disintegrator01 = Class(CDFLaserDisintegratorWeapon){
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
		Disintegrator02 = Class(CDFLaserDisintegratorWeapon){
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
        AAMissile01 = Class(CAAMissileNaniteWeapon) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
        AAMissile02 = Class(CAAMissileNaniteWeapon) {
			OnWeaponFired = function(self)
				if not self.unit.WaitingForCloak then
					self.unit:RevealUnit()
					self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
				end
			end,
		},
    },

	WeaponLabels = {
		'Missile01',
		'Missile02',
		'Laser01',
		'Laser02',
		'Disintegrator01',
		'Disintegrator02',
		'AAMissile01',
		'AAMissile02',
	},
    
    MovementAmbientExhaustBones = {
		'Exhaust01',
		'Exhaust02',
		'Exhaust03',
		'Exhaust04',
		'Exhaust05',
		'Exhaust06',
    },

	OnStopBeingBuilt = function(self,builder,layer)
        CAirUnit.OnStopBeingBuilt(self,builder,layer)

		-- for _, effect in EffectTemplates.SJammerCrystalAmbient do
		-- 	CreateAttachedEmitter(self, 'WRA0401', self.Army, effect):OffsetEmitter(0, 0.25, -0.8)
		-- end

		self:SetScriptBit('RULEUTC_CloakToggle', true)
		self.WaitingForCloak = false
		self:ForkThread(self.HideUnit)
    end,

    DestructionPartsChassisToss = {'WRA0401',},
    DestroyNoFallRandomChance = 1.1,

    OnMotionHorzEventChange = function(self, new, old )
		CAirUnit.OnMotionHorzEventChange(self, new, old)
	
		if self.ThrustExhaustTT1 == nil then 
			if self.MovementAmbientExhaustEffectsBag then
				fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
			else
				self.MovementAmbientExhaustEffectsBag = {}
			end
			self.ThrustExhaustTT1 = self:ForkThread(self.MovementAmbientExhaustThread)
		end
		
        if new == 'Stopped' and self.ThrustExhaustTT1 != nil then
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



	RevealUnit = function(self)
		if self.CloakThread then
			KillThread(self.CloakThread)
			self.CloakThread = nil
		end
  
		for _, label in self.WeaponLabels do
			self:SetWeaponEnabledByLabel(label, true)
		end
  
		self:SetMaintenanceConsumptionInactive()
		self:DisableUnitIntel('ToggleBit8', 'Cloak')
	end,
  
	HideUnit = function(self)
		if not self.Dead and self:GetFractionComplete() == 1 and self.Sync.LowPriority then
			self.WaitingForCloak = true
			WaitSeconds(self:GetBlueprint().Intel.StealthWaitTime)

			if self:IsUnitState("Attacking") then
				self.WaitingForCloak = false
				return
			end
			
			for _, label in self.WeaponLabels do
				self:SetWeaponEnabledByLabel(label, false)
			end

			self:SetMaintenanceConsumptionActive()
			self:EnableUnitIntel('ToggleBit8', 'Cloak')
			self.WaitingForCloak = false
		end
		self.CloakThread = nil
	end,

	OnScriptBitSet = function(self, bit)
		if bit == 8 then
			self.Sync.LowPriority = false
			self:RevealUnit()
		else
			CAirUnit.OnScriptBitSet(self, bit)
		end
	end,
  
	OnScriptBitClear = function(self, bit)
		if bit == 8 then
			self.Sync.LowPriority = true
			self.CloakThread = self:ForkThread(self.HideUnit)
		else
			CAirUnit.OnScriptBitClear(self, bit)
		end
	end,

}

TypeClass = MRA1401