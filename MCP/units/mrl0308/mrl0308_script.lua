local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local CDFRocketIridiumWeapon = CybranWeaponsFile.CDFRocketIridiumWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')


MRL0308 = Class(CWalkingLandUnit) {
    Weapons = {
        HeavyBolter = Class(CDFElectronBolterWeapon ) {},
        GrenadeLauncher = Class(CDFRocketIridiumWeapon) {},
    },
    
    AmbientExhaustBones = {
		'Exhaust',
    },	
    
    AmbientLandExhaustEffects = {
		'/effects/emitters/dirty_exhaust_smoke_02_emit.bp',
		'/effects/emitters/dirty_exhaust_sparks_02_emit.bp',			
	},
	
	AmbientSeabedExhaustEffects = {
		'/effects/emitters/underwater_vent_bubbles_02_emit.bp',			
	},
	
	OnStopBeingBuilt = function(self, builder, layer)
        CWalkingLandUnit.OnStopBeingBuilt(self, builder, layer)
        
        --These start enabled, so before going to InvisState, disabled them.. they'll be reenabled shortly
		self:DisableUnitIntel('Cloak')
		self.Cloaked = false
        ChangeState( self, self.InvisState ) # If spawned in we want the unit to be invis, normally the unit will immediately start moving
    end,
    
    InvisState = State() {
        Main = function(self)
            self.Cloaked = false
            local bp = self:GetBlueprint()
            if bp.Intel.StealthWaitTime then
                WaitSeconds( bp.Intel.StealthWaitTime )
            end
			self:EnableUnitIntel('Cloak')
			self.Cloaked = true
        end,
        
        OnMotionHorzEventChange = function(self, new, old)
            if new != 'Stopped' then
                ChangeState( self, self.VisibleState )
            end
            CWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        end,
    },
    
    VisibleState = State() {
        Main = function(self)
            if self.Cloaked then
                self:DisableUnitIntel('RadarStealth')
			    self:DisableUnitIntel('Cloak')
			end
        end,
        
        OnMotionHorzEventChange = function(self, new, old)
            if new == 'Stopped' then
                ChangeState( self, self.InvisState )
            end
            CWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        end,
    },	
	
	CreateUnitAmbientEffect = function(self, layer)
	    if( self.AmbientEffectThread != nil ) then
	       self.AmbientEffectThread:Destroy()
        end	 
        if self.AmbientExhaustEffectsBag then
            EffectUtil.CleanupEffectBag(self,'AmbientExhaustEffectsBag')
        end        
        
        self.AmbientEffectThread = nil
        self.AmbientExhaustEffectsBag = {} 
	    if layer == 'Land' then
	        self.AmbientEffectThread = self:ForkThread(self.UnitLandAmbientEffectThread)
	    elseif layer == 'Seabed' then
	        local army = self:GetArmy()
			for kE, vE in self.AmbientSeabedExhaustEffects do
				for kB, vB in self.AmbientExhaustBones do
					table.insert( self.AmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
				end
			end	        
	    end          
	end, 
	
	UnitLandAmbientEffectThread = function(self)
		while not self:IsDead() do
            local army = self:GetArmy()			
			
			for kE, vE in self.AmbientLandExhaustEffects do
				for kB, vB in self.AmbientExhaustBones do
					table.insert( self.AmbientExhaustEffectsBag, CreateAttachedEmitter(self, vB, army, vE ))
				end
			end
			
			WaitSeconds(2)
			EffectUtil.CleanupEffectBag(self,'AmbientExhaustEffectsBag')
							
			WaitSeconds(utilities.GetRandomFloat(1,7))
		end		
	end,

    OnKilled = function(self, inst, type, okr)
        self.Trash:Destroy()
        self.Trash = TrashBag()
        if self.AmbientExhaustEffectsBag then
            EffectUtil.CleanupEffectBag(self,'AmbientExhaustEffectsBag')
        end
        CWalkingLandUnit.OnKilled(self, inst, type, okr)
    end,
    
}

TypeClass = MRL0308
