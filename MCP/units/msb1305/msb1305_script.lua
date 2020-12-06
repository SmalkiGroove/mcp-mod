local SEnergyCreationUnit = import('/lua/seraphimunits.lua').SEnergyCreationUnit

MSB1305 = Class(SEnergyCreationUnit) {
    AmbientEffects = 'ST3PowerAmbient',
    
    OnStopBeingBuilt = function(self, builder, layer)
        SEnergyCreationUnit.OnStopBeingBuilt(self, builder, layer)
        self.Trash:Add(CreateRotator(self, 'Orb', 'y', nil, 0, 15, 80 + Random(0, 20)))
    end,
}

TypeClass = MSB1305
