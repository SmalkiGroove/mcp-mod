local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile = import('/lua/cybranweapons.lua')
local WeaponsFile2 = import('/lua/terranweapons.lua')
local CCannonMolecularWeapon = WeaponsFile.CCannonMolecularWeapon
local CDFHeavyMicrowaveLaserGeneratorCom = WeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom
local TDFGaussCannonWeapon = WeaponsFile2.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPC1LXSB = Class(CWalkingLandUnit) {

    Weapons = {
        HeavyBolter = Class(CCannonMolecularWeapon) {
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
            FxMuzzleFlashScale = 3.55,
	},
        HeavyBolter2 = Class(CCannonMolecularWeapon) {
            FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash01,
            FxMuzzleFlashScale = 3.55,
	},
        rocket = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.45,
	},
        MainGun = Class(CDFHeavyMicrowaveLaserGeneratorCom) {
	},
    },
OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)  
    end,

OnKilled = function(self, instigator, damagetype, overkillRatio)
        CWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['CybranT2BeetleHit01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRMT1BEETLE', army, v):ScaleEmitter(1.25))
	end
end,
}

TypeClass = MCPC1LXSB