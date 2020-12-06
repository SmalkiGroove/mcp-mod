
-- Builder
PlatoonTemplate {
    Name = 'T1X Gunship',
    FactionSquads = {
        UEF = {
            { 'mcpu1axgs', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mcpa1axgs', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mcpc1axgs', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mcps1axgs', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T2X Gunship',
    FactionSquads = {
        UEF = {
            { 'mcpu2axgs', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mcpa2axgs', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mcpc2axgs', 1, 1, 'attack', 'none' }
        },
        -- Seraphim = {
        --     { 'mcps2axt', 1, 1, 'attack', 'none' }
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