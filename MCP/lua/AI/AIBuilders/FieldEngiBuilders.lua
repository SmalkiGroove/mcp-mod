
-- Add locals for BuilderConditions
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'FieldEngineer Builder',
    BuildersType = 'FactoryBuilder',
    # ============
    #    TECH 1
    # ============
    Builder {
        BuilderName = 'T1 Field Engineer Disband - Init',
        PlatoonTemplate = 'T1BuildFieldEngineer',
        Priority = 90,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 4, 'ENGINEER TECH1' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 2, 'FIELDENGINEER TECH1' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T1 Field Engineer Disband - Filler 1',
        PlatoonTemplate = 'T1BuildFieldEngineer',
        Priority = 80,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 8, 'ENGINEER TECH1' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 5, 'FIELDENGINEER TECH1' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T1 Field Engineer Disband - Filler 2',
        PlatoonTemplate = 'T1BuildFieldEngineer',
        Priority = 70,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1} },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },

    # ============
    #    TECH 2
    # ============
    Builder {
        BuilderName = 'T2 Field Engineer Disband - Init',
        PlatoonTemplate = 'T2BuildFieldEngineer',
        Priority = 90,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 2, 'ENGINEER TECH2' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 2, 'FIELDENGINEER TECH2' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T2 Field Engineer Disband - Filler 1',
        PlatoonTemplate = 'T2BuildFieldEngineer',
        Priority = 80,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 4, 'ENGINEER TECH2' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 5, 'FIELDENGINEER TECH2' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T2 Field Engineer Disband - Filler 2',
        PlatoonTemplate = 'T2BuildFieldEngineer',
        Priority = 70,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2} },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },

    # ============
    #    TECH 3
    # ============
    Builder {
        BuilderName = 'T3 Field Engineer Disband - Init',
        PlatoonTemplate = 'T3BuildFieldEngineer',
        Priority = 95,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 2, 'ENGINEER TECH3' }},
            { UCBC,'EngineerLessAtLocation', { 'LocationType', 2, 'FIELDENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Field Engineer Disband - Filler',
        PlatoonTemplate = 'T3BuildFieldEngineer',
        Priority = 90,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 4, 'ENGINEER TECH3' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 5, 'FIELDENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            #{ UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Field Engineer Disband - Filler 2',
        PlatoonTemplate = 'T3BuildFieldEngineer',
        Priority = 80,
        BuilderConditions = {
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 6, 'ENGINEER TECH3' }},
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 8, 'FIELDENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Field Engineer Disband - Filler 3',
        PlatoonTemplate = 'T3BuildFieldEngineer',
        Priority = 70,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'FIELDENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'All',
    },
}
