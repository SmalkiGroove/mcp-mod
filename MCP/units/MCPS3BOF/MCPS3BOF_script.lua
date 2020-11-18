local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local RemoteViewing = import('/mods/MCP/lua/MCPUtils.lua').RemoteViewing
SStructureUnit = RemoteViewing( SStructureUnit )

MCPS3BOF = Class( SStructureUnit ) {
}

TypeClass = MCPS3BOF
