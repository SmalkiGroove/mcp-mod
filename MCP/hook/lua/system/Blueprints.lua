do

local OldModBlueprints = ModBlueprints

function ModBlueprints(all_blueprints)
    OldModBlueprints(all_blueprints)
    MCPBuildableAdds(all_blueprints.Unit)
    MCPCategoryChanges(all_blueprints.Unit)
    --HeavyWallBuildList(all_blueprints.Unit)
    UpgradeableVanilla(all_blueprints.Unit)
    StrategicIcons(all_blueprints.Unit)
end

--------------------------------------------------------------------------------
-- Additional buildable categories
--------------------------------------------------------------------------------

function MCPBuildableAdds(all_bps)
    local units_buildcats = {
        xel0209 = {'BUILTBYTIER2FIELD UEF',},
    }
    for unitid, buildcat in units_buildcats do
        if all_bps[unitid] and all_bps[unitid].Economy.BuildableCategory then   --Xtreme Wars crash fix here. They removed the Fatboys ability to build.
            all_bps[unitid].Economy.BuildableCategory = {}
            for i in buildcat do
                table.insert(all_bps[unitid].Economy.BuildableCategory, buildcat[i])
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Unit category changes
--------------------------------------------------------------------------------

function MCPCategoryChanges(all_bps)
    local Units = {
        xeb0104 = { -- UEF T2 Engi station
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xeb0204 = { -- UEF T3 Engi station
            'CQUEMOV', 'DRAGBUILD', 'BUILTBYTIER3ENGINEER'
        },
        xrb0104 = { -- Cybran T1 Engi station
            'BUILTBYTIER1ENGINEER', 'TECH1',
            r = {'TECH2', 'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xrb0204 = { -- Cybran T2 Engi station
            'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER',
        },
        xrb0304 = { -- Cybran T3 Engi station
            'BUILTBYTIER3ENGINEER', 'TECH3',
            r = 'TECH2'
        },

        uab1102 = { -- Aeon T1 Hydrocarbon
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        uab1104 = { -- Aeon T2 Mass fab
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        uab1105 = { -- Aeon T1 Energy storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        uab1106 = { -- Aeon T1 Mass storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        uab1303 = { -- Aeon T3 Mass fabricator
            r = 'BUILTBYTIER3COMMANDER'
        },

        ueb1102 = { -- UEF T1 Hydrocarbon
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        ueb1104 = { -- UEF T2 Mass fab
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        ueb1105 = { -- UEF T1 Energy storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        ueb1106 = { -- UEF T1 Mass storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        ueb1303 = { -- UEF T3 Mass fabricator
            r = 'BUILTBYTIER3COMMANDER'
        },

        urb1102 = { -- Cybran T1 Hydrocarbon
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        urb1104 = { -- Cybran T2 Mass fab
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        urb1105 = { -- Cybran T1 Energy storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        urb1106 = { -- Cybran T1 Mass storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        urb1303 = { -- Cybran T3 Mass fabricator
            r = 'BUILTBYTIER3COMMANDER'
        },

        xsb1102 = { -- Seraphim T1 Hydrocarbon
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xsb1104 = { -- Seraphim T2 Mass fab
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xsb1105 = { -- Seraphim T1 Energy storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xsb1106 = { -- Seraphim T1 Mass storage
            r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}
        },
        xsb1303 = { -- Seraphim T3 Mass fabricator
            r = 'BUILTBYTIER3COMMANDER'
        },


        uaa0310 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 UFO
        ual0401 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 Colossus
        uas0401 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 Battleship
        xab1401 = {NoBuild = true}, -- Aeon T4 Resource Generator
        xab2307 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC'}, -- Aeon T4 Rapidfire Arti
        ueb2401 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC'}, -- UEF T4 Arti
        xeb2402 = {NoBuild = true}, -- UEF T4 Satellite
        uel0401 = {NoBuild = true},  -- UEF T4 Mobile Factory
        ues0401 = {NoBuild = true}, -- UEF T4 Aircraft Carrier
        url0401 = {NoBuild = true}, -- Cybran T4 Rapidfire Arti
        url0402 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Spiderbot
        xrl0403 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Megabot
        ura0401 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Gunship
        xsa0402 = {'BUILTBYTIER3FIELD'}, -- Seraphim T4 Bomber
        xsb2401 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC'}, -- Seraphim T4 Nuke
        xsl0401 = {'BUILTBYTIER3FIELD'}, -- Seraphim T4 Bot


        uab2101 = { -- Aeon T1 PD
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2104 = { -- Aeon T1 AAT
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2108 = { -- Aeon T2 TML
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2109 = { -- Aeon T1 Torpedo launcher
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2204 = { -- Aeon T2 AAT
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2205 = { -- Aeon T2 Torpedo launcher
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2301 = { -- Aeon T2 PD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2302 = { -- Aeon T3 Heavy Arti
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        uab2303 = { -- Aeon T2 Arti
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        uab2304 = { -- Aeon T3 AAT
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        uab4201 = { -- Aeon T2 TMD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}
        },
        uab4202 = { -- Aeon T2 Shield
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        uab4301 = { -- Aeon T3 Shield
            'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        uab5101 = { -- Aeon T1 Wall
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },

        ueb2101 = { -- UEF T1 PD
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2104 = { -- UEF T1 AAT
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2108 = { -- UEF T2 TML
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2109 = { -- UEF T1 Torpedo launcher
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2204 = { -- UEF T2 AAT
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2205 = { -- UEF T2 Torpedo launcher
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2301 = { -- UEF T2 PD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2302 = { -- UEF T3 Heavy Arti
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        ueb2303 = { -- UEF T2 Arti
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        ueb2304 = { -- UEF T3 AAT
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        ueb4201 = { -- UEF T2 TMD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}
        },
        ueb4202 = { -- UEF T2 Shield
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        ueb4301 = { -- UEF T3 Shield
            'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        ueb5101 = { -- UEF T1 Wall
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xeb2306 = { -- UEF T3 PD
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },

        urb2101 = { -- Cybran T1 PD
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2104 = { -- Cybran T1 AAT
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2108 = { -- Cybran T2 TML
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2109 = { -- Cybran T1 Torpedo launcher
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2204 = { -- Cybran T2 AAT
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2205 = { -- Cybran T2 Torpedo launcher
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2301 = { -- Cybran T2 PD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2302 = { -- Cybran T3 Heavy Arti
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        urb2303 = { -- Cybran T2 Arti
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        urb2304 = { -- Cybran T3 AAT
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        urb4201 = { -- Cybran T2 TMD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}
        },
        urb4202 = { -- Cybran T2 Shield
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        ueb4207 = { -- Cybran T3 Shield
            'BUILTBYTIER3FIELD', 'SORTECONOMY', 'TECH3',
            r = {'SORTDEFENSE', 'TECH2'}
        },
        xrb2308 = { -- Cybran T3 Torpedo launcher
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        urb5101 = { -- Cybran T1 Wall
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },

        xsb2101 = { -- Seraphim T1 PD
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2104 = { -- Seraphim T1 AAT
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2108 = { -- Seraphim T2 TML
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2109 = { -- Seraphim T1 Torpedo launcher
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2204 = { -- Seraphim T2 AAT
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2205 = { -- Seraphim T2 Torpedo launcher
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2301 = { -- Seraphim T2 PD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2302 = { -- Seraphim T3 Heavy Arti
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        xsb2303 = { -- Seraphim T2 Arti
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },
        xsb2304 = { -- Seraphim T3 AAT
            'BUILTBYTIER3FIELD',
            r = 'BUILTBYTIER3ENGINEER'
        },
        xsb4201 = { -- Seraphim T2 TMD
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC',
            r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}
        },
        xsb4202 = { -- Seraphim T2 Shield
            'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        xsb4301 = { -- Seraphim T3 Shield
            'BUILTBYTIER3FIELD', 'SORTECONOMY',
            r = {'SORTDEFENSE'}
        },
        xsb5101 = { -- Seraphim T1 Wall
            'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD',
            r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}
        },


        uab3101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- Aeon T1 Radar
        uab3102 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- Aeon T1 Sonar
        uab3104 = {'BUILTBYTIER3FIELD'}, -- Aeon T3 Radar
        uab3201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- Aeon T2 Radar
        uab3202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- Aeon T2 Sonar
        uab4203 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- Aeon T2 Stealth field
        uab2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Nuke Silo
        uab4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- Aeon T3 Anti Nuke
        uas0305 = {'BUILTBYTIER3FIELD'}, -- Aeon T3 Sonar
        xab3301 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Optics

        ueb3101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- UEF T1 Radar
        ueb3102 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- UEF T1 Sonar
        ueb3104 = {'BUILTBYTIER3FIELD'}, -- UEF T3 Radar
        ueb3201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- UEF T2 Radar
        ueb3202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- UEF T2 Sonar
        ueb4203 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD'}, -- UEF T2 Stealth field
        ueb2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- UEF T3 Nuke Silo
        ueb4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- UEF T3 Anti Nuke
        ues0305 = {'BUILTBYTIER3FIELD'}, -- UEF T3 Sonar

        urb3101 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T1 Radar
        urb3102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T1 Sonar
        urb3104 = {r = 'BUILTBYTIER3COMMANDER'}, -- Cybran T3 Radar
        urb3201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T2 Radar
        urb3202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T2 Sonar
        urb4203 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T2 Stealth field
        urb2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Cybran T3 Nuke Silo
        urb4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- Cybran T3 Anti Nuke
        xrb3301 = {r = 'BUILTBYTIER3COMMANDER'}, -- Cybran T3 Perimeter Monitoring
        urs0305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Cybran T3 Sonar

        xsb3101 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Seraphim T1 Radar
        xsb3102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Seraphim T1 Sonar
        xsb3104 = {r = 'BUILTBYTIER3COMMANDER'}, -- Seraphim T3 Radar
        xsb3201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Seraphim T2 Radar
        xsb3202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Seraphim T2 Sonar
        xsb4203 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Seraphim T2 Stealth field
        xsb2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Seraphim T3 Nuke Silo
        xsb4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- Seraphim T3 Anti Nuke

        uab5202 = { -- Aeon Air Staging
            'TECH2',
            r = {'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER','BUILTBYTIER3COMMANDER', 'BUILTBYTIER1ENGINEER', 'TECH1'}
        },
        ueb5202 = { -- UEF Air Staging
            'TECH2',
            r = {'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER','BUILTBYTIER3COMMANDER', 'BUILTBYTIER1ENGINEER', 'TECH1'}
        },
        urb5202 = { -- Cybran Air Staging
            'TECH2',
            r = {'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER','BUILTBYTIER3COMMANDER', 'BUILTBYTIER1ENGINEER', 'TECH1'}
        },
        xsb5202 = { -- Seraphim Air Staging
            'TECH2',
            r = {'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER','BUILTBYTIER3COMMANDER', 'BUILTBYTIER1ENGINEER', 'TECH1'}
        },

        ues0304 = {NoBuild = true, },  -- UEF T3 Strategic submarine
        urs0304 = {NoBuild = true, },  -- Cybran T3 Strategic submarine
        uas0304 = {NoBuild = true, },  -- Aeon T3 Strategic submarine
    }
    local buildcats = {
        'BUILTBYCOMMANDER',
        'BUILTBYTIER1ENGINEER',
        'BUILTBYTIER1COMMANDER',
        'BUILTBYTIER1FIELD',
        'BUILTBYTIER2ENGINEER',
        'BUILTBYTIER2COMMANDER',
        'BUILTBYTIER2FIELD',
        'BUILTBYTIER3ENGINEER',
        'BUILTBYTIER3COMMANDER',
        'BUILTBYTIER3FIELD',
    }
    for k, v in Units do
        --Make sure the unit exists, and has its table
        if all_bps[k] and all_bps[k].Categories then
            if not v.NoBuild then
                for i in v do
                    if i == 'r' then
                        if type(v.r) == 'string' then
                            table.removeByValue(all_bps[k].Categories, v.r)
                        elseif type(v.r) == 'table' then
                            for i in v.r do
                                table.removeByValue(all_bps[k].Categories, v.r[i])
                            end
                        end
                    else
                        table.insert(all_bps[k].Categories, v[i])
                    end
                end
            else
                for i in buildcats do
                    table.removeByValue(all_bps[k].Categories, buildcats[i])
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Specifying units to be upgradable into eachother
--------------------------------------------------------------------------------

function UpgradeableVanilla(all_bps)
    local VanillasToUpgrade = {
        uab4202 = 'uab4301',--FromAeon T2 shield
        urb1301 = 'mcpc3bcpg',--To Cloakable Generator
        urb1302 = 'mcpc3bcme',--To Cloakable Extractor
        urb1303 = 'mcpc3bcmf',--To Cloakable Fabricator
        ueb1301 = 'mcpu3bepg',--To engineering Generator
        ueb1302 = 'mcpu3beme',--To engineering Extractor
        ueb1303 = 'mcpu3bemf',--To engineering Fabricator
        uab1301 = 'mcpa3bspg',--To shielded Generator
        uab1302 = 'mcpa3bsme',--To shielded Extractor
        uab1303 = 'mcpa3bsmf',--To shielded Fabricator
        xsb1301 = 'mcps3bapg',--To Armored Generator
        xsb1302 = 'mcps3bame',--To Armored Extractor
        xsb1303 = 'mcps3bamf',--To Armored Fabricator
        uab1102 = 'mcpa2bhydro',--Hydrocarbon Aeon
        ueb1102 = 'mcpu2bhydro',--Hydrocarbon UEF
        urb1102 = 'mcpc2bhydro',--Hydrocarbon Cybran
        xsb1102 = 'mcps2bhydro',--Hydrocarbon Seraphim
    }
    for unitid, upgradeid in VanillasToUpgrade do
        if all_bps[unitid] and all_bps[upgradeid] then
            table.insert(all_bps[unitid].Categories, 'SHOWQUEUE')

            if not all_bps[unitid].Display.Abilities then all_bps[unitid].Display.Abilities = {} end
            table.removeByValue(all_bps[unitid].Display.Abilities, '<LOC ability_upgradable>Upgradeable')--Preventing double ability in certain units.
            table.insert(all_bps[unitid].Display.Abilities, '<LOC ability_upgradable>Upgradeable')

            if not all_bps[unitid].Economy.RebuildBonusIds then all_bps[unitid].Economy.RebuildBonusIds = {} end
            table.insert(all_bps[unitid].Economy.RebuildBonusIds, upgradeid)

            if not all_bps[unitid].Economy.BuildableCategory then all_bps[unitid].Economy.BuildableCategory = {} end
            table.insert(all_bps[unitid].Economy.BuildableCategory, upgradeid)

            all_bps[unitid].General.UpgradesTo = upgradeid
            all_bps[upgradeid].General.UpgradesFrom = unitid

            if not all_bps[unitid].Economy.BuildRate then all_bps[unitid].Economy.BuildRate = 15 end

            all_bps[unitid].General.CommandCaps.RULEUCC_Pause = true
        end
    end
    local UpgradesFromBase = {
        -- Base        Max
        urb1103 = 'mcpc3bcme',--To Cloakable Extractor
        ueb1103 = 'mcpu3beme',--To engineering Extractor
        uab1103 = 'mcpa3bsme',--To shielded Extractor
        xsb1103 = 'mcps3bame',--To Armored Extractor
        uab1102 = 'mcpa3bhydro',--To T3 Hydrocarbon
        ueb1102 = 'mcpu3bhydro',--To T3 Hydrocarbon
        urb1102 = 'mcpc3bhydro',--To T3 Hydrocarbon
        xsb1102 = 'mcps3bhydro',--To T3 Hydrocarbon
    }
    --This could potentially loop forever if someone broke the upgrade chain elsewhere
    for unitid, upgradeid in UpgradesFromBase do
        if all_bps[upgradeid] then
            local nextID = upgradeid
            while true do
                if nextID == unitid then break end
                all_bps[nextID].General.UpgradesFromBase = unitid
                --LOG(all_bps[nextID].Description, unitid )
                if all_bps[nextID].General.UpgradesFrom then
                    nextID = all_bps[nextID].General.UpgradesFrom
                else
                    break
                end
            end
        end
    end
end


--------------------------------------------------------------------------------
-- Specifying units which icon has to be changed
--------------------------------------------------------------------------------

function StrategicIcons(all_bps)
    local IconChanges = {
        uab5202 = 'icon_structure2_air',-- Aeon Air Staging
        ueb5202 = 'icon_structure2_air',-- UEF Air Staging
        urb5202 = 'icon_structure2_air',-- Cybran Air Staging
        xsb5202 = 'icon_structure2_air',-- Seraphim Air Staging
        xrb0104 = 'icon_structure1_engineer',-- Cybran T1 Engi Station
        xrb0304 = 'icon_structure3_engineer',-- Cybran T3 Engi Station
    }
    for unitid, icon in IconChanges do
        all_bps[unitid].StrategicIconName = icon
    end
end



end
