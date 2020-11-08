local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SDFThauCannon = import('/lua/seraphimweapons.lua').SDFThauCannon
local WeaponsFileAutoAttack = import('/lua/terranweapons.lua')
local AutoAttackWeapon = WeaponsFileAutoAttack.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MCPS1LBB = Class(SWalkingLandUnit) {

    Weapons = {
        TauCannon01 = Class(SDFThauCannon){
            FxMuzzleFlashScale = 0.5,
        },
        autoattack = Class(AutoAttackWeapon) {
            FxMuzzleFlashScale = 0.0,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.SetAIAutoattackWeapon(self)
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        SWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
        self.SetAIAutoattackWeapon(self)
    end,

    SetAIAutoattackWeapon = function(self)
        if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
            self:SetWeaponEnabledByLabel('autoattack', false)
        else
            self:SetWeaponEnabledByLabel('autoattack', true)
        end
    end,

    OnKilled = function(self, instigator, damagetype, overkillRatio)
        SWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()
    end,

    CreatTheEffectsDeath = function(self)
        local army =  self:GetArmy()
        for k, v in EffectTemplate['SDFExperimentalPhasonProjHit01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'Turreta', army, v):ScaleEmitter(0.65))
        end
    end,

}

TypeClass = MCPS1LBB