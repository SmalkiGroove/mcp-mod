do

local OldModBlueprints = ModBlueprints

function ModBlueprints(all_blueprints)
    OldModBlueprints(all_blueprints)
    MCPBuildableAdds(all_blueprints.Unit)
    MCPCategoryChanges(all_blueprints.Unit)
    --MCPGlobalCategoryAdditions(all_blueprints.Unit)
    --HeavyWallBuildList(all_blueprints.Unit)
    UpgradeableVanilla(all_blueprints.Unit)
    RoundGalacticCollosusHealth(all_blueprints.Unit)
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
        xeb0104 = {'DRAGBUILD', r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T2 Engi station
        xeb0204 = {'BUILTBYTIER3ENGINEER','DRAGBUILD', r = 'BUILTBYTIER3COMMANDER'}, -- UEF T3 Engi station
        xeb0104 = {'BUILTBYTIER1ENGINEER', 'DRAGBUILD', 'TECH1', r = {'TECH2', 'BUILTBYCOMMANDER', 'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Cybran T2 Engi station
        xrb0204 = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'DRAGBUILD'},-- Cybran T2.5 Engi station
        xrb0304 = {'BUILTBYTIER3ENGINEER','DRAGBUILD', 'TECH3', r = 'TECH2'},-- Cybran T3 Engi station

        uab1102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T1 Hydrocarbon
        uab1104 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T2 Mass fab
        uab1105 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T1 Energy storage
        uab1106 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T1 Mass storage
        uab1201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T2 Power generator
        uab1202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Aeon T2 Mass extractor
        uab1301 = {r = 'BUILTBYTIER3COMANDER'}, -- Aeon T3 Power generator
        uab1302 = {r = 'BUILTBYTIER3COMANDER'}, -- Aeon T3 Mass extractor
        uab1303 = {r = 'BUILTBYTIER3COMANDER'}, -- Aeon T3 Mass fabricator

        ueb1102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T1 Hydrocarbon
        ueb1104 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T2 Mass fab
        ueb1105 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T1 Energy storage
        ueb1106 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T1 Mass storage
        ueb1201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T2 Power generator
        ueb1202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- UEF T2 Mass extractor
        ueb1301 = {r = 'BUILTBYTIER3COMANDER'}, -- UEF T3 Power generator
        ueb1302 = {r = 'BUILTBYTIER3COMANDER'}, -- UEF T3 Mass extractor
        ueb1303 = {r = 'BUILTBYTIER3COMANDER'}, -- UEF T3 Mass fabricator

        urb1102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T1 Hydrocarbon
        urb1104 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T2 Mass fab
        urb1105 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T1 Energy storage
        urb1106 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T1 Mass storage
        urb1201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T2 Power generator
        urb1202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Cybran T2 Mass extractor
        urb1301 = {r = 'BUILTBYTIER3COMANDER'}, -- Cybran T3 Power generator
        urb1302 = {r = 'BUILTBYTIER3COMANDER'}, -- Cybran T3 Mass extractor
        urb1303 = {r = 'BUILTBYTIER3COMANDER'}, -- Cybran T3 Mass fabricator

        xsb1102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T1 Hydrocarbon
        xsb1104 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T2 Mass fab
        xsb1105 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T1 Energy storage
        xsb1106 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T1 Mass storage
        xsb1201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T2 Power generator
        xsb1202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMANDER'}}, -- Seraphim T2 Mass extractor
        xsb1301 = {r = 'BUILTBYTIER3COMANDER'}, -- Seraphim T3 Power generator
        xsb1302 = {r = 'BUILTBYTIER3COMANDER'}, -- Seraphim T3 Mass extractor
        xsb1303 = {r = 'BUILTBYTIER3COMANDER'}, -- Seraphim T3 Mass fabricator


        uaa0310 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 UFO
        ual0401 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 Colossus
        uas0401 = {'BUILTBYTIER3FIELD'}, -- Aeon T4 Battleship
        xab1401 = {'SORTECONOMY', r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T4 Resource Generator
        xab2307 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = 'BUILTBYTIER3ENGINEER'}, -- Aeon T4 Rapidfire Arti
        ueb2401 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = 'BUILTBYTIER3ENGINEER'}, -- UEF T4 Arti
        xeb2402 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC'}, -- UEF T4 Satellite
        uel0401 = {NoBuild = true, },  -- UEF T4 Mobile Factory
        ues0401 = {'BUILTBYTIER3FIELD'}, -- UEF T4 Aircraft Carrier
        url0401 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Rapidfire Arti
        url0402 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Spiderbot
        xrl0403 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Megabot
        ura0401 = {'BUILTBYTIER3FIELD'}, -- Cybran T4 Gunship
        xsa0402 = {'BUILTBYTIER3FIELD'}, -- Seraphim T4 Bomber
        xsb2401 = {'BUILTBYTIER3FIELD', 'SORTSTRATEGIC'}, -- Seraphim T4 Nuke
        xsl0401 = {'BUILTBYTIER3FIELD'}, -- Seraphim T4 Bot
        
        uab2101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T1 PD
        uab2104 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T1 AAT
        uab2108 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T2 TML
        uab2109 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T1 Torpedo launcher
        uab2204 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T2 AAT
        uab2205 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T2 Torpedo launcher
        uab2301 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T2 PD
        uab2302 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Aeon T3 Heavy Arti
        uab2303 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T2 Arti
        uab2304 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Aeon T3 AAT
        uab4201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Aeon T2 TMD
        uab4202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Aeon T2 Shield
        uab4301 = {'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Aeon T3 Shield
        uab5101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Aeon T1 Wall

        ueb2101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T1 PD
        ueb2104 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T1 AAT
        ueb2108 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T2 TML
        ueb2109 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T1 Torpedo launcher
        ueb2204 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T2 AAT
        ueb2205 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T2 Torpedo launcher
        ueb2301 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T2 PD
        ueb2302 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- UEF T3 Heavy Arti
        ueb2303 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T2 Arti
        ueb2304 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- UEF T3 AAT
        ueb4201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- UEF T2 TMD
        ueb4202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- UEF T2 Shield
        ueb4301 = {'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- UEF T3 Shield
        ueb5101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- UEF T1 Wall
        xeb2306 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- UEF T3 PD

        urb2101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T1 PD
        urb2104 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T1 AAT
        urb2108 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T2 TML
        urb2109 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T1 Torpedo launcher
        urb2204 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T2 AAT
        urb2205 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T2 Torpedo launcher
        urb2301 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T2 PD
        urb2302 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Cybran T3 Heavy Arti
        urb2303 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T2 Arti
        urb2304 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Cybran T3 AAT
        urb4201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Cybran T2 TMD
        urb4202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Cybran T2 Shield
        ueb4207 = {'BUILTBYTIER3FIELD', 'SORTECONOMY', 'TECH3', r = {'BUILTBYTIER3ENGINEER', 'SORTDEFENSE', 'TECH2'}}, -- Cybran T3 Shield
        xrb2308 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Cybran T3 Torpedo launcher
        urb5101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Cybran T1 Wall

        xsb2101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T1 PD
        xsb2104 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T1 AAT
        xsb2108 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T2 TML
        xsb2109 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T1 Torpedo launcher
        xsb2204 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T2 AAT
        xsb2205 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T2 Torpedo launcher
        xsb2301 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T2 PD
        xsb2302 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Seraphim T3 Heavy Arti
        xsb2303 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T2 Arti
        xsb2304 = {'BUILTBYTIER3FIELD', r = 'BUILTBYTIER3ENGINEER'}, -- Seraphim T3 AAT
        xsb4201 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTSTRATEGIC', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Seraphim T2 TMD
        xsb4202 = {'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Seraphim T2 Shield
        xsb4301 = {'BUILTBYTIER3FIELD', 'SORTECONOMY', r = {'BUILTBYTIER3ENGINEER', 'SORTDEFENSE'}}, -- Seraphim T3 Shield
        xsb5101 = {'BUILTBYTIER1FIELD', 'BUILTBYTIER2FIELD', 'BUILTBYTIER3FIELD', r = {'BUILTBYTIER1ENGINEER', 'BUILTBYTIER2ENGINEER', 'BUILTBYTIER3ENGINEER'}}, -- Seraphim T1 Wall


        uab3101 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Aeon T1 Radar
        uab3102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Aeon T1 Sonar
        uab3104 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Radar
        uab3201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Aeon T2 Radar
        uab3202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Aeon T2 Sonar
        uab4203 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- Aeon T2 Stealth field
        uab2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Nuke Silo
        uab4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- Aeon T3 Anti Nuke
        uas0305 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Sonar
        xab3301 = {r = 'BUILTBYTIER3COMMANDER'}, -- Aeon T3 Optics

        ueb3101 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T1 Radar
        ueb3102 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T1 Sonar
        ueb3104 = {r = 'BUILTBYTIER3COMMANDER'}, -- UEF T3 Radar
        ueb3201 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T2 Radar
        ueb3202 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T2 Sonar
        ueb4203 = {r = {'BUILTBYTIER2COMMANDER', 'BUILTBYTIER3COMMANDER'}}, -- UEF T2 Stealth field
        ueb2305 = {r = 'BUILTBYTIER3COMMANDER'}, -- UEF T3 Nuke Silo
        ueb4302 = {'SORTSTRATEGIC', r = {'BUILTBYTIER3COMMANDER', 'SORTDEFENSE'}}, -- UEF T3 Anti Nuke
        ues0305 = {r = 'BUILTBYTIER3COMMANDER'}, -- UEF T3 Sonar

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
    }
    local buildcats = {
        'BUILTBYTIER1ENGINEER',
        'BUILTBYTIER1COMMANDER',
        'BUILTBYTIER1FIELD',
        'BUILTBYTIER2ENGINEER',
        'BUILTBYTIER2COMMANDER',
        'BUILTBYTIER2FIELD',
        'BUILTBYTIER3ENGINEER',
        'BUILTBYTIER3COMMANDER',
        'BUILTBYTIER3FIELD',
        'BUILTBYHEAVYWALL',
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
-- Global category additions
--------------------------------------------------------------------------------

function MCPGlobalCategoryAdditions(all_bps)
    local Cats = {
        'DRAGBUILD',
    }
    for id, bp in all_bps do
        if bp.Categories then
            for i, cat in Cats do
                if not table.find(bp.Categories, cat) then
                    table.insert(bp.Categories, cat)
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- Propperly choosing what should be buildable by the heavy walls.
--------------------------------------------------------------------------------

function HeavyWallBuildList(all_bps)
    for id, bp in all_bps do
        --Check its not hard coded to be buildable, then check it meets the standard requirements.
        if bp.Categories then
            if not table.find(bp.Categories, 'BUILTBYHEAVYWALL')
            and table.find(bp.Categories, 'STRUCTURE')
            then
                if table.find(bp.Categories, 'BUILTBYTIER1FIELD')
                or table.find(bp.Categories, 'BUILTBYTIER2FIELD')
                or table.find(bp.Categories, 'BUILTBYTIER3FIELD')
                then
                    if table.find(bp.Categories, 'DEFENSE') or table.find(bp.Categories, 'INDIRECTFIRE') then
                        --Check it wouldn't overlap badly with the wall
                        local fits = { X = false, Z = false,}
                        local correct = { X = false, Z = false,}

                        if bp.Footprint.SizeX == 3 and bp.Physics.SkirtSizeX == 3 or bp.Footprint.SizeX == 3 and bp.Physics.SkirtSizeX == 0 then
                            correct.X = true
                            fits.X = true
                        elseif bp.Physics.SkirtSizeX < 3 and bp.Footprint.SizeX < 3 then
                            fits.X = true
                        end

                        if bp.Footprint.SizeZ == 3 and bp.Physics.SkirtSizeZ == 3 or bp.Footprint.SizeZ == 3 and bp.Physics.SkirtSizeZ == 0 then
                            correct.Z = true
                            fits.Z = true
                        elseif bp.Physics.SkirtSizeZ < 3 and bp.Footprint.SizeZ < 3 then
                            fits.Z = true
                        end

                        if fits.X and fits.Z then
                            table.insert(bp.Categories, 'BUILTBYHEAVYWALL')
                            --This is to prevent it from having the same footprint as the wall
                            --and from it removing all the path blocking of the wall if it dies or gets removed.
                            --It will still remove the blocking from the center of the wall, but that's acceptable.

                            --This will also make it so those turrets will no longer block pathing whilst adjacent
                            --But that is probably fine.
                            if correct.X then
                                bp.Footprint.SizeX = 1
                                bp.Physics.SkirtOffsetX = -1
                                bp.Physics.SkirtSizeX = 3
                            end
                            if correct.Z then
                                bp.Footprint.SizeZ = 1
                                bp.Physics.SkirtOffsetZ = -1
                                bp.Physics.SkirtSizeZ = 3
                            end
                        end
                    end
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
-- My OCD GC health change change
--------------------------------------------------------------------------------

function RoundGalacticCollosusHealth(all_bps)
    if all_bps['ual0401'].Defense.Health == 99999 then all_bps['ual0401'].Defense.Health = 100000 end
    if all_bps['ual0401'].Defense.MaxHealth == 99999 then all_bps['ual0401'].Defense.MaxHealth = 100000 end
end



end
