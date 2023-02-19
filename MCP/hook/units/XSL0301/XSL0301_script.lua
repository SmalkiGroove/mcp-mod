
local MCP_XSL0301 = XSL0301
local SACUEngineeringSpe = import('/mods/MCP/lua/MCPUtils.lua').SACUEngineeringSpe
MCP_XSL0301 = SACUEngineeringSpe(XSL0301, 'EnhancedSensors', 'Overcharge')

XSL0301 = Class(MCP_XSL0301) {
}

TypeClass = XSL0301
