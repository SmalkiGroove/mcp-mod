
PlatoonTemplate {
    Name = 'T1PowerHydroUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH1, 1, 1, 'support', 'None'},
    }
}
PlatoonTemplate {
    Name = 'T2PowerHydroUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.HYDROCARBON * categories.ENERGYPRODUCTION * categories.TECH2, 1, 1, 'support', 'None'},
    }
}

PlatoonTemplate {
    Name = 'T3PowerGenUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.STRUCTURE * categories.ENERGYPRODUCTION * categories.TECH3 - categories.HYDROCARBON - categories.NAVAL, 1, 1, 'support', 'None'},
    }
}
PlatoonTemplate {
    Name = 'T3MassExtUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.STRUCTURE * categories.MASSEXTRACTION * categories.TECH3 - categories.NAVAL, 1, 1, 'support', 'None'},
    }
}
PlatoonTemplate {
    Name = 'T3MassFabUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.STRUCTURE * categories.MASSFABRICATION * categories.TECH3 - categories.NAVAL, 1, 1, 'support', 'None'},
    }
}

PlatoonTemplate {
    Name = 'T2WaterHydroUpgrade',
    Plan = 'UnitUpgradeAI',
    GlobalSquads = {
        {categories.STRUCTURE * categories.ENERGYPRODUCTION * categories.TECH2 * categories.NAVAL, 1, 1, 'support', 'None'},
    }
}


-- StructureUpgradeTemplates
-- called from platoon.lua -> UnitUpgradeAI()

-- earth structure upgrades
table.insert(StructureUpgradeTemplates[1], {'ueb1102', 'meb1204'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[1], {'meb1204', 'meb1304'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[1], {'ueb1301', 'meb1305'}) -- Power Generator TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'ueb1302', 'meb1306'}) -- Mass Extractor TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'ueb1303', 'meb1307'}) -- Mass Fabricator TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'meb1208', 'meb1308'}) -- Water Power Plant. Upgrade from TECH2 to TECH3
-- alien structure upgrades
table.insert(StructureUpgradeTemplates[2], {'uab1102', 'mab1204'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[2], {'mab1204', 'mab1304'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[2], {'uab1301', 'mab1305'}) -- Power Generator TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'uab1302', 'mab1306'}) -- Mass Extractor TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'uab1303', 'mab1307'}) -- Mass Fabricator TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'mab1208', 'mab1308'}) -- Water Power Plant. Upgrade from TECH2 to TECH3
-- recycler structure upgrades
table.insert(StructureUpgradeTemplates[3], {'urb1102', 'mcpc2bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[3], {'mcpc2bhydro', 'mcpc3bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[3], {'urb1301', 'mcpc3bcpg'}) -- Power Generator TECH3. Upgrade with Cloaking feature.
table.insert(StructureUpgradeTemplates[3], {'urb1302', 'mcpc3bcme'}) -- Mass Extractor TECH3. Upgrade with Cloaking feature.
table.insert(StructureUpgradeTemplates[3], {'urb1303', 'mcpc3bcmf'}) -- Mass Fabricator TECH3. Upgrade with Cloaking feature.
table.insert(StructureUpgradeTemplates[3], {'mcpc2bwhydro', 'mcpc3bwhydro'}) -- Water Power Plant. Upgrade from TECH2 to TECH3
-- seraphim structure upgrades
table.insert(StructureUpgradeTemplates[4], {'xsb1102', 'mcps2bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[4], {'mcps2bhydro', 'mcps3bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[4], {'xsb1301', 'mcps3bapg'}) -- Power Generator TECH3. Upgrade with great tankiness.
table.insert(StructureUpgradeTemplates[4], {'xsb1302', 'mcps3bame'}) -- Mass Extractor TECH3. Upgrade with great tankiness.
table.insert(StructureUpgradeTemplates[4], {'xsb1303', 'mcps3bamf'}) -- Mass Fabricator TECH3. Upgrade with great tankiness.
table.insert(StructureUpgradeTemplates[4], {'mcps2bwhydro', 'mcps3bwhydro'}) -- Water Power Plant. Upgrade from TECH2 to TECH3