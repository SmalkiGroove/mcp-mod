--------------------------------------------------------------------------------
--  Summary:  Cybran Omni Disrupter
--   Author:  Sean 'Balthazar' Wheeldon
--------------------------------------------------------------------------------
local CRadarJammerUnit = import('/lua/cybranunits.lua').CRadarJammerUnit
local BareBonesWeapon = import('/lua/sim/defaultweapons.lua').BareBonesWeapon
local Utilities = import('/lua/utilities.lua')
local Buff = import('/lua/sim/Buff.lua')
local AIUtils = import('/lua/ai/aiutilities.lua')

MRB5402 = Class(CRadarJammerUnit) {
    Weapons = {
        PulseWeapon = Class(BareBonesWeapon) {
            OnFire = function(self)
                local aiBrain = self.unit:GetAIBrain()
                local Mypos = self.unit:GetPosition()
                local Range = self:GetBlueprint().MaxRadius
                local LocalUnits = {}
                for i, unit in AIUtils.GetOwnUnitsAroundPoint(aiBrain, categories.ALLUNITS, Mypos, Range) do
                    table.insert(LocalUnits, unit)
                end
                local army = self.unit:GetArmy()
                self:PlaySound(self:GetBlueprint().Audio.Fire)
                if self.ArmWaitThread then
                    KillThread(self.ArmWaitThread)
                end
                for k, v in self.unit.Rotator do
                    v:SetGoal(-50)
                    v:SetSpeed(1900)
                end
                self.ArmWaitThread = ForkThread(
                    function()
                        WaitTicks(1)
                        for k, v in self.unit.Rotator do
                            v:SetGoal(0)
                            v:SetSpeed(25)
                        end
                    end
                )
                CreateAttachedEmitter(self.unit, 0, army, '/effects/emitters/flash_01_emit.bp'):ScaleEmitter( 20 ):OffsetEmitter( 0, 4, 0 )
                local epathR = '/effects/emitters/destruction_explosion_concussion_ring_03_emit.bp'
                CreateAttachedEmitter(self.unit, 'XRC2201', army, epathR):OffsetEmitter( 0, 4, 0 )
                CreateAttachedEmitter(self.unit, 'XRC2201', army, epathR):ScaleEmitter( 3 ):OffsetEmitter( 0, 4, 0 )
                CreateAttachedEmitter(self.unit, 'XRC2201', army, epathR):ScaleEmitter( 6 ):OffsetEmitter( 0, 4, 0 )
                local epathQ = '/effects/emitters/cybran_qai_shutdown_ambient_'
                CreateAttachedEmitter(self.unit, 0, army, epathQ .. '01_emit.bp')
                CreateAttachedEmitter(self.unit, 0, army, epathQ .. '02_emit.bp')
                CreateAttachedEmitter(self.unit, 0, army, epathQ .. '03_emit.bp')
                CreateAttachedEmitter(self.unit, 0, army, epathQ .. '04_emit.bp')
                if not Buffs['MagnetronMoveMult'] then
                    BuffBlueprint {
                        Name = 'MagnetronMoveMult',
                        DisplayName = 'Speed Boost',
                        BuffType = 'MoveMult',
                        Duration = 30,
                        Stacks = 'REPLACE',
                        Affects = {
                            MoveMult = {
                                Add = 0,
                                Mult = 3,
                            },
                        },
                    }
                end
                for k, v in LocalUnits do
                    if EntityCategoryContains(categories.CYBRAN * categories.MOBILE * categories.LAND * categories.BUILTBYTIER3FACTORY, v) then
                        Buff.ApplyBuff(v, 'MagnetronMoveMult')
                    end
                end
            end,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        CRadarJammerUnit.OnStopBeingBuilt(self,builder,layer)
        if not self.Rotator then
            self.Rotator = {}
            self.Rotator.B01 = CreateRotator(self, ' B01', 'x')
            self.Rotator.B02 = CreateRotator(self, ' B02', 'x')
            self.Rotator.B03 = CreateRotator(self, ' B03', 'x')
        end
        if self.IntelEffects and not self.IntelFxOn then
            self.IntelEffectsBag = {}
            self.CreateTerrainTypeEffects( self, self.IntelEffects, 'FXIdle',  self:GetCurrentLayer(), nil, self.IntelEffectsBag )
            self.IntelFxOn = true
        end
        self.Intel = true
        self:ForkThread(self.FirePulse, self)
    end,

    OnIntelEnabled = function(self)
        self.Intel = true
        --self:ForkThread(self.FirePulse, self)
        CRadarJammerUnit.OnIntelEnabled(self)
    end,

    OnIntelDisabled = function(self)
        self.Intel = false
        CRadarJammerUnit.OnIntelDisabled(self)
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        CRadarJammerUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    FirePulse = function(self)
        while true do
            if self.Intel then
                WaitSeconds(5)
                self:GetWeaponByLabel('PulseWeapon'):FireWeapon()
                WaitSeconds(50)
            else
                WaitSeconds(1)
            end
        end
    end,

    IntelEffects = {
        {
            Bones = {
            	' B01',
            	' B02',
            	' B03',
            },
            Offset = {
              	0,
              	2,
              	0,
            },
            Type = 'Jammer01',
        },
    },
}
TypeClass = MRB5402
