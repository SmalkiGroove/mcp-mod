local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile2 = import('/lua/terranweapons.lua')
local CWeapons = import('/lua/cybranweapons.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local CDFParticleCannonWeapon = CWeapons.CDFParticleCannonWeapon
local TDFGaussCannonWeapon = WeaponsFile2.TDFLandGaussCannonWeapon
local TDFRiotWeapon = WeaponsFile2.TDFRiotWeapon
local CDFProtonCannonWeapon = CWeapons.CDFProtonCannonWeapon
local CAAMissileNaniteWeapon = CWeapons.CAAMissileNaniteWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MRL1404 = Class(CWalkingLandUnit) {
    SwitchAnims = true,
    IsWaiting = false,
    Weapons = {
        DeathWeapon = Class(SCUDeathWeapon) {
	},
        robottalk = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0,
	},
        FrontCannon01 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 0.7,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        FrontCannon02 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 0.7,
            FxMuzzleFlash = EffectTemplate.CArtilleryFlash01,
	},
        Laserww01 = Class(CDFProtonCannonWeapon) {
            FxMuzzleFlashScale = 2.1,
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
	},
        laser1w = Class(CDFParticleCannonWeapon) {
	},
        laser2w = Class(CDFParticleCannonWeapon) {
	},
        Laserwa1 = Class(CDFProtonCannonWeapon) {
	},
        Laserwa2 = Class(CDFProtonCannonWeapon) {
	},
        Laserwa3 = Class(CDFProtonCannonWeapon) {
	},
        Laserwa4 = Class(CDFProtonCannonWeapon) {
	},
        mgweapon = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank,
			            FxMuzzleFlashScale = 0.75, 
        },
        rocket1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0,
	},
        rocket2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0,
	},
        aarockets = Class(CAAMissileNaniteWeapon) {
	},
        missilebig = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0,
	},
    },


OnStopBeingBuilt = function(self,builder,layer)

        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
      
      if self:GetAIBrain().BrainType == 'Human' and IsUnit(self) then
         self:SetWeaponEnabledByLabel('robottalk', false)
      else
         self:SetWeaponEnabledByLabel('robottalk', true)
        end
    end,

}

TypeClass = MRL1404