local CConstructionStructureUnit = import('/lua/cybranunits.lua').CConstructionStructureUnit
local EffectUtil = import('/lua/EffectUtilities.lua')

MCPS2BES = Class(CConstructionStructureUnit) 
{
    CreateBuildEffects = function( self, unitBeingBuilt, order )
        EffectUtil.CreateSeraphimUnitEngineerBuildingEffects( self, unitBeingBuilt, self:GetBlueprint().General.BuildBones.BuildEffectBones, self.BuildEffectsBag )
    end,
}
TypeClass = MCPS2BES
