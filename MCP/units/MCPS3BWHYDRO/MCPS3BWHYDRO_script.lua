local SEnergyCreationUnit = import('/lua/seraphimunits.lua').SEnergyCreationUnit

MCPS3BWHYDRO = Class(SEnergyCreationUnit) {
    
    AirEffects = {
                  '/effects/emitters/hydrocarbon_heatshimmer_01_emit.bp'
                },
    AirEffectsBones = {'Exhaust01','Exhaust02','Exhaust03','Exhaust04','Exhaust05'},
    WaterEffects = {'/effects/emitters/underwater_idle_bubbles_01_emit.bp',},
    WaterEffectsBones = {'Exhaust01','Exhaust02','Exhaust03','Exhaust04','Exhaust05'},
        
    OnStopBeingBuilt = function(self,builder,layer)
        SEnergyCreationUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateRotator(self, 'Turbine01', 'y', nil, 150, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine03', 'y', nil, 150, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine02', 'y', nil, 150, 0, 0))
		
		self.Trash:Add(CreateRotator(self, 'Turbine04', 'y', nil, 180, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine05', 'y', nil, 180, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine06', 'y', nil, 180, 0, 0))	

		self.Trash:Add(CreateRotator(self, 'Turbine07', 'y', nil, 220, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine08', 'y', nil, 220, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine09', 'y', nil, 220, 0, 0))		
		
		self.Trash:Add(CreateRotator(self, 'Turbine11', 'y', nil, 260, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine10', 'y', nil, 260, 0, 0))
		self.Trash:Add(CreateRotator(self, 'Turbine12', 'y', nil, 260, 0, 0))			
		
        local effects = {}
        local bones = {}
        local scale = 5		
        if self:GetCurrentLayer() == 'Water' then
            effects = self.WaterEffects
            bones = self.WaterEffectsBones
            scale = 5
        end
        for keys, values in effects do
            for keysbones, valuesbones in bones do
                self.Trash:Add(CreateAttachedEmitter(self, valuesbones, self:GetArmy(), values):ScaleEmitter(scale):OffsetEmitter(0,0,0))
            end
        end
    end,
}

TypeClass = MCPS3BWHYDRO