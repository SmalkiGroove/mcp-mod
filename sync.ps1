$mod_src = '.\MCP'
$mod_dest = if ($env:FAF_Mods_Dir) { "$env:FAF_Mods_Dir\MCP" } else { "C:\Users\%USERNAME%\Documents\My Games\Gas Powered Games\Supreme Commander Forged Alliance\Mods\MCP" }

Robocopy.exe $mod_src $mod_dest /MIR /Z

Read-Host