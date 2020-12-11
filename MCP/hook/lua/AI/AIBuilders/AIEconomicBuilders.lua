-- Need to assign eco buildings to eco engis since all engis cannot build eco buildings in the mod

BuilderGroup {
    BuilderGroupName = 'EngineerFactoryBuilders',
    BuildersType = 'FactoryBuilder',
    # ============
    #    TECH 1
    # ============
    Builder {
        BuilderName = 'T1 Engineer Disband - Init',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 4, 'ENGINEER TECH1' }}, #DUNCAN - was 3
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T1 Engineer Disband - Filler 1',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 800,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 9, 'ENGINEER TECH1' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T1 Engineer Disband - Filler 2',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 700,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1} },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH1' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech1' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },

    # ============
    #    TECH 2
    # ============
    Builder {
        BuilderName = 'T2 Engineer Disband - Init',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 925,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T2 Engineer Disband - Filler 1',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 800,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 6, 'ENGINEER TECH2' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T2 Engineer Disband - Filler 2',
        PlatoonTemplate = 'T2BuildEngineer',
        Priority = 700,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2} },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH2' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech2' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },

    # ============
    #    TECH 3
    # ============
    Builder {
        BuilderName = 'T3 Engineer Disband - Init',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 950,
        BuilderConditions = {
            { UCBC,'EngineerLessAtLocation', { 'LocationType', 6, 'ENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Engineer Disband - Filler',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 9, 'ENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            #{ UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Engineer Disband - Filler 2',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 800,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 12, 'ENGINEER TECH3' }},
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'T3 Engineer Disband - Filler 3',
        PlatoonTemplate = 'T3BuildEngineer',
        Priority = 700,
        BuilderConditions = {
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.2 } },
            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 1, 'ENGINEER TECH3' } },
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'Tech3' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'All',
    },

    # ====================
    #    SUB COMMANDERS
    # ====================
    Builder {
        BuilderName = 'T3 Sub Commander',
        PlatoonTemplate = 'T3LandSubCommander',
        Priority = 950, #DUNCAN - was 900
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.EXPERIMENTAL}}, #DUNCAN - Added
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2 } }, #DUNCAN - was 0.95, 1.3
            { UCBC, 'EngineerCapCheck', { 'LocationType', 'SCU' } },
            { IBC, 'BrainNotLowMassMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
        },
        BuilderType = 'Gate',
    },
}



