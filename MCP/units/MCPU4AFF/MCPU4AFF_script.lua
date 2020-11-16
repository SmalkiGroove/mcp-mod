local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TAAFlakArtilleryCannon = WeaponsFile.TAAFlakArtilleryCannon
local RailGunWeapon02 = import('/mods/MCP/lua/MCPWeapons.lua').RailGunWeapon02
local CitadelHVMWeapon = import('/mods/MCP/lua/MCPWeapons.lua').CitadelHVMWeapon
local CitadelPlasmaGatlingCannonWeapon = import('/mods/MCP/lua/MCPWeapons.lua').CitadelPlasmaGatlingCannonWeapon
local EffectUtils = import('/lua/effectutilities.lua')
local Effects = import('/lua/effecttemplates.lua')

MCPU4AFF = Class(TAirUnit) {
    Weapons = {
        MainTurret01 = Class(RailGunWeapon02) {},
        MainTurret02 = Class(RailGunWeapon02) {},
        HVMTurret01 = Class(CitadelHVMWeapon) {},
        HVMTurret02 = Class(CitadelHVMWeapon) {},
        HVMTurret03 = Class(CitadelHVMWeapon) {},
        HVMTurret04 = Class(CitadelHVMWeapon) {},
        AAAFlak01 = Class(TAAFlakArtilleryCannon) {},
        AAAFlak02 = Class(TAAFlakArtilleryCannon) {},
        AAAFlak03 = Class(TAAFlakArtilleryCannon) {},
        AAAFlak04 = Class(TAAFlakArtilleryCannon) {},
        GattlerTurret01 = Class(CitadelPlasmaGatlingCannonWeapon) {
            PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                if self.SpinManip2 then
                    self.SpinManip2:SetTargetSpeed(0)
                end
                self.ExhaustEffects = EffectUtils.CreateBoneEffects(self.unit, 'Gat_Muzzle_2', self.unit:GetArmy(), Effects.WeaponSteam01)
                CitadelPlasmaGatlingCannonWeapon.PlayFxWeaponPackSequence(self)
            end,

            PlayFxWeaponUnpackSequence = function(self)
                if not self.SpinManip then
                    self.SpinManip = CreateRotator(self.unit, 'Gat_Rotator_2', 'z', nil, 270, 180, 60)
                    self.unit.Trash:Add(self.SpinManip)
                end

                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(500)
                end
                CitadelPlasmaGatlingCannonWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxRackSalvoReloadSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(200)
                end
                if self.SpinManip2 then
                    self.SpinManip2:SetTargetSpeed(-200)
                end
                self.ExhaustEffects = EffectUtils.CreateBoneEffects(self.unit, 'Gat_Muzzle_2', self.unit:GetArmy(), Effects.WeaponSteam01)
                CitadelPlasmaGatlingCannonWeapon.PlayFxRackSalvoReloadSequence(self)
            end,
        },

        GattlerTurret02 = Class(CitadelPlasmaGatlingCannonWeapon) {
            PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                if self.SpinManip2 then
                    self.SpinManip2:SetTargetSpeed(0)
                end
                self.ExhaustEffects = EffectUtils.CreateBoneEffects(self.unit, 'Gat_Muzzle_1', self.unit:GetArmy(), Effects.WeaponSteam01)
                CitadelPlasmaGatlingCannonWeapon.PlayFxWeaponPackSequence(self)
            end,

            PlayFxWeaponUnpackSequence = function(self)
                if not self.SpinManip then
                    self.SpinManip = CreateRotator(self.unit, 'Gat_Rotator_1', 'z', nil, 270, 180, 60)
                    self.unit.Trash:Add(self.SpinManip)
                end

                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(500)
                end
                CitadelPlasmaGatlingCannonWeapon.PlayFxWeaponUnpackSequence(self)
            end,

            PlayFxRackSalvoReloadSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(200)
                end
                if self.SpinManip2 then
                    self.SpinManip2:SetTargetSpeed(-200)
                end
                self.ExhaustEffects = EffectUtils.CreateBoneEffects(self.unit, 'Gat_Muzzle_1', self.unit:GetArmy(), Effects.WeaponSteam01)
                CitadelPlasmaGatlingCannonWeapon.PlayFxRackSalvoReloadSequence(self)
            end,
        },
    },

    DestroyNoFallRandomChance = 1.1,
    FxDamageScale = 2.5,

    OnStopBeingBuilt = function(self, builder, layer)
        self.AirPadTable = {}
        TAirUnit.OnStopBeingBuilt(self, builder, layer)
    end,
}

TypeClass = MCPU4AFF
