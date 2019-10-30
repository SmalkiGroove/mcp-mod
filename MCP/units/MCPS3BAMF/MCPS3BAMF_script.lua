local SMassFabricationUnit = import('/lua/seraphimunits.lua').SMassFabricationUnit

MCPS3BAMF = Class(SMassFabricationUnit) {

    OnStopBeingBuilt = function(self, builder, layer)
        SMassFabricationUnit.OnStopBeingBuilt(self, builder, layer)
        self.RingManip1 = CreateRotator(self, 'Blades01', 'y', nil, 0, 15, -30)
        self.Trash:Add(self.RingManip1)
        self.RingManip2 = CreateRotator(self, 'Blades02', 'y', nil, 0, 15, 45)
        self.Trash:Add(self.RingManip2)
        self.RingManip3 = CreateRotator(self, 'Blades03', 'y', nil, 0, 15, -60)
        self.Trash:Add(self.RingManip3)
    end,

    OnProductionPaused = function(self)
        SMassFabricationUnit.OnProductionPaused(self)
        self.RingManip1:SetSpinDown(true)
        self.RingManip2:SetSpinDown(true)
        self.RingManip3:SetSpinDown(true)
    end,
    
    OnProductionUnpaused = function(self)
        SMassFabricationUnit.OnProductionUnpaused(self)
        self.RingManip1:SetSpinDown(false)
        self.RingManip2:SetSpinDown(false)
        self.RingManip3:SetSpinDown(false)
    end,false
}

TypeClass = MCPS3BAMF
