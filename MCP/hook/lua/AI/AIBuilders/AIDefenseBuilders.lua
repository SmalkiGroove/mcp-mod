-- Need to assign defenses to field engis since basic engis cannot build defenses in the mod

BuilderGroup {
    BuilderGroupName = 'T1BaseDefenses',
    BuildersType = 'EngineerBuilder',

    Builder {
        BuilderName = 'T1 Base D Engineer',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 875,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE TECH1'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1AADefense',
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T1 Base D AA Engineer - Response',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 10, 'DEFENSE ANTIAIR TECH1'}},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1AADefense',
                    'T1AADefense',
                    'T1GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2BaseDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Base D Engineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 875,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 12, 'DEFENSE TECH2' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2 Base D Engineer PD - Response',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 5, 'DEFENSE TECH2 DIRECTFIRE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AADefense',
                    'T2GroundDefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2 Base D Anti-TML Engineer - Response',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'ANTIMISSILE TECH2' }},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 0, 'Artillery' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2 Base D AA Engineer - Response',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 7, 'DEFENSE TECH2 ANTIAIR' }},
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2 Base D Artillery',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 925,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ARTILLERY TECH2 STRUCTURE' }},
            #{ TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 10, 'Structures' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'CheckUnitRange', { 'LocationType', 'T2Artillery', categories.STRUCTURE + (categories.LAND * (categories.TECH2 + categories.TECH3)) } },
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildStructures = {
                    'T2Artillery',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2TMLEngineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
            #DUNCAN - just have one of these.
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.TACTICALMISSILEPLATFORM}},
            { EBC, 'GreaterThanEconEfficiency', { 0.9, 1.2}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'CheckUnitRange', { 'LocationType', 'T2StrategicMissile', categories.STRUCTURE + (categories.LAND * (categories.TECH2 + categories.TECH3)) } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
}


BuilderGroup {
    BuilderGroupName = 'T3BaseDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Base D Engineer AA',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 10, 'DEFENSE TECH3 ANTIAIR STRUCTURE'}},
            {UCBC, 'HaveGreaterThanUnitsWithCategory', {0, categories.ENERGYPRODUCTION * categories.TECH3} },
            {IBC, 'BrainNotLowPowerMode', {}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.8, 1.1}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH3 ANTIAIR STRUCTURE'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 0,
            Construction = {
                BuildClose = true,
                AvoidCategory = 'TECH3 ANTIAIR STRUCTURE',
                maxUnits = 1,
                maxRadius = 10,
                AdjacencyCategory = 'SHIELD STUCTURE, FACTORY TECH3, FACTORY TECH2, FACTORY',
                BuildStructures = {
                    'T3AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T3 Base D Engineer PD',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
            {UCBC, 'HaveGreaterThanUnitsWithCategory', {0, categories.ENERGYPRODUCTION * categories.TECH3} },
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 10, 'DEFENSE TECH3 DIRECTFIRE'}},
            {IBC, 'BrainNotLowPowerMode', {}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 1, 'DEFENSE TECH3'} },
            {UCBC, 'UnitCapCheckLess', {0.9} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 0,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T3TMLEngineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 2, categories.TACTICALMISSILEPLATFORM}},
            {EBC, 'GreaterThanEconEfficiency', {0.9, 1.2}},
            {IBC, 'BrainNotLowPowerMode', {}},
            --{UCBC, 'CheckUnitRange', {'LocationType', 'T2StrategicMissile', categories.STRUCTURE + (categories.LAND * (categories.TECH2 + categories.TECH3))} },
            {UCBC, 'HaveGreaterThanUnitsWithCategory', {0, categories.ENERGYPRODUCTION * categories.TECH3} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2StrategicMissile',
                },
                Location = 'LocationType',
            }
        }
    },
}