BuilderGroup {
    BuilderGroupName = 'T1EngineerBuilders',
    BuildersType = 'EngineerBuilder',
    # =====================================
    #     T1 Engineer Resource Builders
    # =====================================
    Builder {
        BuilderName = 'T1 Hydrocarbon Engineer',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 980,
        BuilderConditions = {
                { UCBC, 'HaveLessThanUnitsWithCategory', { 3, 'HYDROCARBON'}},
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 4, 'MASSEXTRACTION'}},
                { MABC, 'MarkerLessThanDistance',  { 'Hydrocarbon', 200}},
            },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildStructures = {
                    'T1HydroCarbon',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1 Engineer Reclaim',
        PlatoonTemplate = 'EngineerBuilder',
        PlatoonAIPlan = 'ReclaimAI',
        Priority = 900,
        InstanceCount = 3,
        BuilderConditions = {
                { MIBC, 'ReclaimablesInArea', { 'LocationType', }},
            },
        BuilderData = {
            LocationType = 'LocationType',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T1 Engineer Reclaim Excess',
        PlatoonTemplate = 'EngineerBuilder',
        PlatoonAIPlan = 'ReclaimAI',
        Priority = 2,
        InstanceCount = 10,
        BuilderConditions = {
                { MIBC, 'ReclaimablesInArea', { 'LocationType', }},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 30,
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T1 Engineer Reclaim Old Pgens',
        PlatoonTemplate = 'EngineerBuilder',
        PlatoonAIPlan = 'ReclaimStructuresAI',
        Priority = 900,
        InstanceCount = 1,
        BuilderConditions = {
                { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.1, 1.1 }},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 1, categories.TECH3 * categories.ENERGYPRODUCTION}},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 0, categories.TECH1 * categories.ENERGYPRODUCTION * categories.DRAGBUILD }},
            },
        BuilderData = {
            Location = 'LocationType',
            Reclaim = {'STRUCTURE ENERGYPRODUCTION TECH1 DRAGBUILD'},
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T1 Engineer Find Unfinished',
        PlatoonTemplate = 'EngineerBuilder',
        PlatoonAIPlan = 'ManagerEngineerFindUnfinished',
        Priority = 1800,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'UnfinishedUnits', { 'LocationType', categories.STRUCTURE}},
            },
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssisteeType = 'Engineer',
                BeingBuiltCategories = {'STRUCTURE STRATEGIC, STRUCTURE ECONOMIC, STRUCTURE'},
                Time = 20,
            },
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T1 Engineer Repair',
        PlatoonTemplate = 'EngineerBuilder',
        PlatoonAIPlan = 'RepairAI',
        Priority = 900,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'DamagedStructuresInArea', { 'LocationType', }},
            },
        BuilderData = {
            LocationType = 'LocationType',
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T1 Mass Adjacency Engineer',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 800,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 5, 'MASSEXTRACTION TECH2, MASSEXTRACTION TECH3'}},
            { MABC, 'MarkerLessThanDistance',  { 'Mass', 100, -3, 0, 0}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'AdjacencyCheck', { 'LocationType', 'MASSEXTRACTION TECH2, MASSEXTRACTION TECH3', 100, 'ueb1106' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'MASSEXTRACTION TECH3, MASSEXTRACTION TECH2',
                AdjacencyDistance = 100,
                BuildClose = false,
                ThreatMin = -3,
                ThreatMax = 0,
                ThreatRings = 0,
                BuildStructures = {
                    'MassStorage',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1 Energy Storage Engineer - initial',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1,  'ENERGYSTORAGE' }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, 'ENERGYSTORAGE'}},
            { UCBC, 'UnitCapCheckLess', { .7 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = false,
                BuildStructures = {
                    'EnergyStorage',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T1 Energy Storage Engineer',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENERGYSTORAGE' }},
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 1, 'ENERGYPRODUCTION TECH2' }},
            { UCBC, 'UnitCapCheckLess', { .7 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.6, 0.6 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = false,
                BuildStructures = {
                    'EnergyStorage',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T1 Energy Storage Engineer - T3 Energy Production',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 825,
        BuilderConditions = {
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 2, 'ENERGYPRODUCTION TECH3' }},
            { UCBC, 'UnitCapCheckLess', { .7 } },
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.3 }},
            { UCBC, 'AdjacencyCheck', { 'LocationType', 'ENERGYPRODUCTION TECH3', 100, 'ueb1105' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'ENERGYPRODUCTION TECH3',
                AdjacencyDistance = 100,
                BuildClose = false,
                BuildStructures = {
                    'EnergyStorage',
                    'EnergyStorage',
                    'EnergyStorage',
                    'EnergyStorage',
                },
            }
        }
    },

    Builder {
        BuilderName = 'T1 Engineer Assist Engineer',
        PlatoonTemplate = 'EngineerAssist',
        Priority = 1,
        InstanceCount = 20,
        BuilderConditions = {
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingAssistanceGreater', { 'LocationType', 0, 'ALLUNITS' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = true,
                AssisteeType = 'Engineer',
                Time = 30,
            },
        }
    },
}



