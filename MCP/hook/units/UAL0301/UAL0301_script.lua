
local MCP_UAL0301 = UAL0301
local SACUEngineeringSpe = import('/mods/MCP/lua/MCPUtils.lua').SACUEngineeringSpe
MCP_UAL0301 = SACUEngineeringSpe(UAL0301, 'ResourceAllocation', 'StabilitySuppressant')

UAL0301 = Class(MCP_UAL0301) {
}

TypeClass = UAL0301
