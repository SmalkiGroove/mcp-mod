local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon
local SDFChronotronCannonWeapon = import('/lua/seraphimweapons.lua').SDFChronotronCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MAB2307 = Class(TStructureUnit) {

    Weapons = {
        cannonweapon = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlashScale = 4.85,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
	    },
        DeathWeapon = Class(SCUDeathWeapon) {
        },
        AntiAirMissiles = Class(AAAZealotMissileWeapon) {
	    },
    },
}

TypeClass = MAB2307