BuilderGroup {
    BuilderGroupName = 'T2EngineerBuilders',
    BuildersType = 'EngineerBuilder',
    # =====================================
    #     T2 Engineer Resource Builders
    # =====================================
    Builder {
        BuilderName = 'T2 Mass Adjacency Engineer',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 0,
        BuilderConditions = {
            { MABC, 'MarkerLessThanDistance',  { 'Mass', 100, -3, 0, 0}},
            { UCBC, 'UnitCapCheckLess', { .8 } },
            { UCBC, 'AdjacencyCheck', { 'LocationType', 'MASSEXTRACTION TECH2, MASSEXTRACTION TECH3', 100, 'ueb1106' } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'MASSEXTRACTION TECH2, MASSEXTRACTION TECH3',
                AdjacencyDistance = 100,
                BuildClose = false,
                ThreatMin = -3,
                ThreatMax = 0,
                ThreatRings = 0,
                BuildStructures = {
                    'MassStorage',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 Engineer Reclaim Excess',
        PlatoonTemplate = 'T2EngineerBuilder',
        PlatoonAIPlan = 'ReclaimAI',
        Priority = 2,
        InstanceCount = 10,
        BuilderConditions = {
                { MIBC, 'ReclaimablesInArea', { 'LocationType', }},
            },
        BuilderData = {
            LocationType = 'LocationType',
            ReclaimTime = 30,
        },
        BuilderType = 'Any',
    },
    Builder {
        BuilderName = 'T2 Engineer Reclaim Old Pgens',
        PlatoonTemplate = 'T2EngineerBuilder',
        PlatoonAIPlan = 'ReclaimStructuresAI',
        Priority = 900,
        InstanceCount = 1,
        BuilderConditions = {
                { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.1, 1.1 }},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 1, categories.TECH3 * categories.ENERGYPRODUCTION}},
                { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 0, categories.TECH1 * categories.ENERGYPRODUCTION * categories.DRAGBUILD }},
            },
        BuilderData = {
            Location = 'LocationType',
            Reclaim = {'STRUCTURE ENERGYPRODUCTION TECH1 DRAGBUILD'},
        },
        BuilderType = 'Any',
    },

    # =========================
    #     T2 ENGINEER ASSIST
    # =========================
    Builder {
        BuilderName = 'T2 Engineer Assist Energy',
        PlatoonTemplate = 'T2EngineerAssist',
        Priority = 900,
        InstanceCount = 3,
        BuilderConditions = {
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingAssistanceGreater', { 'LocationType', 0, 'ENERGYPRODUCTION TECH2, ENERGYPRODUCTION TECH3' } },
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.5 }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.7, 0.5 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = true,
                BeingBuiltCategories = { 'ENERGYPRODUCTION TECH3', 'ENERGYPRODUCTION TECH2', },
                AssisteeType = 'Engineer',
                Time = 60,
            },
        }
    },
    Builder {
        BuilderName = 'T2 Engineer Assist Factory',
        PlatoonTemplate = 'T2EngineerAssist',
        Priority = 500,
        InstanceCount = 50,
        BuilderType = 'Any',
        BuilderConditions = {
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationFactoriesBuildingGreater', { 'LocationType', 0, 'MOBILE' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1 }},
        },
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = true,
                BeingBuiltCategories = { 'MOBILE',},
                AssisteeType = 'Factory',
                Time = 60,
            },
        }
    },
    Builder {
        BuilderName = 'T2 Engineer Assist Transport',
        PlatoonTemplate = 'T2EngineerAssist',
        Priority = 875,
        BuilderConditions = {
            { UCBC, 'LocationFactoriesBuildingGreater', { 'LocationType', 0, 'TRANSPORTFOCUS' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1 }},
        },
        InstanceCount = 2,
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = false,
                BeingBuiltCategories = {'TRANSPORTFOCUS'},
                AssisteeType = 'Factory',
                Time = 60,
            },
        },
    },
    Builder {
        BuilderName = 'T2 Engineer Assist Engineer',
        PlatoonTemplate = 'T2EngineerAssist',
        Priority = 500,
        InstanceCount = 50,
        BuilderType = 'Any',
        BuilderConditions = {
            { IBC, 'BrainNotLowPowerMode', {} },
            { UCBC, 'LocationEngineersBuildingAssistanceGreater', { 'LocationType', 0, 'ALLUNITS' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.1 }},
        },
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = true,
                BeingBuiltCategories = { 'ALLUNITS' },
                AssisteeType = 'Engineer',
                Time = 60,
            },
        }
    },
    Builder {
        BuilderName = 'T2 Engineer Assist T3 Factory Upgrade',
        PlatoonTemplate = 'T2EngineerAssist',
        Priority = 975,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, 'ENGINEER TECH1'}},
            { UCBC, 'LocationFactoriesBuildingGreater', { 'LocationType', 0, 'FACTORY TECH3' }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.5, 1.1 }},
            { IBC, 'BrainNotLowPowerMode', {} },
        },
        InstanceCount = 5,
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                PermanentAssist = true,
                BeingBuiltCategories = {'FACTORY TECH3'},
                AssisteeType = 'Factory',
                Time = 60,
            },
        }
    },
}


