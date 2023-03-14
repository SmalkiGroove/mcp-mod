local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local WeaponsFile = import('/lua/seraphimweapons.lua')
local MCPWeaponsFile = import ('/mods/MCP/lua/MCPweapons.lua')
local SDFSinnuntheWeapon = WeaponsFile.SDFSinnuntheWeapon
local SDFUltraChromaticBeamGenerator = WeaponsFile.SDFUltraChromaticBeamGenerator02

MSL1403 = Class(SWalkingLandUnit) {

    Weapons = {
      TorsoWeapon = Class(SDFSinnuntheWeapon) {FxMuzzleFlashScale = 4},
      ArmsWeapons = Class(SDFUltraChromaticBeamGenerator) {},
    },
    
    OnStopBeingBuilt = function(self, builder, layer)
      SWalkingLandUnit.OnStopBeingBuilt(self, builder, layer)
      CreateAttachedEmitter(self, 'BigWeaponMuzzle', self:GetArmy(), '/effects/emitters/seraphim_t1_power_ambient_01_emit.bp'):OffsetEmitter(-0.28,-0.28,-0.4)
      CreateAttachedEmitter(self, 'BigWeaponMuzzle', self:GetArmy(), '/effects/emitters/seraphim_chromatic_beam_generator_hit_03_emit.bp'):OffsetEmitter(0,-0.28,-0.4)
      CreateAttachedEmitter(self, 'BigWeaponMuzzle', self:GetArmy(), '/effects/emitters/seraphim_shield_generator_t3_05_emit.bp'):OffsetEmitter(0,-3.6,-0.35)
      CreateAttachedEmitter(self, 'BigWeaponMuzzle', self:GetArmy(), '/effects/emitters/seraphim_shield_generator_t3_02_emit.bp'):OffsetEmitter(0,-3.6,-1)
    end,

}
TypeClass = MSL1403