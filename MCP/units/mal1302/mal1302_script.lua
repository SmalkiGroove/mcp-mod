
local AWalkingLandUnit = import('/lua/aeonunits.lua').AWalkingLandUnit
local WeaponsFile = import('/lua/aeonweapons.lua')
local MCPWeaponsFile = import('/mods/MCP/lua/MCPWeapons.lua')
local EffectUtils = import('/lua/EffectUtilities.lua')
local Effects = import('/lua/effecttemplates.lua')
local TMAmizurabluelaserweapon = MCPWeaponsFile.TMAmizurabluelaserweapon
local AAAZealotMissileWeapon = WeaponsFile.AAAZealotMissileWeapon
local HatchMissileWeapon = WeaponsFile.AIFMissileTacticalSerpentine02Weapon

mal1302 = Class(AWalkingLandUnit) { 

   Weapons = {
        HatchMissile = Class(HatchMissileWeapon) {

            OnWeaponFired = function(self)
                HatchMissileWeapon.OnWeaponFired(self)
                ### Hides the missile bones after the unit has fired
                self.unit:HideBone('LargeSAM', false)
            end, 

            PlayFxRackSalvoReloadSequence = function(self)
                self.ExhaustEffects = EffectUtils.CreateBoneEffects( self.unit, 'LargeSAM', self.unit:GetArmy(), Effects.WeaponSteam01 )
                ### Unhides the missile bones so the player can see the missile reload
                self.unit:ShowBone('LargeSAM', false)
                HatchMissileWeapon.PlayFxRackSalvoChargeSequence(self)
            end,
        },
        Laserblue = Class(TMAmizurabluelaserweapon) {FxMuzzleFlashScale = 1.4,},
        MissileSideLeft = Class(AAAZealotMissileWeapon) {},
        MissileSideRight = Class(AAAZealotMissileWeapon) {},
   },
} 

TypeClass = mal1302