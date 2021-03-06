
-- Add locals for BuilderConditions
local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'


BuilderGroup {
    BuilderGroupName = 'TECHEXP Builder', -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'EngineerBuilder',

-- Land Assault T1
    Builder {
        BuilderName = 'T1XASSAULT',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 850,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 3.0, 200.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH1 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 2,
                BuildClose = false,
                BuildStructures = {
                    'T1XAssault',
                },
                Location = 'LocationType',
            }
        }
    },

-- Land Siege T1
    Builder {
        BuilderName = 'T1XSIEGE',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 855,
        InstanceCount = 1,
        BuilderConditions = {
            { MIBC, 'CanPathToCurrentEnemy', { true } },
            { EBC, 'GreaterThanEconIncome', { 3.0, 200.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH1 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 2,
                BuildClose = false,
                BuildStructures = {
                    'T1XSiege',
                },
                Location = 'LocationType',
            }
        }
    },

-- Land Assault T2
    Builder {
        BuilderName = 'T2XASSAULT',
        PlatoonTemplate = 'T2T3EngineerBuilder',
        Priority = 860,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 4.0, 300.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH2 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 3,
                BuildClose = false,
                BuildStructures = {
                    'T2XAssault',
                },
                Location = 'LocationType',
            }
        }
    },

-- Land Siege T2
    Builder {
        BuilderName = 'T2XSIEGE',
        PlatoonTemplate = 'T2T3EngineerBuilder',
        Priority = 865,
        InstanceCount = 1,
        BuilderConditions = {
            { MIBC, 'CanPathToCurrentEnemy', { true } },
            { EBC, 'GreaterThanEconIncome', { 4.0, 300.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH2 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 3,
                BuildClose = false,
                BuildStructures = {
                    'T2XSiege',
                },
                Location = 'LocationType',
            }
        }
    },

-- Land Assault T3
    Builder {
        BuilderName = 'T3XASSAULT',
        PlatoonTemplate = 'T3EngineerBuilder',
        Priority = 870,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 5.0, 400.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH3 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 4,
                BuildClose = false,
                BuildStructures = {
                    'T3XAssault',
                },
                Location = 'LocationType',
            }
        }
    },

-- Land Siege T3
    Builder {
        BuilderName = 'T3XSIEGE',
        PlatoonTemplate = 'T3EngineerBuilder',
        Priority = 875,
        InstanceCount = 1,
        BuilderConditions = {
            { MIBC, 'CanPathToCurrentEnemy', { true } },
            { EBC, 'GreaterThanEconIncome', { 5.0, 400.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 2, categories.ENGINEER * categories.TECH3 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 5, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.LAND * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 4,
                BuildClose = false,
                BuildStructures = {
                    'T3XSiege',
                },
                Location = 'LocationType',
            }
        }
    },

-- Spaceship T3
    Builder {
        BuilderName = 'T3XGUNSHIP',
        PlatoonTemplate = 'T3EngineerBuilder',
        Priority = 880,
        InstanceCount = 1,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 6.0, 500.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 3, categories.ENGINEER * categories.TECH3 }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.MOBILE * categories.AIR * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.TECH3 * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                DesiresAssist = true,
                NumAssistees = 5,
                BuildClose = false,
                BuildStructures = {
                    'T3XGunship',
                },
                Location = 'LocationType',
            }
        }
    },

-- Assister T1
    Builder {
        BuilderName = 'T1XASSIST',
        PlatoonTemplate = 'EngineerAssist',
        Priority = 800,
        InstanceCount = 5,
        BuilderConditions = {
            { UCBC, 'LocationEngineersBuildingGreater', { 'LocationType', 0, categories.TECHEXP * categories.MOBILE}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssisteeType = 'Engineer',
                AssistRange = 80,
                BeingBuiltCategories = {'TECHEXP MOBILE'},
                Time = 60,
            },
        }
    },

-- Assister T2
    Builder {
        BuilderName = 'T2XASSIST',
        PlatoonTemplate = 'T2T3EngineerAssist',
        Priority = 800,
        InstanceCount = 5,
        BuilderConditions = {
            { UCBC, 'LocationEngineersBuildingGreater', { 'LocationType', 0, categories.TECHEXP * categories.MOBILE}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssisteeType = 'Engineer',
                AssistRange = 80,
                BeingBuiltCategories = {'TECHEXP MOBILE'},
                Time = 60,
            },
        }
    },

