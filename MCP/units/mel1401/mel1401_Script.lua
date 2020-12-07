local TerranWeaponFile = import('/lua/terranweapons.lua') 
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit 
local EffectTemplate = import('/lua/EffectTemplates.lua') 
local WeaponFile = import('/lua/terranweapons.lua') 
local TSAMLauncher = WeaponFile.TSAMLauncher 
local TDFIonizedPlasmaCannon = TerranWeaponFile.TDFIonizedPlasmaCannon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local BalrogMagmaCannonWeapon = import('/mods/MCP/lua/MCPweapons.lua').BalrogMagmaCannonWeapon 
local TIFCruiseMissileLauncher = WeaponFile.TIFCruiseMissileLauncher 
local TDFHeavyPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFHeavyPlasmaGatlingCannonWeapon 

MEL1401 = Class(TWalkingLandUnit) { 

    Weapons = { 
        MagmaCannon = Class(BalrogMagmaCannonWeapon) {},    
        ChainGun_L = Class(TDFHeavyPlasmaCannonWeapon) { 
            PlayFxWeaponUnpackSequence = function(self) 
                if not self.SpinManip_L then 
                    self.SpinManip_L = CreateRotator(self.unit, 'LeftShoulder_GunBarrel_A', 'z', nil, -100, -100, 100) 
                    self.unit.Trash:Add(self.SpinManip_L) 
                end 
                if self.SpinManip_L then 
                    self.SpinManip_L:SetTargetSpeed(-600) 
                end 
                TDFHeavyPlasmaCannonWeapon.PlayFxWeaponUnpackSequence(self) 
            end, 
            PlayFxWeaponPackSequence = function(self) 
                if self.SpinManip_L then 
                    self.SpinManip_L:SetTargetSpeed(0) 
                end 
                TDFHeavyPlasmaCannonWeapon.PlayFxWeaponPackSequence(self) 
            end,        
        }, 
        ChainGun_R = Class(TDFHeavyPlasmaCannonWeapon) { 
            PlayFxWeaponUnpackSequence = function(self) 
                if not self.SpinManip_R then 
                    self.SpinManip_R = CreateRotator(self.unit, 'RightShoulder_GunBarrel_A', 'z', nil, 100, 100, 100) 
                    self.unit.Trash:Add(self.SpinManip_R) 
                end 
                if self.SpinManip_R then 
                    self.SpinManip_R:SetTargetSpeed(600) 
                end 
                TDFHeavyPlasmaCannonWeapon.PlayFxWeaponUnpackSequence(self) 
            end, 
            PlayFxWeaponPackSequence = function(self) 
                if self.SpinManip_R then 
                    self.SpinManip_R:SetTargetSpeed(0) 
                end 
                TDFHeavyPlasmaCannonWeapon.PlayFxWeaponPackSequence(self) 
            end,          
        },          
        PlasmaCannon_L = Class(TDFIonizedPlasmaCannon) {}, 
        PlasmaCannon_R = Class(TDFIonizedPlasmaCannon) {},        
        MissileTube = Class(TSAMLauncher) { 
            FxMuzzleFlash = EffectTemplate.TAAMissileLaunchNoBackSmoke, 
        }, 
        CruiseMissile_L = Class(TIFCruiseMissileLauncher) { 
            CurrentRack_L = 1, 
            CreateProjectileAtMuzzle = function(self, muzzle) 
                muzzle = self:GetBlueprint().RackBones[self.CurrentRack_L].MuzzleBones[1] 
                if self.CurrentRack_L >= 2 then 
                    self.CurrentRack_L = 1 
                else 
                    self.CurrentRack_L = self.CurrentRack_L + 1 
                end 
                TIFCruiseMissileLauncher.CreateProjectileAtMuzzle(self, muzzle) 
            end, 
        }, 
        CruiseMissile_R = Class(TIFCruiseMissileLauncher) { 
            CurrentRack_R = 1, 
            CreateProjectileAtMuzzle = function(self, muzzle) 
                muzzle = self:GetBlueprint().RackBones[self.CurrentRack_R].MuzzleBones[1] 
                if self.CurrentRack_R >= 2 then 
                    self.CurrentRack_R = 1 
                else 
                    self.CurrentRack_R = self.CurrentRack_R + 1 
                end 
                TIFCruiseMissileLauncher.CreateProjectileAtMuzzle(self, muzzle) 
            end, 
        },                
        -- DeathWeapon = Class(TIFCommanderDeathWeapon) {}, 
        DeathWeapon = Class(SCUDeathWeapon) {},
    },                
} 
TypeClass = MEL1401