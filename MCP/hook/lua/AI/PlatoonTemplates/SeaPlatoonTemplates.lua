
-- Builder
PlatoonTemplate {
    Name = 'T1X Naval',
    FactionSquads = {
        UEF = {
            { 'mcpu1nxbs', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mcpa1nxbs', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mcpc1nxc', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mcps1nxdc', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T2X Naval',
    FactionSquads = {
        UEF = {
            { 'mcpu2nxbs', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mcpa2nxbs', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mcpc2nxbc', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mcps2nxd', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T3X Naval',
    FactionSquads = {
        UEF = {
            { 'mcpu3nxbs', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mcpa3nxbs', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mcpc3nxbs', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mcps3nxc', 1, 1, 'attack', 'none' }
        },
    },
}

-- Former
PlatoonTemplate {
    Name = 'T1X Ship Platoon',
    Plan = 'AttackForceAI',
    GlobalSquads = {
        { categories.MOBILE * categories.NAVAL * categories.TECH1 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}
PlatoonTemplate {
    Name = 'T2X Ship Platoon',
    Plan = 'AttackForceAI',
    GlobalSquads = {
        { categories.MOBILE * categories.NAVAL * categories.TECH2 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}
PlatoonTemplate {
    Name = 'T3X Ship Platoon',
    Plan = 'AttackForceAI',
    GlobalSquads = {
        { categories.MOBILE * categories.NAVAL * categories.TECH3 * categories.TECHEXP, 1, 10, 'Attack', 'none' },
    }
}