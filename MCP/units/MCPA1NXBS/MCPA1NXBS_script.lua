local AeonWeapons = import('/lua/aeonweapons.lua')
local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local WeaponFile = import('/lua/terranweapons.lua')
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local ADFCannonQuantumWeapon = AeonWeapons.ADFCannonQuantumWeapon
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon

MCPA1NXBS = Class(ASeaUnit) {
    Weapons = {
        FrontTurret = Class(ADFCannonQuantumWeapon) {},
        FrontTurret2 = Class(ADFCannonQuantumWeapon) {},
        FrontTurret3 = Class(ADFCannonQuantumWeapon) {},
        FrontTurret4 = Class(ADFCannonQuantumWeapon) {},
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
        AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {},
        autoattack = Class(TDFGaussCannonWeapon) {
			            FxMuzzleFlashScale = 0.0, 
    },
    },

    BackWakeEffect = {},

    OnStopBeingBuilt = function(self,builder,layer)
        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Sonar', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Sonar01', 'y', nil, 130, 0, 0))

        ASeaUnit.OnStopBeingBuilt(self,builder,layer)
      
      if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
         self:SetWeaponEnabledByLabel('autoattack', false)
      else
         self:SetWeaponEnabledByLabel('autoattack', true)
      end      
    end,
}

TypeClass = MCPA1NXBS