local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local AIFArtilleryMiasmaShellWeapon = AeonWeapons.AIFArtilleryMiasmaShellWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon
local AANChronoTorpedoWeapon = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon

MAS0106 = Class( ASeaUnit ) {

    Weapons = {
		MainGun = Class(AIFArtilleryMiasmaShellWeapon) {},
		UpgradeGun03 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.AQuantumCannonMuzzle02
        },
		UpgradeGun04 = Class(ADFCannonQuantumWeapon) {
            FxMuzzleFlash = EffectTemplate.AQuantumCannonMuzzle02
        },
		Torpedo01 = Class(AANChronoTorpedoWeapon) {},
		ArtyUpgrade = Class(AIFArtilleryMiasmaShellWeapon) {},
    },

   OnCreate = function(self)
		ASeaUnit.OnCreate(self)
		self:HideBone('Origine04_01', true)
		self:HideBone('Turret_Center_Barrel01', true)
		self:HideBone('Turret_Center_Barrel02', true)
    end,
	
}

TypeClass = MAS0106
