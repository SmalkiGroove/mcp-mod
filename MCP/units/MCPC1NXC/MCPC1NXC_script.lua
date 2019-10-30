local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local WeaponFile = import('/lua/terranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon
local CIFMissileLoaWeapon = CybranWeaponsFile.CIFMissileLoaWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')


MCPC1NXC = Class(CSeaUnit) {
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
        autoattack = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 0.0, 
 	   },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Cybran_Radar', 'y', nil, 90, 0, 0))

        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
      
      if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
         self:SetWeaponEnabledByLabel('autoattack', false)
      else
         self:SetWeaponEnabledByLabel('autoattack', true)
      end      
    end,
}

TypeClass = MCPC1NXC
