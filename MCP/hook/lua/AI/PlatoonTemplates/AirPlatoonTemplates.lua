
-- Builder
PlatoonTemplate {
    Name = 'T1X Gunship',
    FactionSquads = {
        UEF = {
            { 'mea1101', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'maa1101', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mra1101', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'msa1101', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T2X Gunship',
    FactionSquads = {
        UEF = {
            { 'mea1201', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'maa1201', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mra1201', 1, 1, 'attack', 'none' }
        },
        -- Seraphim = {
        --     { 'msa1201', 1, 1, 'attack', 'none' }
        -- },
    },
}

-- Former
PlatoonTemplate {
    Name = 'T1X Gunship Platoon',
    Plan = 'HuntAI',
    GlobalSquads = {
        { categories.MOBILE * categories.AIR * categories.TECH1 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}
PlatoonTemplate {
    Name = 'T2X Gunship Platoon',
    Plan = 'HuntAI',
    GlobalSquads = {
        { categories.MOBILE * categories.AIR * categories.TECH2 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}
PlatoonTemplate {
    Name = 'T3X Gunship Platoon',
    Plan = 'HuntAI',
    GlobalSquads = {
        { categories.MOBILE * categories.AIR * categories.TECH3 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}