-- Assister T3
    Builder {
        BuilderName = 'T3XASSIST',
        PlatoonTemplate = 'T3EngineerAssist',
        Priority = 800,
        InstanceCount = 5,
        BuilderConditions = {
            { UCBC, 'LocationEngineersBuildingGreater', { 'LocationType', 0, categories.TECHEXP * categories.MOBILE}},
            { EBC, 'GreaterThanEconEfficiencyOverTime', { 0.9, 1.2} },
        },
        BuilderType = 'Any',
        BuilderData = {
            Assist = {
                AssistLocation = 'LocationType',
                AssisteeType = 'Engineer',
                AssistRange = 80,
                BeingBuiltCategories = {'TECHEXP MOBILE'},
                Time = 60,
            },
        }
    },
}




BuilderGroup {
    BuilderGroupName = 'FACTORYEXP Builder',
    BuildersType = 'FactoryBuilder',

    Builder {
        BuilderName = 'T1XGUNSHIP',
        PlatoonTemplate = 'T1X Gunship',
        Priority = 860,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 3.0, 200.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 9, categories.MOBILE * categories.AIR - categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.MOBILE * categories.AIR * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.AIR * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Air',
    },

    Builder {
        BuilderName = 'T2XGUNSHIP',
        PlatoonTemplate = 'T2X Gunship',
        Priority = 870,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 4.0, 300.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 18, categories.MOBILE * categories.AIR - categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 4, categories.MOBILE * categories.AIR * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.AIR * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Air',
    },


    Builder {
        BuilderName = 'T1XSHIP',
        PlatoonTemplate = 'T1X Naval',
        Priority = 830,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 3.0, 200.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 6, categories.MOBILE * categories.NAVAL - categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 3, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Sea',
    },

    Builder {
        BuilderName = 'T2XSHIP',
        PlatoonTemplate = 'T2X Naval',
        Priority = 840,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 4.0, 300.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 12, categories.MOBILE * categories.NAVAL - categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Sea',
    },

    Builder {
        BuilderName = 'T3XSHIP',
        PlatoonTemplate = 'T3X Naval',
        Priority = 850,
        BuilderConditions = {
            { EBC, 'GreaterThanEconIncome', { 5.0, 400.0 } },
            { EBC, 'GreaterThanEconStorageRatio', { 0.5, 0.9 } },
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 18, categories.MOBILE * categories.NAVAL - categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'HaveLessThanUnitsInCategoryBeingBuilt', { 1, categories.MOBILE * categories.NAVAL * categories.TECHEXP }},
            { UCBC, 'UnitCapCheckLess', { 0.99 } },
        },
        BuilderType = 'Sea',
    },
}







BuilderGroup {
    BuilderGroupName = 'TECHEXP Former', -- BuilderGroupName, initalized from AIBaseTemplates in "\lua\AI\AIBaseTemplates\"
    BuildersType = 'PlatoonFormBuilder', -- BuilderTypes are: EngineerBuilder, FactoryBuilder, PlatoonFormBuilder.

-- Land T1
    Builder {
        BuilderName = 'T1XASSAULT PL',
        PlatoonTemplate = 'T1X Assault Platoon', -- Template Name. These units will be formed. See: "UvesoPlatoonTemplatesLand.lua"
        Priority = 5000, -- Priority. 1000 is normal.
        InstanceCount = 2, -- Number of platoons that will be formed.
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
            ThreatWeights = {
                IgnoreStrongerTargetsRatio = 100.0,
            },
        },
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.LAND * categories.TECH1 * categories.TECHEXP }},
        },
        BuilderType = 'Any', -- Build with "Land" "Air" "Sea" "Gate" or "All" Factories. - "Any" forms a Platoon.
    },

-- Air T1
    Builder {
        BuilderName = 'T1XGUNSHIP PL',
        PlatoonTemplate = 'T1X Gunship Platoon',
        Priority = 5000,
        InstanceCount = 2,
        BuilderData = {
            SearchRadius = 10000,
            DistressRange = 500,
            PrioritizedCategories = {
                'ENERGYPRODUCTION DRAGBUILD',
                'ENGINEER',
                'MASSEXTRACTION',
                'MOBILE LAND',
                'MASSFABRICATION',
                'SHIELD',
                'ANTIAIR STRUCTURE',
                'DEFENSE STRUCTURE',
                'STRUCTURE',
                'COMMAND',
                'MOBILE ANTIAIR',
                'ALLUNITS',
            },
        },
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.AIR * categories.TECH1 * categories.TECHEXP }},
        },
        BuilderType = 'Any',
    },

