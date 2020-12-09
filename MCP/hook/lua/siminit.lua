

-- Hook for AIBuilders
local OLDSetupSession = SetupSession
function SetupSession()
    OLDSetupSession()
    import('/mods/MCP/lua/AI/AIBuilders/FieldEngiBuilders.lua')
    import('/mods/MCP/lua/AI/AIBuilders/LowTechExperimentals.lua')
    import('/mods/MCP/lua/AI/AIBuilders/ResourceStructureUpgrade.lua')
    import('/mods/MCP/lua/AI/AIBuilders/AdvancedDenfensesBuilders.lua')
end