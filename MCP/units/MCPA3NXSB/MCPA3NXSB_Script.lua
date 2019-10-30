local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local WeaponsFile = import('/lua/aeonweapons.lua')
local ADFCannonOblivionWeapon = WeaponsFile.ADFCannonOblivionWeapon
local AAASonicPulseBatteryWeapon = WeaponsFile.AAASonicPulseBatteryWeapon
local ADFCannonOblivionWeapon = WeaponsFile.ADFCannonOblivionWeapon02
local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')

MCPA3NXSB = Class(ASeaUnit) {
    FxDamageScale = 2,
    DestructionTicks = 400,

    Weapons = {
        BackTurret = Class(ADFCannonOblivionWeapon) {},
        FrontTurret = Class(ADFCannonOblivionWeapon) {},
        MidTurret01 = Class(ADFCannonOblivionWeapon) {},
        MidTurret02 = Class(ADFCannonOblivionWeapon) {},
        MidTurret03 = Class(ADFCannonOblivionWeapon) {},
        MidTurret04 = Class(ADFCannonOblivionWeapon) {},

        AAGun01 = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        AAGun02 = Class(AAASonicPulseBatteryWeapon) {
            FxMuzzleScale = 2.25,
        },
        MainGun = Class(ADFCannonOblivionWeapon)        
	{
            PlayFxWeaponPackSequence = function(self)
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(0)
                end
                ADFCannonOblivionWeapon.PlayFxWeaponPackSequence(self)
            end,
        
            PlayFxWeaponUnpackSequence = function(self)
                if not self.SpinManip then 
                    self.SpinManip = CreateRotator(self.unit, 'SuperTurretSpinner', 'z', nil, 270, 180, 60)
                    self.unit.Trash:Add(self.SpinManip)
                end
                
                if self.SpinManip then
                    self.SpinManip:SetTargetSpeed(-800)
                end
                ADFCannonOblivionWeapon.PlayFxWeaponUnpackSequence(self)
            end,            
            
        },

    },
    
    OnCreate = function(self)
        ASeaUnit.OnCreate(self)
        for i = 1, 3 do
            self.Trash:Add(CreateAnimator(self):PlayAnim(self:GetBlueprint().Weapon[i].AnimationOpen))
        end
    end,
}

TypeClass = MCPA3NXSB