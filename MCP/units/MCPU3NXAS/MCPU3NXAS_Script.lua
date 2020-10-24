local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local WeaponFile = import('/lua/terranweapons.lua')
local WeaponsFile = import('/lua/terranweapons.lua')
local TAALinkedRailgun = WeaponsFile.TAALinkedRailgun
local TAMPhalanxWeapon = WeaponsFile.TAMPhalanxWeapon
local TDFGaussCannonWeapon = WeaponsFile.TDFShipGaussCannonWeapon
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon

MCPU3NXAS = Class(TSeaUnit) {


    Weapons = {
        RightAAGun01 = Class(TAAFlakArtilleryCannon) {},
        RightTurret03 = Class(TDFGaussCannonWeapon) {},
        RightAAGun03 = Class(TAAFlakArtilleryCannon) {},
        BackAAGun01 = Class(TAALinkedRailgun) {},
        LeftAAGun01 = Class(TAAFlakArtilleryCannon) {},
        LeftTurret03 = Class(TDFGaussCannonWeapon) {},
        LeftAAGun03 = Class(TAAFlakArtilleryCannon) {},
        FrontAAGun01 = Class(TAALinkedRailgun) {},
		
        RightPhalanxGun01 = Class(TAMPhalanxWeapon) {
            PlayFxWeaponUnpackSequence = function(self)
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'Right_Turret02_Barrel', 'z', nil, 270, 180, 60)
                    self.unit.Trash:Add(self.SpinManip)
                end
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(500):SetPrecedence(100)
                end
                TAMPhalanxWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                TAMPhalanxWeapon.PlayFxWeaponPackSequence(self)
            end,
            
        },
        LeftPhalanxGun01 = Class(TAMPhalanxWeapon) {
            PlayFxWeaponUnpackSequence = function(self)
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'Left_Turret02_Barrel', 'z', nil, 270, 180, 60)
                    self.unit.Trash:Add(self.SpinManip)
                end
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(500):SetPrecedence(100)
                end
                TAMPhalanxWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                TAMPhalanxWeapon.PlayFxWeaponPackSequence(self)
            end,

        },
        FrontTurret01 = Class(TDFGaussCannonWeapon) {},
        FrontTurret02 = Class(TDFGaussCannonWeapon) {},
        FrontTurret03 = Class(TDFGaussCannonWeapon) {},
        FrontTurret04 = Class(TDFGaussCannonWeapon) {},
        BackTurret01 = Class(TDFGaussCannonWeapon) {},
        BackTurret02 = Class(TDFGaussCannonWeapon) {},
        BackTurret03 = Class(TDFGaussCannonWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, -45))
        self.Trash:Add(CreateRotator(self, 'Spinner02', 'y', nil, 90))
    end,
}

TypeClass = MCPU3NXAS