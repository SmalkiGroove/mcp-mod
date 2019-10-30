local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

BasiliskNukeEffect05 = Class(import('/lua/sim/defaultprojectiles.lua').EmitterProjectile) {
    FxTrails = MCPEffectTemplate.BasiliskNukePlumeFxTrails01,
    FxTrailScale = 0.5,
}

TypeClass = BasiliskNukeEffect05
