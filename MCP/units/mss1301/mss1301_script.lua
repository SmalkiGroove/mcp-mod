local MCPWeapons = import('/mods/MCP/lua/MCPweapons.lua')
local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SDFSinnuntheWeapon = MCPWeapons.SDFSinnuntheWeapon
local SAALosaareAutoCannonWeapon = MCPWeapons.SAALosaareAutoCannonWeapon
local SDFExperimentalPhasonProj = MCPWeapons.SDFExperimentalPhasonProj
local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator02

MSS1301 = Class(SSeaUnit) {
    Weapons = {
        Missile = Class(SDFExperimentalPhasonProj) {},
		RightAAGun = Class(SAALosaareAutoCannonWeapon) {},
		LeftAAGun = Class(SDFSinnuntheWeapon) {},
        GroundGun = Class(SDFUltraChromaticBeamGenerator) {FxMuzzleFlashScale = 2.0,},
    },

    BackWakeEffect = {},
}

TypeClass = MSS1301