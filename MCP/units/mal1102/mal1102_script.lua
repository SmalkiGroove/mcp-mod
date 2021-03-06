local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local SWeapons = import ('/lua/seraphimweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local SDFChronotronCannonWeapon = SWeapons.SDFChronotronCannonWeapon

MAL1102 = Class(TLandUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.7,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},   
        smgun1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        smgun2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        smgun3 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        smgun4 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        smgun5 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        smgun6 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.0,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},  
        MainGun2 = Class(SDFChronotronCannonWeapon) {
            FxMuzzleFlashScale = 3.55,
            FxMuzzleFlash = EffectTemplate.ASDisruptorCannonMuzzle01,
	},
    },
OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)  
    end,

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['AeonUnitDeathRing02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'engine01', army, v):ScaleEmitter(1.10))
	end
	for k, v in MCPEffectTemplate['UEFHEAVYROCKET02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'engine01', army, v):ScaleEmitter(1.0))
	end
end,
}

TypeClass = MAL1102