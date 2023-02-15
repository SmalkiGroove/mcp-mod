name = "Mixed Combat Pack"
version = 104
uid = "b117ef40-2b6b-4596-96c5-xCSIxMCPv104"
icon = "/mods/MCP/mod_icon.png"
author = "CSI"
copyright = "CSI"
special_thanks = "Uveso, Balthazar"
url = "https://github.com/SmalkiGroove/mcp-mod"
description = [[
Nicely packaged unit pack using content from other mods. Full AI support and balanced (needs more feedback tho).
Check the required mods and download them all, otherwise it won't work.
Each faction has the same content quantity and quality.
-
What is included :
* split between eco engineers and field engineers => it may be disturbing not to be able to make defenses with regular engis at first but it brings clarity and organization to the large content of the mod
* early game experimentals => T1 T2 T3 exp assault bot, siege unit, gunship and battleship for every faction
* many defenses => T1 T2 T3 heavy PD (high hp and range), T1 bivalent PD (anti ground and air), T2 T4 exp PD (very high dps) but watch out for the expensive costs
* ultimate experimentals => huge experimentals that can obliterate a whole base, 1 per faction
* more navy => T1 T2 artillery ships, more battlecruisers, anti-navy defenses, and more
* resource structures => T2 T3 hydros, evolved T3 mex mfab and pgen, T2 T3 water pgen and naval rig
* custom strategic icons for all new unit categories
-
How to host ?
Create a game with this mod and all its dependencies (see mod_info.lua) so people who join can download them automatically.
Then when the game is full, disable all dependencies before starting the game.
-
Have fun !
]]

selectable = true
enabled = true
exclusive = false
ui_only = false
conflicts = {}
requiresNames = {
    ["62e2j64a-TOMA-3652-01360-146as555a8u3"] = "Total Mayhem",
    ["25D57D85-7D84-27HT-A501-BR3WL4N000084"] = "BrewLAN",
    ["190261d0-4bb0-11e2-bcSC-BLNEWUNITS02"] = "BrewLAN Units",
    ["9e8ea941-c306-aaaf-b367-u00000020000"] = "Blackops Unleashed",
    ["9e8ee941-c406-4751-b367-e10000020000"] = "Blackops ExUnits",
    ["1b6a5b64-3afe-3652-0137-8e64894b16f8"] = "Orbital Wars",
    ["2ECD8EC4-6675-11DD-8C83-853456D89593"] = "Deep Blue Naval Pack",
    ["81DE7248-XTWA-3652-0140-94B6CD7856CC"] = "Xtrem Wars",
    ["98966d50-f62d-11de-8a39-0800200c9a66"] = "Experimental Wars",
    ["dc38db7c-419f-4b16-add1-2d4d5fa5339c"] = "Extreme T1 Shields",
    ["55D5A55I-55R5-5432-2345-555YF555A55R5"] = "The Dairy Farm",
    ["e3huey1115-1FAF2-2296-1111-15555c1s23FA"] = "Marlo's mod Compilation",
}