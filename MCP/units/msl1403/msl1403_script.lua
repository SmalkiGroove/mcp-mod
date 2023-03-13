local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local WeaponsFile = import('/lua/seraphimweapons.lua')
local MCPWeaponsFile = import ('/mods/MCP/lua/MCPweapons.lua')
local SDFExperimentalPhasonProj = WeaponsFile.SDFExperimentalPhasonProj
local SDFUltraChromaticBeamGenerator = WeaponsFile.SDFUltraChromaticBeamGenerator02

MSL1403 = Class(SWalkingLandUnit) {
    Weapons = {
      TorsoWeapon = Class(SDFExperimentalPhasonProj) {},
      ArmsWeapons = Class(SDFUltraChromaticBeamGenerator) {},
    },
}
TypeClass = MSL1403