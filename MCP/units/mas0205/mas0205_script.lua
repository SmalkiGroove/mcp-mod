local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon
local AIFQuasarAntiTorpedoWeapon = AeonWeapons.AIFQuasarAntiTorpedoWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local AAMWillOWisp = AeonWeapons.AAMWillOWisp
local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

MAS0205 = Class(ASeaUnit) {

    Weapons = {
        TopTurret = Class(ADFCannonQuantumWeapon) {},
        FrontTurret = Class(ADFCannonQuantumWeapon) {},
        AntiMissile = Class(AAMWillOWisp) {},
        AAGun01 = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        AAGun02 = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        AntiTorpedo01 = Class(AIFQuasarAntiTorpedoWeapon) {},
        AntiTorpedo02 = Class(AIFQuasarAntiTorpedoWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
    end,

}

TypeClass = MAS0205
