local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local TWeapons = import('/lua/terranweapons.lua')
local TDFPlasmaCannonWeapon = TWeapons.TDFPlasmaCannonWeapon
local ADFLaserHighIntensityWeapon = import('/lua/aeonweapons.lua').ADFLaserHighIntensityWeapon
local AAAZealotMissileWeapon = import('/lua/aeonweapons.lua').AAAZealotMissileWeapon

MCPA2LXT = Class(AWalkingLandUnit) {
    SwitchAnims = true,
    Walking = true,
    IsWaiting = false,
	Weapons = {
		HeavyGun01 = Class(TDFPlasmaCannonWeapon) {},
		HeavyGun02 = Class(TDFPlasmaCannonWeapon) {},
		HeavyGun03 = Class(TDFPlasmaCannonWeapon) {},
		LightGun01 = Class(ADFLaserHighIntensityWeapon) {},
		LightGun02 = Class(ADFLaserHighIntensityWeapon) {},
		AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {
		
		PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                AAAZealotMissileWeapon.PlayFxWeaponPackSequence(self)
            end,      
            PlayFxRackSalvoChargeSequence = function(self)
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'RotatorAntiAir01', 'x', nil, 110, 110, 60)				
                    self.unit.Trash:Add(self.SpinManip)
                end			
                
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(180)
                end
                AAAZealotMissileWeapon.PlayFxRackSalvoChargeSequence(self)
            end,     
            PlayFxRackSalvoReloadSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(180)
                end
            end,
		},
		AntiAirMissiles02 = Class(AAAZealotMissileWeapon) {
		
		PlayFxWeaponPackSequence = function(self)
                if self.SpinManip02 then
                    self.SpinManip02:SetTargetSpeed(0)
                end
                AAAZealotMissileWeapon.PlayFxWeaponPackSequence(self)
            end,      
            PlayFxRackSalvoChargeSequence = function(self)
                if not self.SpinManip02 then 
                    self.SpinManip02 = CreateRotator(self.unit, 'RotatorAntiAir02', 'x', nil, 110, 110, 60)				
                    self.unit.Trash:Add(self.SpinManip02)
                end			
                
                if self.SpinManip then
                    self.SpinManip02:SetTargetSpeed(180)
                end
                AAAZealotMissileWeapon.PlayFxRackSalvoChargeSequence(self)
            end,     
            PlayFxRackSalvoReloadSequence = function(self)
                if self.SpinManip02 then
                    self.SpinManip02:SetTargetSpeed(180)
                end
				if self.SpinManip02 then
                    self.SpinManip02:SetTargetSpeed(180)
                end
            end,
		},
	},	
	
	OnMotionHorzEventChange = function( self, new, old )
        AWalkingLandUnit.OnMotionHorzEventChange(self, new, old)
        
        if ( old == 'Stopped' ) then
		self.Trash:Add(CreateRotator(self, 'Roue01', 'x', nil, 80, 0, 60))
		self.Trash:Add(CreateRotator(self, 'Roue02', 'x', nil, 80, 0, 60))
		elseif ( new == 'Stopped' ) then
		self.Trash:Add(CreateRotator(self, 'Roue01', 'x', nil, -80, 0, -60))
		self.Trash:Add(CreateRotator(self, 'Roue02', 'x', nil, -80, 0, -60))
		end
    end,


}

TypeClass = MCPA2LXT