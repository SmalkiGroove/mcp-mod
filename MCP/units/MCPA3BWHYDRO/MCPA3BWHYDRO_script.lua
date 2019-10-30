local AEnergyCreationUnit = import( '/lua/aeonunits.lua' ).AEnergyCreationUnit


MCPA3BWHYDRO = Class( AEnergyCreationUnit ) {

    WaterEffects = {'/effects/emitters/water_heat_ambient_02_emit.bp',},
    WaterEffectsBones = {'Vap01','Vap02','Vap03','Vap04','Vap05'},

    OnStopBeingBuilt = function(self,builder,layer)
        AEnergyCreationUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Blade01', 'y', nil, -210, 0, -210))
        self.Trash:Add(CreateRotator(self, 'Blade03', 'y', nil, -180, 0, -180))
        self.Trash:Add(CreateRotator(self, 'Blade02', 'y', nil, -120, 0, -120))
        self.Trash:Add(CreateRotator(self, 'Blade04', 'y', nil, -190, 0, -190))
        self.Trash:Add(CreateRotator(self, 'Blade05', 'y', nil, -100, 0, -100))
        self.Trash:Add(CreateRotator(self, 'Blade06', 'y', nil, -250, 0, -250))
        self.Trash:Add(CreateRotator(self, 'Blade07', 'y', nil, -170, 0, -170))
        self.Trash:Add(CreateRotator(self, 'Blade08', 'y', nil, -160, 0, -160))
        local effects = {}
        local bones = {}
        local scale = 0.75
        if self:GetCurrentLayer() == 'Water' then
            effects = self.WaterEffects
            bones = self.WaterEffectsBones
            scale = 1.5
        end
        for keys, values in effects do
            for keysbones, valuesbones in bones do
                self.Trash:Add(CreateAttachedEmitter(self, valuesbones, self:GetArmy(), values):ScaleEmitter(scale):OffsetEmitter(0,0,0))
            end
        end
    end,
}

TypeClass = MCPA3BWHYDRO
