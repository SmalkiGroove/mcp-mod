local SAirStagingPlatformUnit = import('/lua/seraphimunits.lua').SAirStagingPlatformUnit
local SeraphimAirStagePlat02 = import('/lua/EffectTemplates.lua').SeraphimAirStagePlat02
local SeraphimAirStagePlat01 = import('/lua/EffectTemplates.lua').SeraphimAirStagePlat01

MSB5102 = Class(SAirStagingPlatformUnit) {
    OnStopBeingBuilt = function(self,builder,layer)
        for k, v in SeraphimAirStagePlat02 do
            CreateAttachedEmitter(self, 'BSB5104', self:GetArmy(), v):ScaleEmitter(0.3)
        end
        
        for k, v in SeraphimAirStagePlat01 do
            CreateAttachedEmitter(self, 'Pod01', self:GetArmy(), v):ScaleEmitter(0.8)
        end        

        SAirStagingPlatformUnit.OnStopBeingBuilt(self, builder, layer)
    end,
}

TypeClass = MSB5102
