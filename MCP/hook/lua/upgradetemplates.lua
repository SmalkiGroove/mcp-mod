
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
table.insert(StructureUpgradeTemplates[1], {'ueb1102', 'mcpu2bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[1], {'mcpu2bhydro', 'mcpu3bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[1], {'ueb1301', 'mcpu3bepg'}) -- Power Generator TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'ueb1302', 'mcpu3beme'}) -- Mass Extractor TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'ueb1303', 'mcpu3bemf'}) -- Mass Fabricator TECH3. Upgrade with Engineering station feature.
table.insert(StructureUpgradeTemplates[1], {'mcpu2bwhydro', 'mcpu3bwhydro'}) -- Water Power Plant. Upgrade from TECH2 to TECH3
-- alien structure upgrades
table.insert(StructureUpgradeTemplates[2], {'uab1102', 'mcpa2bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH1 to TECH2
table.insert(StructureUpgradeTemplates[2], {'mcpa2bhydro', 'mcpa3bhydro'}) -- Hydrocarbon Power Plant. Upgrade from TECH2 to TECH3
table.insert(StructureUpgradeTemplates[2], {'uab1301', 'mcpa3bspg'}) -- Power Generator TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'uab1302', 'mcpa3bsme'}) -- Mass Extractor TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'uab1303', 'mcpa3bsmf'}) -- Mass Fabricator TECH3. Upgrade with small shield dome.
table.insert(StructureUpgradeTemplates[2], {'mcpa2bwhydro', 'mcpa3bwhydro'}) -- Water Power Plant. Upgrade from TECH2 to TECH3
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
