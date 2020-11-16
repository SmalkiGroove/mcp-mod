local EffectTemplate = import('/lua/EffectTemplates.lua')
local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CIFArtilleryWeapon = import('/lua/cybranweapons.lua').CIFArtilleryWeapon
local DefaultProjectileWeapon = import('/lua/sim/DefaultWeapons.lua').DefaultProjectileWeapon

MCPC3BHANB = Class(CStructureUnit) {
    Weapons = {
        MainGun = Class(CIFArtilleryWeapon) {
            FxMuzzleFlashScale = 0.6,
            FxGroundEffect = EffectTemplate.CDisruptorGroundEffect,
    

	        PlayFxMuzzleSequence = function(self, muzzle)
		        local army = self.unit:GetArmy()
		        DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
	            for k, v in self.FxGroundEffect do
                    CreateAttachedEmitter(self.unit, 'MK58', army, v)
                end
            end,
        }
    },
}

TypeClass = MCPC3BHANB