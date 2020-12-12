local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local AIFArtilleryMiasmaShellWeapon = import('/lua/aeonweapons.lua').AIFArtilleryMiasmaShellWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')


MAS0106 = Class(ASeaUnit) {

    Weapons = {
		MainGun = Class(AIFArtilleryMiasmaShellWeapon) {},
    },
	
    OnCreate = function(self)
		ASeaUnit.OnCreate(self)
			self:HideBone('Upgrade01', true)  
    end,	
	
}

TypeClass = MAS0106
