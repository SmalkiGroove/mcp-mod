local TMissileCruiseProjectile = import('/lua/terranprojectiles.lua').TMissileCruiseProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SingleBeamProjectile = import('/lua/sim/defaultprojectiles.lua').SingleBeamProjectile

AWMissileCruise01 = Class(TMissileCruiseProjectile) {

    FxTrails = EffectTemplate.TMissileExhaust01,
    FxTrailOffset = -0.85,
    
    FxAirUnitHitScale = 0.333,
    FxLandHitScale = 0.333,
    FxNoneHitScale = 0.333,
    FxPropHitScale = 0.333,
    FxProjectileHitScale = 0.333,
    FxProjectileUnderWaterHitScale = 0.333,
    FxShieldHitScale = 0.333,
    FxUnderWaterHitScale = 0.333,
    FxUnitHitScale = 0.333,
    FxWaterHitScale = 0.333,
    FxOnKilledScale = 0.333,
    
    OnCreate = function(self)
        TMissileCruiseProjectile.OnCreate(self)
        self:SetCollisionShape('Sphere', 0, 0, 0, 1.2)
        self:ForkThread(self.CruiseMissileThread)
    end,

    CruiseMissileThread = function(self)
        self:SetTurnRate(180)
        WaitSeconds(2)
        self:SetTurnRate(180)
        WaitSeconds(1)
        self:SetTurnRate(360)
    end,
    
    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        CreateLightParticle( self, -1, army, 3, 4, 'glow_03', 'ramp_fire_01' ) 
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,
}
TypeClass = AWMissileCruise01