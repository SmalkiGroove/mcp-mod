local AeonWeapons = import('/lua/aeonweapons.lua')
local ASubUnit = import('/lua/aeonunits.lua').ASubUnit
local AANChronoTorpedoWeapon = import('/lua/aeonweapons.lua').AANChronoTorpedoWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon

MAS0307 = Class(ASubUnit) {
    Weapons = {
        FrontTurret = Class(ADFCannonQuantumWeapon) {},
		Torpedo01 = Class(AANChronoTorpedoWeapon) {},
    },

    --BackWakeEffect = {},
}

TypeClass = MAS0307