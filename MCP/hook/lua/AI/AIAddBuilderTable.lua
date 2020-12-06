local OLDAddGlobalBaseTemplate = AddGlobalBaseTemplate
function AddGlobalBaseTemplate(aiBrain, locationType, baseBuilderName)
    -- Don't use this with AI-Uveso
    if not aiBrain.Uveso then
        SPEW('MCP: Injecting BuilderGroups')
        AddGlobalBuilderGroup(aiBrain, locationType, 'TECHEXP Builder')
        AddGlobalBuilderGroup(aiBrain, locationType, 'FACTORYEXP Builder')
        SPEW('MCP: Injecting FormerGroups')
        AddGlobalBuilderGroup(aiBrain, locationType, 'TECHEXP Former')
        AddGlobalBuilderGroup(aiBrain, locationType, 'ResourceStructureUpgrade')
    end
    OLDAddGlobalBaseTemplate(aiBrain, locationType, baseBuilderName)
end
