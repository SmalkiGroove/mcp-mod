local TEnergyCreationUnit = import('/lua/terranunits.lua').TEnergyCreationUnit

MCPU3BWHYDRO = Class( TEnergyCreationUnit ) {
    DestructionPartsHighToss = {'Exhaust01',},
    DestructionPartsLowToss = {'Exhaust01','Exhaust02','Exhaust03','Exhaust04','Exhaust05',},
    DestructionPartsChassisToss = {'UEB1102'},
    AirEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    AirEffectsBones = {'Exhaust01'},
    WaterEffects = {'/effects/emitters/hydrocarbon_smoke_01_emit.bp',},
    WaterEffectsBones = {'Exhaust01'},


    OnStopBeingBuilt = function(self, builder, layer)
        TEnergyCreationUnit.OnStopBeingBuilt(self,builder,layer)
		    self.Trash:Add(CreateRotator(self, 'Rot01', 'y', nil, 100, 0, 50))
			self.Trash:Add(CreateRotator(self, 'Rot02', 'y', nil, 100, 0, 50))
			self.Trash:Add(CreateRotator(self, 'Rot03', 'y', nil, 100, 0, 50))
			self.Trash:Add(CreateRotator(self, 'Rot04', 'y', nil, 100, 0, 50))
	end,

}

TypeClass = MCPU3BWHYDRO
