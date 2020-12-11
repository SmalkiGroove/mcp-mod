local uefTemplates = BuildingTemplates[1]
local aeonTemplates = BuildingTemplates[2]
local cybranTemplates = BuildingTemplates[3]
local seraphimTemplates = BuildingTemplates[4]

-- Replacements
for i in uefTemplates do
    if uefTemplates[i][0] == 'T4LandExperimental1' then
        uefTemplates[i][1] = 'mel1401'
    elseif uefTemplates[i][0] == 'T4LandExperimental2' then
        uefTemplates[i][1] = 'mel1402'
    elseif uefTemplates[i][0] == 'T4AirExperimental1' then
        uefTemplates[i][1] = 'mea1401'
    elseif uefTemplates[i][0] == 'T4SeaExperimental1' then
        uefTemplates[i][1] = 'mes1401'
    end
end
for i in aeonTemplates do
    if aeonTemplates[i][0] == 'T4LandExperimental1' then
        aeonTemplates[i][1] = 'mal1401'
    end
end
for i in cybranTemplates do
    if cybranTemplates[i][0] == 'T4LandExperimental2' then
        cybranTemplates[i][1] = 'mrl1402'
    elseif cybranTemplates[i][0] == 'T4SeaExperimental1' then
        cybranTemplates[i][1] = 'mrs1401'
    end
end
for i in seraphimTemplates do
    if seraphimTemplates[i][0] == 'T4LandExperimental2' then
        seraphimTemplates[i][1] = 'msl1402'
    elseif seraphimTemplates[i][0] == 'T4SeaExperimental1' then
        seraphimTemplates[i][1] = 'mss1401'
    end
end


-- T4 Siege
table.insert(uefTemplates, { 'T4LandExperimental3', 'mel1403'} ) -- UEF
table.insert(aeonTemplates, { 'T4LandExperimental3', 'mal1403'} ) -- Aeon
table.insert(seraphimTemplates, { 'T4LandExperimental3', 'msl1403'} ) -- Seraphim

-- T4 Ultimate
table.insert(uefTemplates, { 'T4LandExperimental4', 'mel1404'} ) -- UEF
table.insert(aeonTemplates, { 'T4LandExperimental4', 'mal1404'} ) -- Aeon
table.insert(cybranTemplates, { 'T4LandExperimental4', 'mrl1404'} ) -- Cybran
table.insert(seraphimTemplates, { 'T4LandExperimental4', 'msl1404'} ) -- Seraphim

-- T4 Defense
table.insert(uefTemplates, { 'T4Defense', 'meb2403'} ) -- UEF
table.insert(aeonTemplates, { 'T4Defense', 'mab2403'} ) -- Aeon
table.insert(cybranTemplates, { 'T4Defense', 'mrb2403'} ) -- Cybran
table.insert(seraphimTemplates, { 'T4Defense', 'msb2403'} ) -- Seraphim



