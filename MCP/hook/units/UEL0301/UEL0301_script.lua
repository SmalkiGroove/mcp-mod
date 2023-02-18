
local MCP_UEL0301 = UEL0301
local SACUEngineeringSpe = import('/mods/MCP/lua/MCPUtils.lua').SACUEngineeringSpe
MCP_UEL0301 = SACUEngineeringSpe(UEL0301, 'ResourceAllocation', 'HighExplosiveOrdnance')

UEL0301 = Class(MCP_UEL0301) {
}

TypeClass = UEL0301
