
local MCP_URL0301 = URL0301
local SACUEngineeringSpe = import('/mods/MCP/lua/MCPUtils.lua').SACUEngineeringSpe
MCP_URL0301 = SACUEngineeringSpe(URL0301, 'ResourceAllocation', 'FocusConvertor')

URL0301 = Class(MCP_URL0301) {
}

TypeClass = URL0301
