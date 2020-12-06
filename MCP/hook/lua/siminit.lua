

-- Hook for AIBuilders
local OLDSetupSession = SetupSession
function SetupSession()
    OLDSetupSession()
    import('/mods/MCP/lua/AI/AIBuilders/LowTechExperimentals.lua')
    import('/mods/MCP/lua/AI/AIBuilders/ResourceStructureUpgrade.lua')
end