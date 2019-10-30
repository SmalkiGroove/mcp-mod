local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local TerranWeapons = import( '/lua/terranweapons.lua' )
local TDFGaussCannonWeapon = TerranWeapons.TDFGaussCannonWeapon
local TIFCruiseMissileUnpackingLauncher = TerranWeapons.TIFCruiseMissileUnpackingLauncher
local TDFPlasmaCannonWeaponD = TerranWeapons.TDFPlasmaCannonWeapon
local TDFPlasmaCannonWeaponG = TerranWeapons.TDFPlasmaCannonWeapon


MCPU2LXT = Class( TLandUnit ) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {},
        
		GatlingCannonDroit = Class(TDFPlasmaCannonWeaponD) {
				IdleState = State (TDFPlasmaCannonWeaponD.IdleState) {
                Main = function(self)
                    TDFPlasmaCannonWeaponD.IdleState.Main(self)
                end,
                
                OnGotTarget = function(self)
						if not self.SpinManip01 then 
							self.SpinManip01 = CreateRotator(self.unit, 'CanonGatlingDroit02', 'z', nil, 250, 250, 250)
							self.unit.Trash:Add(self.SpinManip01)
							self.SpinManip01:SetTargetSpeed(250)
						end	
						if not self.SpinManip02 then 	
							self.SpinManip02 = CreateRotator(self.unit, 'CanonGatlingDroit01', 'z', nil, 250, 250, 250)
							self.unit.Trash:Add(self.SpinManip02)
							self.SpinManip02:SetTargetSpeed(-250)
						end	
						TDFPlasmaCannonWeaponD.OnGotTarget(self)
                end,
					OnFire = function(self)
						TDFPlasmaCannonWeaponD.IdleState.OnFire(self)
						if self.SpinManip01 then
						self.SpinManip01:SetTargetSpeed(250)
						end	
						if self.SpinManip02 then
							self.SpinManip02:SetTargetSpeed(-250)
						end
                end,                
            },
                  
            OnLostTarget = function(self)
                if self.SpinManip01 then
					self.SpinManip01:SetTargetSpeed(0)
				end	
				if self.SpinManip02 then
					self.SpinManip02:SetTargetSpeed(0)
				end

                TDFPlasmaCannonWeaponD.OnLostTarget(self)
            end,  
        },
        
		GatlingCannonGauche = Class(TDFPlasmaCannonWeaponG) {
				IdleState = State (TDFPlasmaCannonWeaponG.IdleState) {
                Main = function(self)
                    TDFPlasmaCannonWeaponG.IdleState.Main(self)
                end,
                
                OnGotTarget = function(self)
						if not self.SpinManip03 then 
							self.SpinManip03 = CreateRotator(self.unit, 'CanonGatlingGauche02', 'z', nil, 250, 250, 250)
							self.unit.Trash:Add(self.SpinManip03)
							self.SpinManip03:SetTargetSpeed(250)
						end	
						if not self.SpinManip04 then 	
							self.SpinManip04 = CreateRotator(self.unit, 'CanonGatlingGauche01', 'z', nil, 250, 250, 250)
							self.unit.Trash:Add(self.SpinManip04)
							self.SpinManip04:SetTargetSpeed(-250)
						end	
						TDFPlasmaCannonWeaponG.OnGotTarget(self)
                end,
					OnFire = function(self)
						TDFPlasmaCannonWeaponG.IdleState.OnFire(self)
						if self.SpinManip03 then
						self.SpinManip03:SetTargetSpeed(250)
						end	
						if self.SpinManip04 then
							self.SpinManip04:SetTargetSpeed(-250)
						end
                end,                
            },
                  
            OnLostTarget = function(self)
                if self.SpinManip03 then
					self.SpinManip03:SetTargetSpeed(0)
				end	
				if self.SpinManip04 then
					self.SpinManip04:SetTargetSpeed(0)
				end

                TDFPlasmaCannonWeaponG.OnLostTarget(self)
            end,  
        },
		
        MissileWeapon = Class(TIFCruiseMissileUnpackingLauncher) {
            FxMuzzleFlash = {'/effects/emitters/terran_mobile_missile_launch_01_emit.bp'},
        },
    },

}

TypeClass = MCPU2LXT
