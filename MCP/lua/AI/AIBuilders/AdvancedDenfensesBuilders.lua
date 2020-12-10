
-- Add locals for BuilderConditions
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'


BuilderGroup {
    BuilderGroupName = 'HeavyDefenses',
    BuildersType = 'EngineerBuilder',

    Builder {
        BuilderName = 'T1HEAVYPD',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 1000,
        InstanceCount = 2,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 7, 'DEFENSE HEAVYDEFENSE TECH1 STRUCTURE'}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH1 STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 2,
                --AdjacencyCategory = 'SHIELD STUCTURE',
                BuildStructures = {
                    'T1HeavyDefense',
                },
                Location = 'LocationType',
            }
        }
    },

    Builder {
        BuilderName = 'T2HEAVYPD',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 1010,
        InstanceCount = 2,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 5, 'DEFENSE HEAVYDEFENSE TECH2 STRUCTURE'}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH2 STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 2,
                --AdjacencyCategory = 'SHIELD STUCTURE',
                BuildStructures = {
                    'T2HeavyDefense',
                },
                Location = 'LocationType',
            }
        }
    },

    Builder {
        BuilderName = 'T3HEAVYPD',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 1020,
        InstanceCount = 2,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 3, 'DEFENSE HEAVYDEFENSE TECH3 STRUCTURE'}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH3 STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 2,
                AdjacencyCategory = 'SHIELD STUCTURE',
                BuildStructures = {
                    'T3HeavyDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}


BuilderGroup {
    BuilderGroupName = 'SpecialDefenses',
    BuildersType = 'EngineerBuilder',

    Builder {
        BuilderName = 'T1POLYPD',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 1030,
        InstanceCount = 2,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 20, 'DEFENSE TECH1 STRUCTURE'}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH1 STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 2,
                --AdjacencyCategory = 'SHIELD STUCTURE',
                BuildStructures = {
                    'T1PolyDefense',
                },
                Location = 'LocationType',
            }
        }
    },

    Builder {
        BuilderName = 'T2EXPPD',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 1040,
        InstanceCount = 2,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 4, 'DEFENSE EXPTECH TECH2 STRUCTURE'}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH2 STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                DesiresAssist = true,
                NumAssistees = 2,
                AdjacencyCategory = 'SHIELD STUCTURE',
                BuildStructures = {
                    'T2ExpDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}
