local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local WeaponsFile = import('/lua/seraphimweapons.lua')
local MCPWeaponsFile = import ('/mods/MCP/lua/MCPweapons.lua')
local SDFExperimentalPhasonProj = WeaponsFile.SDFExperimentalPhasonProj
local SDFUltraChromaticBeamGenerator = WeaponsFile.SDFUltraChromaticBeamGenerator02

MCPS3LXQB = Class(SWalkingLandUnit) {
    Weapons = {
		TorsoWeapon = Class(SDFExperimentalPhasonProj) {},
		ArmsWeapons = Class(SDFUltraChromaticBeamGenerator) {},
    },
}
TypeClass = MCPS3LXQB