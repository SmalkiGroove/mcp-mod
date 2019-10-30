
local TMissileAAProjectile = import('/lua/terranprojectiles.lua').TMissileAAProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')

TAAMissileFlayer01 = Class(TMissileAAProjectile) {

    FxTrails = EffectTemplate.TMissileExhaust01,
    FxTrailOffset = -0.15,
    
    FxAirUnitHitScale = 1.65,
    FxLandHitScale = 1.65,
    FxNoneHitScale = 1.65,
    FxPropHitScale = 1.65,
    FxProjectileHitScale = 1.65,
    FxProjectileUnderWaterHitScale = 1.65,
    FxShieldHitScale = 1.65,
    FxUnderWaterHitScale = 1.65,
    FxUnitHitScale = 1.65,
    FxWaterHitScale = 1.65,
    FxOnKilledScale = 1.65,
 

}

TypeClass = TAAMissileFlayer01