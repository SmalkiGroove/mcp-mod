local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')

MCPS3BAAS = Class(SStructureUnit) {

    Weapons = {
        AAGun1 = Class(SAALosaareAutoCannonWeapon) { FxMuzzleScale = 1.25, },
		AAGun2 = Class(SAALosaareAutoCannonWeapon) { FxMuzzleScale = 1.25, },
		AAGun3 = Class(SAALosaareAutoCannonWeapon) { FxMuzzleScale = 1.25, },
    },
	
	StartBeingBuiltEffects = function(self, builder, layer)
		SStructureUnit.StartBeingBuiltEffects(self, builder, layer)
		self:ForkThread( EffectUtil.CreateSeraphimExperimentalBuildBaseThread, builder, self.OnBeingBuiltEffectsBag )
    end,  
}

TypeClass = MCPS3BAAS
