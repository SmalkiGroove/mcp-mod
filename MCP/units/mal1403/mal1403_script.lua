local AHoverLandUnit = import('/lua/aeonunits.lua').AHoverLandUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFQuantumAutogunWeapon = AeonWeapons.ADFQuantumAutogunWeapon
local AANChronoTorpedoWeapon = AeonWeapons.AANChronoTorpedoWeapon
local AAMWillOWisp = AeonWeapons.AAMWillOWisp
local ADFDisruptorCannonWeapon = AeonWeapons.ADFDisruptorWeapon
local NavalCannonOblivionWeapon = AeonWeapons.ADFCannonOblivionNaval

MAL1403 = Class(AHoverLandUnit) {

    FxDamageScale = 2.5,
	
    Weapons = {
	
        AntiMissile = Class(AAMWillOWisp) {},
        AntiMissile2 = Class(AAMWillOWisp) {},
        Torpedo = Class(AANChronoTorpedoWeapon) {},
        RightRiotgun = Class(ADFQuantumAutogunWeapon) {},
        LeftRiotgun = Class(ADFQuantumAutogunWeapon) {},

        MainGun_01 = Class(ADFDisruptorCannonWeapon) {
            CreateProjectileAtMuzzle = function(self, muzzle)
                local proj = ADFDisruptorCannonWeapon.CreateProjectileAtMuzzle(self, muzzle)
                local data = self:GetBlueprint().DamageToShields
                if proj and not proj:BeenDestroyed() then
                    proj:PassData(data)
                end
            end,
          },
        MainGun_02 = Class(ADFDisruptorCannonWeapon) {
            CreateProjectileAtMuzzle = function(self, muzzle)
                local proj = ADFDisruptorCannonWeapon.CreateProjectileAtMuzzle(self, muzzle)
                local data = self:GetBlueprint().DamageToShields
                if proj and not proj:BeenDestroyed() then
                    proj:PassData(data)
                end
            end,
          },

        RightTurret01 = Class(NavalCannonOblivionWeapon) {},
        RightTurret02 = Class(NavalCannonOblivionWeapon) {},
        LeftTurret01 = Class(NavalCannonOblivionWeapon) {},
        LeftTurret02 = Class(NavalCannonOblivionWeapon) {},
		
    },

}

TypeClass = MAL1403

