local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler
local TAirToAirLinkedRailgun = import('/lua/terranweapons.lua').TAirToAirLinkedRailgun

MEA0306 = Class(TAirUnit) {
    Weapons = {
        Torpedo = Class(TANTorpedoAngler) {},
        LinkedRailGun = Class(TAirToAirLinkedRailgun) {},
    },
}

TypeClass = MEA0306
