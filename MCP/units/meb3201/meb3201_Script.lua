local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local EffectTemplate = import('/lua/EffectTemplates.lua')
local ModEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')


meb3201 = Class(TStructureUnit) {


OnStopBeingBuilt = function(self,builder,layer)
        TStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object01', 'y', nil, -30, 0, 0))
     
        self:CreatTheEffects()    
    end,

CreatTheEffects = function(self)
	local army =  self:GetArmy()
	for k, v in EffectTemplate['CSoothSayerAmbient'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'perieffect', army, v):ScaleEmitter(0.3))
	end
	for k, v in ModEffectTemplate['BRMT3EXBMPOWEREFFECT'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Dummy01', army, v):ScaleEmitter(1.50))
	end
	for k, v in ModEffectTemplate['BRMT3EXBMPOWEREFFECT'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Dummy02', army, v):ScaleEmitter(1.50))
	end
end,

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in ModEffectTemplate['UEFDeath01'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BRNBT1PERI', army, v):ScaleEmitter(1.4))
	end

end,
}

TypeClass = meb3201