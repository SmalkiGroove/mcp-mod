local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local WeaponsFile = import('/lua/terranweapons.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MEB2403 = Class(TStructureUnit) {
    Weapons = {
        Gauss01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
			            FxMuzzleFlashScale = 1.15, 
        },     
        Gauss02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
			            FxMuzzleFlashScale = 1.15, 
        }, 
        Gauss03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
			            FxMuzzleFlashScale = 1.15, 
        }, 
        Gauss04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TShipGaussCannonFlash,
			            FxMuzzleFlashScale = 1.15, 
        }, 
        DeathWeapon = Class(SCUDeathWeapon) {
        },
    },

OnStopBeingBuilt = function(self,builder,layer)
        TStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object05', 'y', nil, -230, 0, 0))
     
        self:CreatTheEffects()    
    end,

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffects = function(self)
	local army =  self:GetArmy()
	for k, v in EffectTemplate['CSoothSayerAmbient'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'perimetereff', army, v):OffsetEmitter(0,0.25,-0.5):ScaleEmitter(0.25))
	end
end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['UEFmayhemRocketHit2A'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Object42', army, v):ScaleEmitter(2.25))
	end
	for k, v in MCPEffectTemplate['UEFDeath02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Object17', army, v):ScaleEmitter(2.75))
	end
end,
}

TypeClass = MEB2403