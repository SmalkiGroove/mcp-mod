local AMassCollectionUnit = import( '/lua/aeonunits.lua' ).AMassCollectionUnit

MCPA3BWME = Class(AMassCollectionUnit) {

    WaterEffects = {'/effects/emitters/water_heat_ambient_02_emit.bp',},
    WaterEffectsBones = {'Effect'},

    OnStopBeingBuilt = function(self,builder,layer)
        AMassCollectionUnit.OnStopBeingBuilt(self,builder,layer)		
        local effects = {}
        local bones = {}
        local scale = 1.75		
        if self:GetCurrentLayer() == 'Water' then
            effects = self.WaterEffects
            bones = self.WaterEffectsBones
            scale = 2.5
        end
        for keys, values in effects do
            for keysbones, valuesbones in bones do
                self.Trash:Add(CreateAttachedEmitter(self, valuesbones, self:GetArmy(), values):ScaleEmitter(scale):OffsetEmitter(0,0,0))
            end
        end
    end,	
	
    OnStartBuild = function(self, unitBeingBuilt, order)
        AMassCollectionUnit.OnStartBuild(self, unitBeingBuilt, order)
        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(0)
        self.AnimationManipulator:Destroy()
        self.AnimationManipulator = nil
    end,

    PlayActiveAnimation = function(self)
        AMassCollectionUnit.PlayActiveAnimation(self)
		self.Trash:Add(CreateRotator(self, 'B02', 'x', nil, -210, 0, -210))
		self.Trash:Add(CreateRotator(self, 'B01', 'x', nil, -210, 0, -210))
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationActivate, true)
    end,

    OnProductionPaused = function(self)
        AMassCollectionUnit.OnProductionPaused(self)
        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(0)
    end,

    OnProductionUnpaused = function(self)
        AMassCollectionUnit.OnProductionUnpaused(self)
        if not self.AnimationManipulator then return end
        self.AnimationManipulator:SetRate(1)
    end,
}

TypeClass = MCPA3BWME
