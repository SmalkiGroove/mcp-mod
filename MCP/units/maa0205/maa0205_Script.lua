local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local AIFBombQuarkWeapon = import('/lua/aeonweapons.lua').AIFBombQuarkWeapon

MAA0205 = Class(AAirUnit) {
    Weapons = {
        Bomb = Class(AIFBombQuarkWeapon) {},
    },
}

TypeClass = MAA0205
