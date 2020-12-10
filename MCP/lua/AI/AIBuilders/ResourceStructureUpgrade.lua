
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'ResourceStructureUpgrade',
    BuildersType = 'PlatoonFormBuilder',

    -- Hydrocarbon
    Builder {
        BuilderName = 'HydroUpgrade1',
        PlatoonTemplate = 'T1PowerHydroUpgrade',
        Priority = 200,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH1 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH2 } },
            { EBC, 'GreaterThanEconIncome', { 2, 10 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'HydroUpgrade2',
        PlatoonTemplate = 'T2PowerHydroUpgrade',
        Priority = 200,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH1 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH2 } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH3 } },
            { EBC, 'GreaterThanEconIncome', { 2.6, 60 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },

    -- T3 Resource Structure Upgrades
    Builder {
        BuilderName = 'PgenUpgrade',
        PlatoonTemplate = 'T3PowerGenUpgrade',
        Priority = 75,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 4, categories.STRUCTURE * categories.ENERGYPRODUCTION * categories.TECH3 - categories.PRODUCTMCP } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.STRUCTURE * categories.ENERGYPRODUCTION * categories.TECH3 } },
            { EBC, 'GreaterThanEconIncome', { 3, 60 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'MexUpgrade',
        PlatoonTemplate = 'T3MassExtUpgrade',
        Priority = 100,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.STRUCTURE * categories.MASSEXTRACTION * categories.TECH3 - categories.PRODUCTMCP } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.STRUCTURE * categories.MASSEXTRACTION * categories.TECH3 } },
            { EBC, 'GreaterThanEconIncome', { 3, 60 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'MfabUpgrade',
        PlatoonTemplate = 'T3MassFabUpgrade',
        Priority = 50,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 3, categories.STRUCTURE * categories.MASSFABRICATION * categories.TECH3 - categories.PRODUCTMCP } },
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.STRUCTURE * categories.MASSFABRICATION * categories.TECH3 } },
            { EBC, 'GreaterThanEconIncome', { 3, 60 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },

    -- Water Power Generator
    Builder {
        BuilderName = 'WaterPgenUpgrade',
        PlatoonTemplate = 'T2WaterHydroUpgrade',
        Priority = 50,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.STRUCTURE * categories.NAVAL * categories.ENERGYPRODUCTION * categories.TECH2 } },
            { EBC, 'GreaterThanEconIncome', { 2, 60 } },
            { EBC, 'GreaterThanEconTrend', { 0.0, 0.0 } },
        },
        FormRadius = 10000,
        BuilderType = 'Any',
    },
}