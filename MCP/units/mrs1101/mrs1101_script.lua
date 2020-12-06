local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CIFMissileLoaWeapon = CybranWeaponsFile.CIFMissileLoaWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')


MRS1101 = Class(CSeaUnit) {
    DestructionTicks = 200,

    Weapons = {
        MissileRack = Class(CIFMissileLoaWeapon) {},
        ProtonCannona1 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
},
        ProtonCannona2 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
},
        ProtonCannona3 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 0.22,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
},
        ProtonCannon1 = Class(CDFProtonCannonWeapon) {},
        ProtonCannon2 = Class(CDFProtonCannonWeapon) {},
        ProtonCannon3 = Class(CDFProtonCannonWeapon) {},
        AAGun1 = Class(CAAAutocannon) {},
        AAGun2 = Class(CAAAutocannon) {},
        AAGun3 = Class(CAAAutocannon) {},
        AAGun4 = Class(CAAAutocannon) {},
        AAGun5 = Class(CAAAutocannon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Cybran_Radar', 'y', nil, 90, 0, 0))

        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
    end,
}

TypeClass = MRS1101
