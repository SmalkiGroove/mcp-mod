local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CANNaniteTorpedoWeapon = CybranWeaponsFile.CANNaniteTorpedoWeapon


MRS0206 = Class(CSeaUnit) {
    DestructionTicks = 200,

    Weapons = {
        Torpedo01 = Class(CANNaniteTorpedoWeapon) {},
        Torpedo02 = Class(CANNaniteTorpedoWeapon) {},
        ProtonCannon1 = Class(CDFProtonCannonWeapon) {            
		FxMuzzleFlashScale = 1.6,
},
        ProtonCannon2 = Class(CDFProtonCannonWeapon) {            
		FxMuzzleFlashScale = 1.6,
},
        AAGun1 = Class(CAAAutocannon) {},
        AAGun2 = Class(CAAAutocannon) {},
        AAGun3 = Class(CAAAutocannon) {},
        AAGun4 = Class(CAAAutocannon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object11', 'y', nil, 120, 0, 0))

        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = MRS0206
