local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local EffectTemplate = import('/lua/EffectTemplates.lua')
local ModEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

msb3201 = Class(TStructureUnit) {


	OnStopBeingBuilt = function(self,builder,layer)
		TStructureUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateRotator(self, 'B01', 'z', nil, -700, 0, 0))
		self:CreatTheEffects()    
	end,

	CreatTheEffects = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['CSoothSayerAmbient'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'B01', army, v):ScaleEmitter(0.35))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'B01', army, v):ScaleEmitter(0.37))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Dummy01', army, v):ScaleEmitter(0.125))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Dummy02', army, v):ScaleEmitter(0.125))
		end
		for k, v in EffectTemplate['OthuyAmbientEmanation'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'Dummy03', army, v):ScaleEmitter(0.125))
		end
	end,

	OnKilled = function(self, instigator, damagetype, overkillRatio)
		TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
		self:CreatTheEffectsDeath()  
	end,

	CreatTheEffectsDeath = function(self)
		local army =  self:GetArmy()
		for k, v in EffectTemplate['SDFExperimentalPhasonProjHit01'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'B01', army, v):ScaleEmitter(1.7))
		end
		for k, v in ModEffectTemplate['SerT3SHBMDeath'] do
			self.Trash:Add(CreateAttachedEmitter(self, 'BRPBT1PERI', army, v):ScaleEmitter(1.1))
		end
	end,
}

TypeClass = msb3201