-- Sea T1
    Builder {
        BuilderName = 'T1XSHIP PL',
        PlatoonTemplate = 'T1X Ship Platoon',
        Priority = 5000,
        InstanceCount = 2,
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = true,
            UseFormation = 'AttackFormation',
            ThreatWeights = {
                IgnoreStrongerTargetsRatio = 100.0,
            },
        },
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.NAVAL * categories.TECH1 * categories.TECHEXP }},
        },
        BuilderType = 'Any',
    },

-- Land T2
Builder {
    BuilderName = 'T2XASSAULT PL',
    PlatoonTemplate = 'T2X Assault Platoon',
    Priority = 5000, 
    InstanceCount = 2,
    BuilderData = {
        NeverGuardBases = true,
        NeverGuardEngineers = true,
        UseFormation = 'AttackFormation',
        ThreatWeights = {
            IgnoreStrongerTargetsRatio = 100.0,
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.LAND * categories.TECH2 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

-- Air T2
Builder {
    BuilderName = 'T2XGUNSHIP PL',
    PlatoonTemplate = 'T2X Gunship Platoon',
    Priority = 5000,
    InstanceCount = 2,
    BuilderData = {
        SearchRadius = 10000,
        DistressRange = 500,
        PrioritizedCategories = {
            'ENERGYPRODUCTION DRAGBUILD',
            'ENGINEER',
            'MASSEXTRACTION',
            'MOBILE LAND',
            'MASSFABRICATION',
            'SHIELD',
            'ANTIAIR STRUCTURE',
            'DEFENSE STRUCTURE',
            'STRUCTURE',
            'COMMAND',
            'MOBILE ANTIAIR',
            'ALLUNITS',
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.AIR * categories.TECH2 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

-- Sea T2
Builder {
    BuilderName = 'T2XSHIP PL',
    PlatoonTemplate = 'T2X Ship Platoon',
    Priority = 5000,
    InstanceCount = 2,
    BuilderData = {
        NeverGuardBases = true,
        NeverGuardEngineers = true,
        UseFormation = 'AttackFormation',
        ThreatWeights = {
            IgnoreStrongerTargetsRatio = 100.0,
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.NAVAL * categories.TECH2 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

-- Land T3
Builder {
    BuilderName = 'T3XASSAULT PL',
    PlatoonTemplate = 'T3X Assault Platoon',
    Priority = 5000, 
    InstanceCount = 2,
    BuilderData = {
        NeverGuardBases = true,
        NeverGuardEngineers = true,
        UseFormation = 'AttackFormation',
        ThreatWeights = {
            IgnoreStrongerTargetsRatio = 100.0,
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.LAND * categories.TECH3 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

-- Air T3
Builder {
    BuilderName = 'T3XGUNSHIP PL',
    PlatoonTemplate = 'T3X Gunship Platoon',
    Priority = 5000,
    InstanceCount = 2,
    BuilderData = {
        SearchRadius = 10000,
        DistressRange = 500,
        PrioritizedCategories = {
            'ENERGYPRODUCTION DRAGBUILD',
            'ENGINEER',
            'MASSEXTRACTION',
            'MOBILE LAND',
            'MASSFABRICATION',
            'SHIELD',
            'ANTIAIR STRUCTURE',
            'DEFENSE STRUCTURE',
            'STRUCTURE',
            'COMMAND',
            'MOBILE ANTIAIR',
            'ALLUNITS',
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.AIR * categories.TECH3 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

-- Sea T3
Builder {
    BuilderName = 'T3XSHIP PL',
    PlatoonTemplate = 'T3X Ship Platoon',
    Priority = 5000,
    InstanceCount = 2,
    BuilderData = {
        NeverGuardBases = true,
        NeverGuardEngineers = true,
        UseFormation = 'AttackFormation',
        ThreatWeights = {
            IgnoreStrongerTargetsRatio = 100.0,
        },
    },
    BuilderConditions = {
        { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.MOBILE * categories.NAVAL * categories.TECH3 * categories.TECHEXP }},
    },
    BuilderType = 'Any',
},

}