local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local Weapon = import('/lua/sim/Weapon.lua').Weapon
local cWeapons = import('/lua/cybranweapons.lua')
local CybranWeaponsFile2 = import('/mods/MCP/lua/MCPWeapons.lua')
local CDFLaserHeavyWeapon = cWeapons.CDFLaserHeavyWeapon
local BassieCannonWeapon01 = CybranWeaponsFile2.BassieCannonWeapon01
local BasiliskAAMissile01 = CybranWeaponsFile2.BasiliskAAMissile01

local CDFLaserDisintegratorWeapon = cWeapons.CDFLaserDisintegratorWeapon01
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local CIFMissileLoaWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaWeapon
local CDFElectronBolterWeapon = cWeapons.CDFElectronBolterWeapon

local BasiliskNukeEffect04 = '/mods/MCP/projectiles/MGQAIPlasmaArty01/MGQAIPlasmaArty01_proj.bp' 
local BasiliskNukeEffect05 = '/mods/MCP/effects/Entities/BasiliskNukeEffect05/BasiliskNukeEffect05_proj.bp'

local RandomFloat = import('/lua/utilities.lua').GetRandomFloat
local Util = import('/lua/utilities.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MRL1402 = Class(CWalkingLandUnit) {
    PlayEndAnimDestructionEffects = false,

    Weapons = {
        DeathWeapon = Class(SCUDeathWeapon) {},
        TorsoWeapon = Class(CDFLaserHeavyWeapon){},
        HeadWeapon = Class(CDFLaserHeavyWeapon) {
            OnWeaponFired = function(self, muzzle)
                if not self.JawTopRotator then 
                    self.JawBottomRotator = CreateRotator(self.unit, 'Jaw', 'x')
                    self.unit.Trash:Add(self.JawBottomRotator)
                end
                
                self.JawBottomRotator:SetGoal(30):SetSpeed(100)
                CDFLaserHeavyWeapon.OnWeaponFired(self, muzzle)
                
                self:ForkThread(function()
                    WaitSeconds(3)
                    self.JawBottomRotator:SetGoal(0):SetSpeed(50)
                end)
            end,
        },
        SideCannons = Class(CDFLaserHeavyWeapon) {},
        MainGun = Class(BassieCannonWeapon01) {},
        MissileRack = Class(CIFMissileLoaWeapon) {
            OnWeaponFired = function(self)
                self.unit:PlayUnitSound('MissileFire')
                self.unit.weaponCounter = self.unit.weaponCounter + 1
                local wepCount = self.unit.weaponCounter
                if wepCount == 5 then
                    ForkThread(self.ReloadThread, self)
                    self.unit.weaponCounter = 0            
                end
                CIFMissileLoaWeapon.OnWeaponFired(self)
            end,
            
            ReloadThread = function(self)
                if self.unit.mobileWeapons == 0 then
                elseif self.unit.mobileWeapons == 1 then
                        self.unit:SetWeaponEnabledByLabel('MissileRack', false)
                        WaitSeconds(12.5)
                    if not self.unit:IsDead() then
                        if self.unit.mobileWeapons == 0 then
                        elseif self.unit.mobileWeapons == 1 then
                            self.unit:SetWeaponEnabledByLabel('MissileRack', true)
                        end
                    end
                end    
            end,
        },
        RightBolter = Class(CDFElectronBolterWeapon) {},
        LeftBolter = Class(CDFElectronBolterWeapon) {},
        LasMissile01 = Class(BasiliskAAMissile01) {},
        ShoulderGuns = Class(CDFLaserDisintegratorWeapon) {},
        MissileRack2 = Class(CIFMissileLoaWeapon) {
        
            OnWeaponFired = function(self)
                self.unit:PlayUnitSound('MissileFire')
                self.unit.weaponCounter = self.unit.weaponCounter + 1
                local wepCount = self.unit.weaponCounter
                if wepCount == 5 then
                    ForkThread(self.ReloadThread, self)
                    self.unit.weaponCounter = 0            
                end
                CIFMissileLoaWeapon.OnWeaponFired(self)
            end,
            
            ReloadThread = function(self)
                if self.unit.mobileWeapons == 1 then
                elseif self.unit.mobileWeapons == 0 then
                        self.unit:SetWeaponEnabledByLabel('MissileRack2', false)
                        WaitSeconds(10)
                    if not self.unit:IsDead() then
                        if self.unit.mobileWeapons == 1 then
                        elseif self.unit.mobileWeapons == 0 then
                            self.unit:SetWeaponEnabledByLabel('MissileRack2', true)
                        end
                    end
                end    
            end,
        },
    },
    
    OnCreate = function(self,builder,layer)
        CWalkingLandUnit.OnCreate(self,builder,layer)
        if self:GetAIBrain().BrainType ~= 'Human' then
            local headwep = self:GetWeaponByLabel('HeadWeapon')
            headwep:ChangeMaxRadius(500)
        end
        self:SetWeaponEnabledByLabel('ShoulderGuns', false)
        local shoulderwep = self:GetWeaponByLabel('ShoulderGuns')
        shoulderwep:ChangeMaxRadius(0)
        self:SetWeaponEnabledByLabel('MissileRack2', false)
        local missilewep = self:GetWeaponByLabel('MissileRack2')
        missilewep:ChangeMaxRadius(0)
    end,
    
    OnStopBeingBuilt = function(self,builder,layer)
        self.weaponCounter = 0
        self.mobileWeapons = 1
        self.Rotator1 = CreateRotator(self, 'Jaw', 'x')
        self.Rotator2 = CreateRotator(self, 'Head', 'x')
        self.Rotator3 = CreateRotator(self, 'Head', 'y')
        self.Trash:Add(self.Rotator1)
        if self.Rotator1 then
            self.Rotator1:SetGoal(30):SetSpeed(100)
        end
        
        self:ForkThread(function()
            WaitSeconds(3)
                    
            self.Rotator1:SetGoal(0):SetSpeed(50)
        end)
        
        if self.Rotator2 then
            self.Rotator2:SetGoal(-40):SetSpeed(100)
        end
        
        self:ForkThread(function()
            WaitSeconds(2)
                    
            self.Rotator2:SetGoal(0):SetSpeed(50)
        end)
        
        if self.Rotator3 then
            self.Rotator3:SetGoal(-30):SetSpeed(100)
        end
        
        self:ForkThread(function()
            WaitSeconds(1)
                    
            self.Rotator3:SetGoal(30):SetSpeed(100)
            WaitSeconds(1)
            self.Rotator3:SetGoal(0):SetSpeed(50)
        end)    

        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
    end,

    OnScriptBitSet = function(self, bit)
        CWalkingLandUnit.OnScriptBitSet(self, bit)
        if bit == 1 then 
            if not self.AnimationManipulator then
                self.AnimationManipulator = CreateAnimator(self)
                self.Trash:Add(self.AnimationManipulator)
                self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationDeploy)
            end
            self.AnimationManipulator:SetRate(1.5)
            
            self:ForkThread(function()
                self.mobileWeapons = 0
                self:SetSpeedMult(0.5)
                
                self:RemoveToggleCap('RULEUTC_WeaponToggle')
                self:SetWeaponEnabledByLabel('SideCannons', false)
                local sidewep = self:GetWeaponByLabel('SideCannons')
                sidewep:ChangeMaxRadius(0)
        
                self:SetWeaponEnabledByLabel('MainGun', false)
                local MainWep = self:GetWeaponByLabel('MainGun')
                MainWep:ChangeMaxRadius(0)
        
                self:SetWeaponEnabledByLabel('MissileRack', false)
                local shortMissWep = self:GetWeaponByLabel('MissileRack')
                shortMissWep:ChangeMaxRadius(0)
                shortMissWep:ChangeMinRadius(20)
                local dummywep = self:GetWeaponByLabel('TorsoWeapon')
                local maxradius, minradius
                local wep = self:GetWeaponByLabel('ShoulderGuns')
                maxradius = wep:GetBlueprint().MaxRadius
                minradius = wep:GetBlueprint().MinRadius or 0
                dummywep:ChangeMaxRadius(maxradius)
                dummywep:ChangeMinRadius(minradius)
                WaitSeconds(self.AnimationManipulator:GetAnimationDuration())
                self:SetWeaponEnabledByLabel('ShoulderGuns', true)
                local shoulderwep = self:GetWeaponByLabel('ShoulderGuns')
                shoulderwep:ChangeMaxRadius(180)
                shoulderwep:ChangeMinRadius(20)
        
                self:SetWeaponEnabledByLabel('MissileRack2', true)
                local missilewep = self:GetWeaponByLabel('MissileRack2')
                missilewep:ChangeMaxRadius(180)
                missilewep:ChangeMinRadius(20)
                
                self:AddToggleCap('RULEUTC_WeaponToggle')
            end)
        end
    end,
    
    
    OnScriptBitClear = function(self, bit)
        CWalkingLandUnit.OnScriptBitSet(self, bit)
        if bit == 1 then 
            if self.AnimationManipulator then
                self.AnimationManipulator:SetRate(-1.5)
            end
            self:ForkThread(function()
                self.mobileWeapons = 1
                self:SetSpeedMult(1.0)
                
                self:RemoveToggleCap('RULEUTC_WeaponToggle')
                self:SetWeaponEnabledByLabel('ShoulderGuns', false)
                local shoulderwep = self:GetWeaponByLabel('ShoulderGuns')
                shoulderwep:ChangeMaxRadius(0)
                shoulderwep:ChangeMinRadius(0)
                self:SetWeaponEnabledByLabel('MissileRack2', false)
                local missilewep = self:GetWeaponByLabel('MissileRack2')
                missilewep:ChangeMaxRadius(0)
                missilewep:ChangeMinRadius(0)
                local dummywep = self:GetWeaponByLabel('TorsoWeapon')
                local maxradius, minradius
                local wep = self:GetWeaponByLabel('MainGun')
                maxradius = wep:GetBlueprint().MaxRadius
                minradius = wep:GetBlueprint().MinRadius or 0
                dummywep:ChangeMaxRadius(maxradius)
                dummywep:ChangeMinRadius(minradius)
                WaitSeconds(self.AnimationManipulator:GetAnimationDuration())
                self:SetWeaponEnabledByLabel('SideCannons', true)
                local sidewep = self:GetWeaponByLabel('SideCannons')
                sidewep:ChangeMaxRadius(60)
                sidewep:ChangeMinRadius(0)
        
                self:SetWeaponEnabledByLabel('MainGun', true)
                local MainWep = self:GetWeaponByLabel('MainGun')
                MainWep:ChangeMaxRadius(60)
                MainWep:ChangeMinRadius(0)
        
                self:SetWeaponEnabledByLabel('MissileRack', true)
                local shortMissWep = self:GetWeaponByLabel('MissileRack')
                shortMissWep:ChangeMaxRadius(80)
                shortMissWep:ChangeMinRadius(10)
                
                self:AddToggleCap('RULEUTC_WeaponToggle')
            end)
        end
    end,
    
    
}

TypeClass = MRL1402
