local TEngineeringResourceStructureUnit = import(import( '/lua/game.lua' ).Path() .. '/lua/MCPunits.lua').TEngineeringResourceStructureUnit  

MEB1307 = Class(TEngineeringResourceStructureUnit) {

    OnStopBeingBuilt = function(self,builder,layer)
        TEngineeringResourceStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator = CreateRotator(self, 'Spinner', 'z')
        self.Rotator:SetAccel(10)
        self.Rotator:SetTargetSpeed(40)
        self.Trash:Add(self.Rotator)
		self.AmbientEffects = CreateEmitterAtEntity(self, self:GetArmy(), '/effects/emitters/uef_t3_massfab_ambient_01_emit.bp')
		self.Trash:Add(self.AmbientEffects)       
      self:SetMaintenanceConsumptionActive()
    end,
            
    OnProductionPaused = function(self)
        TEngineeringResourceStructureUnit.OnProductionPaused(self)
        self.Rotator:SetSpinDown(true)
		if self.AmbientEffects then
			self.AmbientEffects:Destroy()
			self.AmbientEffects = nil
		end            
    end,
    
    OnProductionUnpaused = function(self)
        TEngineeringResourceStructureUnit.OnProductionUnpaused(self)
        self.Rotator:SetTargetSpeed(40)
        self.Rotator:SetSpinDown(false)
		self.AmbientEffects = CreateEmitterAtEntity(self, self:GetArmy(), '/effects/emitters/uef_t3_massfab_ambient_01_emit.bp')
		self.Trash:Add(self.AmbientEffects)          
    end,      
}

TypeClass = MEB1307
