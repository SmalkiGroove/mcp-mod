local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local SDFChronotronCannonWeapon = import('/lua/seraphimweapons.lua').SDFChronotronCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MAB2308 = Class(AStructureUnit) {

    Weapons = {
        MainGun = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlashScale = 5.5,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
        },
    },
}

TypeClass = MAB2308