BuilderGroup {
    BuilderGroupName = 'EngineerMassBuildersHighPri',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1ResourceEngineer 150',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1000,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 150, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 250',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 970,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 250, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 450',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 800,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 450, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 1000',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            #NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 100',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 975,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH3' }},
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 100, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 500',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        #DUNCAN - Changed from 875
        Priority = 0,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH3'}},
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T2Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 250 range',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 0, #DUNCAN - was 975
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 250, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 500 range',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        #DUNCAN - Changed from 850
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T3Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 Mass Fab Engineer',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 1200,
        BuilderConditions = {
                { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, 'MASSFABRICATION' } },
                { EBC, 'LessThanEconEfficiencyOverTime', { 0.95, 2.0}},
                { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.4, 1.2}},
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'ENERGYPRODUCTION TECH3' } }, #DUNCAN - was 0
                { IBC, 'BrainNotLowPowerMode', {} },
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'MASSEXTRACTION TECH3' } }, #DUNCAN - Added
            },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = false,
                AdjacencyCategory = 'ENERGYPRODUCTION TECH3, ENERGYPRODUCTION TECH2',
                BuildStructures = {
                    'T3MassCreation',
                },
            }
        }
    },
}




BuilderGroup {
    BuilderGroupName = 'EngineerMassBuilders - Naval',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1ResourceEngineer 150 - Naval',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1000,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 150, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 250 - Naval',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 980,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 250, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 450 - Naval',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 970,
        InstanceCount = 4,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 450, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 1000 - Naval',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            #NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 250 - Naval',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 975,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH3' }},
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 250, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource', #DUNCAN - change from T2
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 500 - Naval',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 0,
        InstanceCount = 1,
        BuilderConditions = {
                { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH3'}},
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T2Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 250 range - Naval',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 250, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 500 range - Naval',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T3Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 Mass Fab Engineer - Naval',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 900,
        BuilderConditions = {
                { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, 'MASSFABRICATION' } },
                { EBC, 'LessThanEconEfficiencyOverTime', { 0.8, 2}},
                { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.4, 1.2}},
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 2, 'ENERGYPRODUCTION TECH3' } }, #DUNCAN - was 0
                { IBC, 'BrainNotLowPowerMode', {} },
                { UCBC, 'HaveGreaterThanUnitsWithCategory', { 3, 'MASSEXTRACTION TECH3' } }, #DUNCAN - Added
            },
        BuilderType = 'Any',
        BuilderData = {
            NumAssistees = 2,
            Construction = {
                BuildClose = true,
                AdjacencyCategory = 'ENERGYPRODUCTION',
                BuildStructures = {
                    'T3MassCreation',
                },
            }
        }
    },
}




BuilderGroup {
    BuilderGroupName = 'EngineerMassBuildersLowerPri',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1ResourceEngineer 150 Low',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1000,
        InstanceCount = 2,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 150, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 350 Low',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 700,
        InstanceCount = 2,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 350, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T1ResourceEngineer 1000 Low',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 650,
        InstanceCount = 2,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            #NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2ResourceEngineer 150 Low',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1000,
        InstanceCount = 2,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 150, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true,
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 350 Low',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 0,
        InstanceCount = 1,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 350, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T2Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 1000 Low',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 0,
        InstanceCount = 1,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T2Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 350 range Low',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 350, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 1000 range Low',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        #DUNCAN - Changed from 750
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T3Resource',
                }
            }
        }
    },
}





BuilderGroup {
    BuilderGroupName = 'EngineerMassBuildersMidPriSingle',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T1ResourceEngineer 1000 Mid - Single',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 750,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            NeedGuard = true, #DUNCAN - Added
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T2 T2Resource Engineer 1000 Mid - Single',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 750,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T1Resource',
                }
            }
        }
    },
    Builder {
        BuilderName = 'T3 T3Resource Engineer 1000 range Mid - Single',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 0,
        BuilderConditions = {
                { MABC, 'CanBuildOnMassLessThanDistance', { 'LocationType', 1000, -500, 1, 0, 'AntiSurface', 1 }},
            },
        BuilderType = 'Any',
        BuilderData = {
            DesiresAssist = false,
            Construction = {
                BuildStructures = {
                    'T3Resource',
                }
            }
        }
    },
}




