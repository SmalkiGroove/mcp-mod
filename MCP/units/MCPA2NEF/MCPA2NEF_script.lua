local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AeonWeapons = import('/mods/MCP/lua/MCPweapons.lua') 
local ADFQuantumAutogunWeapon = AeonWeapons.ADFQuantumAutogunWeapon
local ADFCannonOblivionWeapon = AeonWeapons.ADFCannonOblivionWeapon
local AANDepthChargeBombWeapon = AeonWeapons.AANDepthChargeBombWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')


MCPA2NEF = Class(ASeaUnit) {

    Weapons = {
        MainGun = Class(ADFQuantumAutogunWeapon) {},
        MainGun2 = Class(ADFCannonOblivionWeapon) {			
            FxMuzzleFlash = EffectTemplate.AQuantumCannonMuzzle02
        },
        Torpedo01 = Class(AANDepthChargeBombWeapon) {},
    },
}

TypeClass = MCPA2NEF
