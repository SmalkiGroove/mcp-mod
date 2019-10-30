local EffectTemplate = import('/lua/EffectTemplates.lua')
UAntiAirMissile01 = Class(import('/lua/sim/defaultprojectiles.lua').MultiPolyTrailProjectile) {

	FxTrails = {
            '/mods/MCP/effects/emitters/w_u_crm01_p_04_ignitefire_emit.bp',
            '/mods/MCP/effects/emitters/w_u_crm01_p_05_flare_emit.bp',
        },
	FxTrailOffset = 0,   
        FxTrailScale = 2,


	PolyTrails = {
            '/mods/MCP/effects/emitters/w_u_crm01_p_01_polytrail_emit.bp',
            '/mods/MCP/effects/emitters/w_u_crm01_p_06_polytrail_emit.bp',
        },
	PolyTrailOffset = {0,0},   

    FxUnitHitScale = 0.5,
    FxImpactAirUnit = EffectTemplate.CNanoDartUnitHit01,
    FxImpactNone = EffectTemplate.CNanoDartUnitHit01,
    FxImpactUnit = EffectTemplate.CNanoDartUnitHit01,
    FxImpactProp = EffectTemplate.CNanoDartUnitHit01,
    FxLandHitScale = 0.5,
    FxImpactLand = EffectTemplate.CNanoDartUnitHit01,
    FxImpactUnderWater = {},

}
TypeClass = UAntiAirMissile01