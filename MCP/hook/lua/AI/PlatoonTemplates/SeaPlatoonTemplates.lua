
-- Builder
PlatoonTemplate {
    Name = 'T1X Naval',
    FactionSquads = {
        UEF = {
            { 'mes1101', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mas1101', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mrs1101', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mss1101', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T2X Naval',
    FactionSquads = {
        UEF = {
            { 'mes1201', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mas1201', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mrs1201', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mss1201', 1, 1, 'attack', 'none' }
        },
    },
}
PlatoonTemplate {
    Name = 'T3X Naval',
    FactionSquads = {
        UEF = {
            { 'mes1301', 1, 1, 'attack', 'none' }
        },
        Aeon = {
            { 'mas1301', 1, 1, 'attack', 'none' }
        },
        Cybran = {
            { 'mrs1301', 1, 1, 'attack', 'none' }
        },
        Seraphim = {
            { 'mss1301', 1, 1, 'attack', 'none' }
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