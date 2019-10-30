local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local SWeapons = import ('/lua/seraphimweapons.lua')
local AWeapons = import('/lua/aeonweapons.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local AAAZealotMissileWeapon = AWeapons.AAAZealotMissileWeapon
local SDFChronotronCannonWeapon = SWeapons.SDFChronotronCannonWeapon

MCPA3BHPD = Class(TStructureUnit) {

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

TypeClass = MCPA3BHPD