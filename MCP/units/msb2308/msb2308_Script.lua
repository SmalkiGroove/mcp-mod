local SStructureUnit = import('/lua/seraphimunits.lua').SStructureUnit
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')

MSB2308 = Class(SStructureUnit) {

    Weapons = {
        MainGun = Class(SAALosaareAutoCannonWeapon) { FxMuzzleScale = 3.5, },
    },
}
TypeClass = MSB2308