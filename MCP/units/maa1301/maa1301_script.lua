local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon
local fxutil = import('/lua/effectutilities.lua')

MAA1301 = Class( AAirUnit ) {
	 DestroyNoFallRandomChance = 1.1,

    Weapons = {
        AAGun = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
		MainGun = Class(import('/lua/aeonweapons.lua').ADFCannonOblivionWeapon) {
			FxMuzzleFlash = {
				'/effects/emitters/oblivion_cannon_flash_04_emit.bp',
				'/effects/emitters/oblivion_cannon_flash_05_emit.bp',				
				'/effects/emitters/oblivion_cannon_flash_06_emit.bp',
			},        
        }
    },
	
    OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Rot01', 'z', nil, 100, 0, 150))
        self.Trash:Add(CreateRotator(self, 'Rot02', 'z', nil, 100, 0, 150))
        self.Trash:Add(CreateRotator(self, 'Rot03', 'z', nil, 100, 0, 150))
    end,	

    MovementAmbientExhaustBones = {
        'Exhaust01',
        'Exhaust02',
		'Exhaust03',
    },
	
	
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
		while not self.Dead do
			local ExhaustEffects = {
				'/effects/emitters/aeon_serp_flash_02_emit.bp',
				'/effects/emitters/aeon_serp_flash_03_emit.bp',	
			}
			local ExhaustBeam = '/effects/emitters/aeon_nuke_exhaust_beam_01_emit.bp'
						--'/Mods/OrbitalWarsMod/hook/effects/emitters/cybran_missile_exhaust_fire_beam_11_emit.bp'
			local army = self:GetArmy()			
			
			for kE, vE in ExhaustEffects do
				for kB, vB in self.MovementAmbientExhaustBones do
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
					table.insert( self.MovementAmbientExhaustEffectsBag, CreateBeamEmitterOnEntity( self, vB, army, ExhaustBeam ))
				end
			end
			WaitSeconds(5)
			fxutil.CleanupEffectBag(self,'MovementAmbientExhaustEffectsBag')
		end	
    end,			
	
}

TypeClass = MAA1301