----------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Base D Engineer - Perimeter',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 910,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 25, categories.DEFENSE * categories.TECH1}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T1AADefense',
                    'T1GroundDefense',
                    'T1GroundDefense',
                    'T1ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Base D Engineer - Perimeter',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 910,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 40, categories.DEFENSE * categories.TECH2}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T1GroundDefense',
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2ShieldDefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3PerimeterDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Base D Engineer - Perimeter',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 910,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 45, categories.DEFENSE * categories.TECH3}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { IBC, 'BrainNotLowPowerMode', {} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearBasePatrolPoints = true,
                BuildStructures = {
                    'T3GroundDefense',
                    'T3AADefense',
                    'T2Artillery',
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

----------------------------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Defensive Point Engineer',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            # Most paramaters freaking ever Build Condition -- All the threat ones are optional
            ####                                   MarkerType   LocRadius  category markerRad unitMax tMin tMax Rings tType
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 150, 'DEFENSE', 20,        5,     0,   1,   2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { 0.75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE',
                BuildStructures = {
                    'T1AADefense',
                    'T1ShieldDefense',
                    'T1GroundDefense',
                },
            },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'T2DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Defensive Point Engineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 150, 'DEFENSE TECH2, DEFENSE TECH3', 20, 5, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.75 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE TECH2, DEFENSE TECH3',
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2ShieldDefense',
                }
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3DefensivePoints',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Defensive Point Engineer',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'DefensivePointNeedsStructure', {'LocationType', 150, 'DEFENSE TECH3 DIRECTFIRE', 20, 2, 0, 1, 2, 'AntiSurface'} },
            {IBC, 'BrainNotLowPowerMode', {}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 2, 'DEFENSE TECH3'} },
            {UCBC, 'UnitCapCheckLess', {0.75} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 DIRECTFIRE',
                BuildStructures = {
                    'T3GroundDefense',
                }
            }
        }
    },
}

--------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1DefensivePoints High Pri',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Defensive Point Engineer High Pri',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 930,
        BuilderConditions = {
            # Most paramaters freaking ever Build Condition -- All the threat ones are optional
            ####                                   MarkerType   LocRadius  category markerRad unitMax tMin tMax Rings tType
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 150, 'DEFENSE', 20,        3,     0,   1,   2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE',
                BuildStructures = {
                    'T1AADefense',
                    'T1GroundDefense',
                    'T1GroundDefense',
                    'T1ShieldDefense',
                },
            },
        },
    },
}

BuilderGroup {
    BuilderGroupName = 'T2DefensivePoints High Pri',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Defensive Point Engineer High Pri',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 930,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
            { UCBC, 'DefensivePointNeedsStructure', { 'LocationType', 150, 'DEFENSE TECH2, DEFENSE TECH3', 20, 3, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 2, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'DEFENSE TECH2, DEFENSE TECH3',
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2ShieldDefense',
                    'T1GroundDefense',
                }
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3DefensivePoints High Pri',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Defensive Point Engineer High Pri',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 930,
        InstanceCount = 1,
        BuilderConditions = {
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'DefensivePointNeedsStructure', {'LocationType', 150, 'DEFENSE TECH3 DIRECTFIRE', 20, 2, 0, 1, 2, 'AntiSurface'} },
            {IBC, 'BrainNotLowPowerMode', {}},
            {UCBC, 'LocationEngineersBuildingLess', {'LocationType', 2, 'DEFENSE'} },
            {UCBC, 'UnitCapCheckLess', {0.8} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 150,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 DIRECTFIRE',
                BuildStructures = {
                    'T3GroundDefense',
                }
            }
        }
    },
}

------------------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Naval D Engineer',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, 'DEFENSE TECH1 ANTINAVY' }},
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH1 ANTINAVY', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH1 ANTINAVY',
                BuildStructures = {
                    'T1NavalDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T1 Base D Naval AA Engineer',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH1 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH1' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH1 ANTIAIR',
                BuildStructures = {
                    'T1AADefense',
                },
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Naval D Engineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, 'DEFENSE TECH2 ANTINAVY' }},
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH2 ANTINAVY', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH2 ANTINAVY',
                BuildStructures = {
                    'T2NavalDefense',
                    'T2ShipDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T2 Base D Naval AA Engineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH2 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH2' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH2 ANTIAIR',
                BuildStructures = {
                    'T2AADefense',
                },
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3NavalDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Naval D Engineer',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, 'DEFENSE TECH3 ANTINAVY' }},
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH3 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH3' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 ANTINAVY',
                BuildStructures = {
                    'T3NavalDefense',
                    'T3ShipDefense',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T3 Base D Naval AA Engineer',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'NavalDefensivePointNeedsStructure', { 'LocationType', 75, 'DEFENSE TECH3 ANTIAIR', 20, 2, 0, 1, 2, 'AntiSurface' } },
            { TBC, 'EnemyThreatGreaterThanValueAtBase', { 'LocationType', 5, 'Air' } },
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'DEFENSE TECH3' } },
            { UCBC, 'UnitCapCheckLess', { 0.7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                NearMarkerType = 'Naval Defensive Point',
                MarkerRadius = 20,
                LocationRadius = 75,
                LocationType = 'LocationType',
                ThreatMin = 0,
                ThreatMax = 1,
                ThreatRings = 2,
                ThreatType = 'AntiSurface',
                MarkerUnitCount = 2,
                MarkerUnitCategory = 'DEFENSE TECH3 ANTIAIR',
                BuildStructures = {
                    'T3AADefense',
                },
            }
        }
    },
}