BuilderGroup {
    BuilderGroupName = 'EngineerEnergyBuilders',
    BuildersType = 'EngineerBuilder',
    # =====================================
    #     T2 Engineer Resource Builders
    # =====================================
    Builder {
        BuilderName = 'T1 Power Engineer - rebuild',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1100,
        BuilderConditions = {
            { MIBC, 'GreaterThanGameTime', { 600 } },
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 4, 'ENERGYPRODUCTION' } },
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.35 }},
        },
        #InstanceCount = 2,
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'FACTORY',
                BuildStructures = {
                    'T1EnergyProduction',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T1 Power Engineer',
        PlatoonTemplate = 'EcoEngineerBuilder',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 3, 'ENGINEER TECH2, ENGINEER TECH3' } },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.8, 0.5 }},
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.35 }},
        },
        #InstanceCount = 2,
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'FACTORY',
                BuildStructures = {
                    'T1EnergyProduction',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T2 Power Engineer',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.ENERGYPRODUCTION * categories.TECH2}}, #DUNCAN - Added
            { UCBC, 'EngineerLessAtLocation', { 'LocationType', 1, 'TECH3 ENGINEER' }},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.5, 0.1 }},
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.3 }}, #DUNCAN - Moved check from 1.7
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                BuildClose = true,
                AvoidCategory = 'ENERGYPRODUCTION TECH2',
                maxUnits = 5,
                maxRadius = 15,
                AdjacencyCategory = 'SHIELD STUCTURE, FACTORY TECH3, FACTORY TECH2, FACTORY TECH1',
                BuildStructures = {
                    'T2EnergyProduction',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T3 Power Engineer',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 1000,
        BuilderType = 'Any',
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.ENERGYPRODUCTION * categories.TECH2}}, #DUNCAN - Added
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.ENERGYPRODUCTION * categories.TECH3}}, #DUNCAN - Added
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.5, 0.1 }},
            { EBC, 'LessThanEconEfficiencyOverTime', { 2.0, 1.3 }}, #DUNCAN - added
        },
        BuilderData = {
            Construction = {
                BuildClose = true,
                AdjacencyCategory = 'SHIELD STUCTURE, FACTORY TECH3, FACTORY TECH2, FACTORY TECH1',
                AvoidCategory = 'ENERGYPRODUCTION TECH3',
                maxUnits = 5,
                maxRadius = 15,
                BuildStructures = {
                    'T3EnergyProduction',
                },
            }
        }
    },
}



BuilderGroup {
    BuilderGroupName = 'EngineeringSupportBuilder',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'T2 Engineering Support',
        PlatoonTemplate = 'T2EcoEngineerBuilder',
        Priority = 750,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 3, 'ENGINEERSTATION' }},
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 3, 'ENGINEER TECH2' } },
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 2, categories.TECH3 * categories.ENERGYPRODUCTION}},
            { EBC, 'GreaterThanEconIncome',  { 10, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.4 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'ENERGYPRODUCTION',
                BuildClose = true,
                FactionIndex = 1,
                BuildStructures = {
                    'T2EngineerSupport',
                },
            }
        }
    },
    Builder {
        BuilderName = 'T3 Engineering Support',
        PlatoonTemplate = 'T3EcoEngineerBuilder',
        Priority = 950,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 7, 'ENGINEERSTATION' }},
            { UCBC, 'EngineerGreaterAtLocation', { 'LocationType', 3, 'ENGINEER TECH3' } },
            { UCBC, 'UnitsGreaterAtLocation', { 'LocationType', 1, categories.TECH3 * categories.ENERGYPRODUCTION}},
            { EBC, 'GreaterThanEconIncome',  { 10, 100}},
            { IBC, 'BrainNotLowPowerMode', {} },
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.95, 1.4 }},
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = 'ENERGYPRODUCTION',
                BuildClose = true,
                FactionIndex = 1,
                BuildStructures = {
                    'T3EngineerSupport',
                },
            }
        }
    },
}