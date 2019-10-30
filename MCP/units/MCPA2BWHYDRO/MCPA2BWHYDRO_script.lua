local AEnergyCreationUnit = import('/lua/aeonunits.lua').AEnergyCreationUnit

MCPA2BWHYDRO = Class( AEnergyCreationUnit ) {

    --AirEffects = {'/effects/emitters/water_heat_ambient_04_emit.bp',},
   -- AirEffectsBones = {'Blade13','Blade14','Blade15','Blade17','Extension14'},
    WaterEffects = {'/effects/emitters/water_heat_ambient_02_emit.bp',},
    WaterEffectsBones = {'Vap01','Vap02','Vap03','Vap04'},

    OnStopBeingBuilt = function(self,builder,layer)
        AEnergyCreationUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateRotator(self, 'Blade01', 'y', nil, -180, 0, -180))
		self.Trash:Add(CreateRotator(self, 'Blade03', 'y', nil, -180, 0, -180))
		self.Trash:Add(CreateRotator(self, 'Blade02', 'y', nil, -180, 0, -180))
		self.Trash:Add(CreateRotator(self, 'Blade04', 'y', nil, -180, 0, -180))		
        local effects = {}
        local bones = {}
        local scale = 0.75		
        if self:GetCurrentLayer() == 'Water' then
            effects = self.WaterEffects
            bones = self.WaterEffectsBones
            scale = 0.5
        end
        for keys, values in effects do
            for keysbones, valuesbones in bones do
                self.Trash:Add(CreateAttachedEmitter(self, valuesbones, self:GetArmy(), values):ScaleEmitter(scale):OffsetEmitter(0,0,0))
            end
        end
    end,
}

TypeClass = MCPA2BWHYDRO