-------------------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Base D Engineer - Light',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T1GroundDefense',
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2MissileDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2MissileDefenseEng',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, 'ANTIMISSILE TECH2 STRUCTURE' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Base D Engineer - Light',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE TECH2' }},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENERGYPRODUCTION TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { 0.8 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3LightDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Base D Engineer AA - Light',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 2, 'DEFENSE TECH3 ANTIAIR'}},
            {IBC, 'BrainNotLowPowerMode', {}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'UnitCapCheckLess', {0.8} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T3 Base D Engineer PD - Light',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 875,
        BuilderConditions = {
            {UCBC, 'HaveLessThanUnitsWithCategory', {2, 'DEFENSE TECH3 DIRECTFIRE'}},
            {IBC, 'BrainNotLowPowerMode', {}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {UCBC, 'UnitCapCheckLess', {0.8} },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = true,
                BuildStructures = {
                    'T3GroundDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

-----------------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1ACUDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 ACU D Engineer',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE ANTIAIR'}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T1AADefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T1ACUShields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Shield D Engineer Near ACU',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.DEFENSE}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, categories.ENGINEER}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.SHIELD * categories.STRUCTURE}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiency', { 0.8, 1.4 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AvoidCategory = 'SHIELD',
                maxUnits = 1,
                maxRadius = 10,
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T1ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2ACUDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 ACU D Engineer',
        PlatoonTemplate = 'T2T3FieldEngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 6, 'DEFENSE TECH2' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.1 }}, #DUNCAN - was 0.9, 1.2
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = true,
                BuildStructures = {
                    #DUNCAN - Added PD
                    'T2GroundDefense',
                    'T2AADefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T2ACUShields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Shield D Engineer Near ACU',
        PlatoonTemplate = 'T2T3EngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.DEFENSE * categories.TECH2}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, categories.ENGINEER * categories.TECH2}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.SHIELD * categories.TECH2* categories.STRUCTURE}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiency', { 0.8, 1.4 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AvoidCategory = 'SHIELD',
                maxUnits = 1,
                maxRadius = 10,
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T2ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3ACUDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 ACU D Engineer',
        PlatoonTemplate = 'T3FieldEngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'DEFENSE TECH3' }},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = true,
                BuildStructures = {
                    'T3GroundDefense',
                    'T3AADefense',
                    'T2MissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3ACUShields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Shield D Engineer Near ACU',
        PlatoonTemplate = 'T3EngineerBuilder',
        Priority = 890,
        BuilderConditions = {
            {UCBC, 'HaveGreaterThanUnitsWithCategory', {7, categories.ENGINEER * categories.TECH3}},
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 5, categories.SHIELD * categories.STRUCTURE}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.9, 1.2}},
            {IBC, 'BrainNotLowPowerMode', {}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AvoidCategory = 'SHIELD',
                maxUnits = 1,
                maxRadius = 10,
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T3ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}


-----------------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T1Shields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Shield D Engineer Near Energy Production',
        PlatoonTemplate = 'T1EngineerBuilder',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 10, categories.SHIELD * categories.STRUCTURE}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.DEFENSE * categories.TECH1}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiency', { 0.8, 1.4 } },
            { UCBC, 'LocationEngineersBuildingLess', { 'LocationType', 1, 'SHIELD' } },
            { UCBC, 'UnitCapCheckLess', { 0.9 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                AdjacencyCategory = 'ENERGYPRODUCTION STRUCTURE, DEFENSE STRUCTURE, FACTORY STRUCTURE',
                AdjacencyDistance = 60,
                BuildClose = false,
                AvoidCategory = 'SHIELD',
                maxUnits = 1,
                maxRadius = 10,
                BuildStructures = {
                    'T1ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3Shields',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Shield D Engineer Factory Adj',
        PlatoonTemplate = 'T3EngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            {UCBC, 'HaveGreaterThanUnitsWithCategory', {4, categories.ENGINEER * categories.TECH3}},
            {UCBC, 'UnitsLessAtLocation', {'LocationType', 8, categories.SHIELD * categories.STRUCTURE}},
            {EBC, 'GreaterThanEconEfficiencyOverTime', {0.8, 1.1}},
            {IBC, 'BrainNotLowPowerMode', {}},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                AdjacencyCategory = 'ENERGYPRODUCTION EXPERIMENTAL, ENERGYPRODUCTION TECH3, FACTORY TECH3, FACTORY TECH2, ENERGYPRODUCTION TECH2, FACTORY',
                AdjacencyDistance = 60,
                BuildClose = false,
                AvoidCategory = 'SHIELD',
                maxUnits = 1,
                maxRadius = 10,
                BuildStructures = {
                    'T3ShieldDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

----------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'MiscDefensesEngineerBuilders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1 Wall Builder',
        PlatoonTemplate = 'FieldEngineerBuilder',
        Priority = 0,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'HaveAreaWithUnitsFewWalls', { 'LocationType', 100, 5, 'STRUCTURE - WALL', false, false, false } },
        },
        BuilderData = {
            NumAssistees = 0,
            Construction = {
                BuildStructures = { 'Wall' },
                LocationType = 'LocationType',
                Wall = true,
                MarkerRadius = 100,
                MarkerUnitCount = 5,
                MarkerUnitCategory = 'STRUCTURE - WALL',
            },
        },
    },
    Builder {
        BuilderName = 'T1 Air Staging Engineer - Lots of Air',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 875,
        BuilderConditions = {
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 20, categories.AIR}},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, categories.AIRSTAGINGPLATFORM}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 8, categories.AIRSTAGINGPLATFORM}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = false,
                BuildStructures = {
                    'T1AirStagingPlatform',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T2 Air Staging Engineer - Lots of Air',
        PlatoonTemplate = 'T2T3EcoEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 30, categories.AIR}},
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.AIRSTAGINGPLATFORM - categories.TECH1}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.AIRSTAGINGPLATFORM - categories.TECH1}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = false,
                BuildStructures = {
                    'T2AirStagingPlatform',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T3 Air Staging Engineer - Lots of Air',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 40, categories.AIR}},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.AIRSTAGINGPLATFORM * categories.TECH3}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 1,
            Construction = {
                BuildClose = false,
                BuildStructures = {
                    'T3AirStagingPlatform',
                },
                Location = 'LocationType',
            }
        }
    },
    Builder {
        BuilderName = 'T1 Engineer Reclaim Enemy Walls',
        PlatoonTemplate = 'FieldEngineerBuilder',
        PlatoonAIPlan = 'ReclaimUnitsAI',
        Priority = 975,
        BuilderConditions = {
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENGINEER * categories.TECH1}},
                { UCBC, 'HaveUnitsWithCategoryAndAlliance', { true, 10, categories.WALL, 'Enemy'}},
            },
        BuilderType = 'Any',
        BuilderData = {
            Radius = 1000,
            Categories = {'WALL'},
            ThreatMin = -10,
            ThreatMax = 10000,
            ThreatRings = 1,
        },
    },
}

