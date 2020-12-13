local CDFHvyProtonCannonProjectile = import('/lua/cybranprojectiles.lua').CDFHvyProtonCannonProjectile
local ModEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

CDFProtonCannon05 = Class(CDFHvyProtonCannonProjectile) {
    PolyTrails = {
        ModEffectTemplate.BassieCannonPolyTrail,
        '/mods/MCP/effects/emitters/bassie_cannon_trail_01_emit.bp',
    },

    FxTrails = ModEffectTemplate.BassieCannonFxTrail,
    FxImpactUnit = ModEffectTemplate.BassieCannonHitUnit,
    FxImpactProp = ModEffectTemplate.BassieCannonHitUnit,
    FxImpactLand = ModEffectTemplate.BassieCannonHitLand,
    FxImpactUnderWater = ModEffectTemplate.BassieCannonHit01,
    FxImpactWater = ModEffectTemplate.BassieCannonHit01,
    FxUnitHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxLandHitScale = 1.5,
    FxUnderWarerHitScale = 1.5,
    FxWaterHitScale = 1.5,

    OnImpact = function(self, TargetType, TargetEntity)
        self:ShakeCamera(15, 0.25, 0, 0.2)
        CDFHvyProtonCannonProjectile.OnImpact (self, TargetType, TargetEntity)
    end,
}

TypeClass = CDFProtonCannon05
