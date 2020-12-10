-- Platoons to be formed ------------------------------------------------------------------------------------

-- Any tier

PlatoonTemplate {
    Name = 'EngineerAssist',
    Plan = 'ManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EngineerDrop',
    Plan = 'EngineerDropAI',
    GlobalSquads = {
        { categories.ENGINEER, 6, 6, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'EcoEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER - categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'FieldEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

-- Tier 1

PlatoonTemplate {
    Name = 'T1EngineerAssist',
    Plan = 'ManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T1EngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T1EngineerDrop',
    Plan = 'EngineerDropAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1, 6, 6, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T1EcoEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH1 - categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T1FieldEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.FIELDENGINEER * categories.TECH1, 1, 1, 'support', 'None' }
    },
}

-- Tier 2

PlatoonTemplate {
    Name = 'T2EngineerAssist',
    Plan = 'ManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2EngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2EngineerTransfer',
    Plan = 'TransferAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2EcoEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH2 - categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2FieldEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.FIELDENGINEER * categories.TECH2, 1, 1, 'support', 'None' }
    },
}

-- Tier 2 and 3

PlatoonTemplate {
    Name = 'T2T3EngineerAssist',
    Plan = 'ManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER - categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2T3EngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER - categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2T3EngineerTransfer',
    Plan = 'TransferAI',
    GlobalSquads = {
        { categories.ENGINEER - categories.TECH1, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2T3EcoEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER - categories.TECH1 - categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T2T3FieldEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.FIELDENGINEER - categories.TECH1, 1, 1, 'support', 'None' }
    },
}

-- Tier 3

PlatoonTemplate {
    Name = 'T3EngineerAssist',
    Plan = 'ManagerEngineerAssistAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 + categories.SUBCOMMANDER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T3EngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 + categories.SUBCOMMANDER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T3EngineerTransfer',
    Plan = 'TransferAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3, 1, 1, 'support', 'none' },
    },
}

PlatoonTemplate {
    Name = 'T3EcoEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.ENGINEER * categories.TECH3 - categories.FIELDENGINEER, 1, 1, 'support', 'None' }
    },
}

PlatoonTemplate {
    Name = 'T3FieldEngineerBuilder',
    Plan = 'EngineerBuildAI',
    GlobalSquads = {
        { categories.FIELDENGINEER * categories.TECH3, 1, 1, 'support', 'None' }
    },
}

-- Units to be built --------------------------------------------------------------------------------------

PlatoonTemplate {
    Name = 'T1BuildFieldEngineer',
    FactionSquads = {
        UEF = {
            { 'mel0110', 1, 1, 'support', 'None' }
        },
        Aeon = {
            { 'mal0110', 1, 1, 'support', 'None' }
        },
        Cybran = {
            { 'mrl0110', 1, 1, 'support', 'None' }
        },
        Seraphim = {
            { 'msl0110', 1, 1, 'support', 'None' }
        },
    }
}

PlatoonTemplate {
    Name = 'T2BuildFieldEngineer',
    FactionSquads = {
        UEF = {
            { 'xel0209', 1, 1, 'support', 'None' }
        },
        Aeon = {
            { 'mal0210', 1, 1, 'support', 'None' }
        },
        Cybran = {
            { 'mrl0210', 1, 1, 'support', 'None' }
        },
        Seraphim = {
            { 'msl0210', 1, 1, 'support', 'None' }
        },
    }
}

PlatoonTemplate {
    Name = 'T3BuildFieldEngineer',
    FactionSquads = {
        UEF = {
            { 'mel0310', 1, 1, 'support', 'None' }
        },
        Aeon = {
            { 'mal0310', 1, 1, 'support', 'None' }
        },
        Cybran = {
            { 'mrl0310', 1, 1, 'support', 'None' }
        },
        Seraphim = {
            { 'msl0310', 1, 1, 'support', 'None' }
        },
    }
}