--------------------------------------------------------------------------------------------------------------------

BuilderGroup {
    BuilderGroupName = 'T3NukeDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Anti-Nuke Engineer Near Factory',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 850,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.ANTIMISSILE * categories.TECH3}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, categories.ENGINEER * categories.TECH3}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.EXPERIMENTAL  + categories.BATTLESHIP } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3' } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 2, categories.ANTIMISSILE * categories.TECH3}},
            { EBC, 'GreaterThanEconIncome', { 2.5, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 }},
            { UCBC, 'UnitCapCheckLess', { .95 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                BuildClose = false,
                AdjacencyCategory = 'FACTORY - NAVAL',
                AdjacencyDistance = 100,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}

BuilderGroup {
    BuilderGroupName = 'T3ACUNukeDefenses',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T3 Anti-Nuke Engineer Near ACU',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.ANTIMISSILE * categories.TECH3}},
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.ENERGYPRODUCTION * categories.TECH3 } },
            { UCBC, 'BuildingLessAtLocation', { 'LocationType', 1, 'ANTIMISSILE TECH3' } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, categories.ANTIMISSILE * categories.TECH3}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 1.1 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 5,
            Construction = {
                NearUnitCategory = 'COMMAND',
                NearUnitRadius = 32000,
                BuildClose = false,
                BuildStructures = {
                    'T3StrategicMissileDefense',
                },
                Location = 'LocationType',
            }
        }
    },
}