-- T1X Siege
table.insert(uefTemplates, { 'T1XSiege', 'mel1102'} ) -- UEF
table.insert(aeonTemplates, { 'T1XSiege', 'mal1102'} ) -- Aeon
table.insert(cybranTemplates, { 'T1XSiege', 'mrl1102'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1XSiege', 'msl1102'} ) -- Seraphim

-- T1X Assault
table.insert(uefTemplates, { 'T1XAssault', 'mel1101'} ) -- UEF
table.insert(aeonTemplates, { 'T1XAssault', 'mal1101'} ) -- Aeon
table.insert(cybranTemplates, { 'T1XAssault', 'mrl1101'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1XAssault', 'msl1101'} ) -- Seraphim



-- T2X Siege
table.insert(uefTemplates, { 'T2XSiege', 'mel1202'} ) -- UEF
table.insert(aeonTemplates, { 'T2XSiege', 'mal1202'} ) -- Aeon
table.insert(cybranTemplates, { 'T2XSiege', 'mrl1202'} ) -- Cybran
table.insert(seraphimTemplates, { 'T2XSiege', 'msl1202'} ) -- Seraphim

-- T2X Assault
table.insert(uefTemplates, { 'T2XAssault', 'mel1201'} ) -- UEF
table.insert(aeonTemplates, { 'T2XAssault', 'mal1201'} ) -- Aeon
table.insert(cybranTemplates, { 'T2XAssault', 'mrl1201'} ) -- Cybran
table.insert(seraphimTemplates, { 'T2XAssault', 'msl1201'} ) -- Seraphim



-- T3X Gunships
table.insert(uefTemplates, { 'T3XGunship', 'mea1301'} ) -- UEF
table.insert(aeonTemplates, { 'T3XGunship', 'maa1301'} ) -- Aeon
table.insert(cybranTemplates, { 'T3XGunship', 'mra1301'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3XGunship', 'msa1301'} ) -- Seraphim

-- T3X Siege
table.insert(uefTemplates, { 'T3XSiege', 'mel1302'} ) -- UEF
table.insert(aeonTemplates, { 'T3XSiege', 'mal1302'} ) -- Aeon
table.insert(cybranTemplates, { 'T3XSiege', 'mrl1302'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3XSiege', 'msl1302'} ) -- Seraphim

-- T3X Assault
table.insert(uefTemplates, { 'T3XAssault', 'mel1301'} ) -- UEF
table.insert(aeonTemplates, { 'T3XAssault', 'mal1301'} ) -- Aeon
table.insert(cybranTemplates, { 'T3XAssault', 'mrl1301'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3XAssault', 'msl1301'} ) -- Seraphim



-- T1 Poly Point Defense
table.insert(uefTemplates, { 'T1PolyDefense', 'meb2103'} ) -- UEF
table.insert(aeonTemplates, { 'T1PolyDefense', 'mab2103'} ) -- Aeon
table.insert(cybranTemplates, { 'T1PolyDefense', 'mrb2103'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1PolyDefense', 'msb2103'} ) -- Seraphim

-- T2X Point Defense
table.insert(uefTemplates, { 'T2ExpDefense', 'meb2203'} ) -- UEF
table.insert(aeonTemplates, { 'T2ExpDefense', 'mab2203'} ) -- Aeon
table.insert(cybranTemplates, { 'T2ExpDefense', 'mrb2203'} ) -- Cybran
table.insert(seraphimTemplates, { 'T2ExpDefense', 'msb2203'} ) -- Seraphim


-- T1 Heavy Point Defense
table.insert(uefTemplates, { 'T1HeavyDefense', 'meb2102'} ) -- UEF
table.insert(aeonTemplates, { 'T1HeavyDefense', 'mab2102'} ) -- Aeon
table.insert(cybranTemplates, { 'T1HeavyDefense', 'mrb2102'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1HeavyDefense', 'msb2102'} ) -- Seraphim

-- T2 Heavy Point Defense
table.insert(uefTemplates, { 'T2HeavyDefense', 'meb2202'} ) -- UEF
table.insert(aeonTemplates, { 'T2HeavyDefense', 'mab2202'} ) -- Aeon
table.insert(cybranTemplates, { 'T2HeavyDefense', 'mrb2202'} ) -- Cybran
table.insert(seraphimTemplates, { 'T2HeavyDefense', 'msb2202'} ) -- Seraphim

-- T3 Heavy Point Defense
table.insert(uefTemplates, { 'T3HeavyDefense', 'meb2307'} ) -- UEF
table.insert(aeonTemplates, { 'T3HeavyDefense', 'mab2307'} ) -- Aeon
table.insert(cybranTemplates, { 'T3HeavyDefense', 'mrb2307'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3HeavyDefense', 'msb2307'} ) -- Seraphim



-- T1 Shields
table.insert(uefTemplates, { 'T1ShieldDefense', 'meb4101'} ) -- UEF
table.insert(aeonTemplates, { 'T1ShieldDefense', 'mab4101'} ) -- Aeon
table.insert(cybranTemplates, { 'T1ShieldDefense', 'mrb4101'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1ShieldDefense', 'msb4101'} ) -- Seraphim

-- T1 Air Staging
table.insert(uefTemplates, { 'T1AirStagingPlatform', 'meb5102'} ) -- UEF
table.insert(aeonTemplates, { 'T1AirStagingPlatform', 'mab5102'} ) -- Aeon
table.insert(cybranTemplates, { 'T1AirStagingPlatform', 'mrb5102'} ) -- Cybran
table.insert(seraphimTemplates, { 'T1AirStagingPlatform', 'msb5102'} ) -- Seraphim

-- T3 Air Staging
table.insert(uefTemplates, { 'T3AirStagingPlatform', 'meb5302'} ) -- UEF
table.insert(aeonTemplates, { 'T3AirStagingPlatform', 'mab5302'} ) -- Aeon
table.insert(cybranTemplates, { 'T3AirStagingPlatform', 'mrb5302'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3AirStagingPlatform', 'msb5302'} ) -- Seraphim


-- T2 Ship Defense
table.insert(uefTemplates, { 'T2ShipDefense', 'meb4205'} ) -- UEF
table.insert(aeonTemplates, { 'T2ShipDefense', 'mab4205'} ) -- Aeon
table.insert(cybranTemplates, { 'T2ShipDefense', 'mrb4205'} ) -- Cybran
table.insert(seraphimTemplates, { 'T2ShipDefense', 'msb4205'} ) -- Seraphim

-- T3 Ship Defense
table.insert(uefTemplates, { 'T3ShipDefense', 'meb4305'} ) -- UEF
table.insert(aeonTemplates, { 'T3ShipDefense', 'mab4305'} ) -- Aeon
table.insert(cybranTemplates, { 'T3ShipDefense', 'mrb4305'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3ShipDefense', 'msb4305'} ) -- Seraphim


-- T3 Engi Station
table.insert(uefTemplates, { 'T3EngineerSupport', 'xeb0204'} ) -- UEF
table.insert(aeonTemplates, { 'T3EngineerSupport', 'mab0304'} ) -- Aeon
table.insert(cybranTemplates, { 'T3EngineerSupport', 'xrb0304'} ) -- Cybran
table.insert(seraphimTemplates, { 'T3EngineerSupport', 'msb0304'} ) -- Seraphim
