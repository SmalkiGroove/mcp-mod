local AHoverLandUnit = import('/lua/aeonunits.lua').AHoverLandUnit
local WeaponsFile = import ('/mods/MCP/lua/MCPweapons.lua')
local ADFTractorClaw02 = WeaponsFile.ADFTractorClaw02
local FxAmbient = import('/lua/effecttemplates.lua').AT2PowerAmbient


MAL1302 = Class( AHoverLandUnit ) {
    Weapons = {
		ArmTractor01 = Class( ADFTractorClaw02 ) {},
    },
	
    OnStopBeingBuilt = function(self,builder,layer)
        AHoverLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object07', 'z', nil, 180, 0, 180))
		self.Trash:Add(CreateRotator(self, 'Object01', 'y', nil, 360, 0, 180))
		self.Trash:Add(CreateRotator(self, 'Object02', 'x', nil, 360, 0, 180))
    	
		for k, v in FxAmbient do
			self.Trash:Add(CreateAttachedEmitter( self, 'Object02', self:GetArmy(), v ))
		end
	
	end,	
	
}

TypeClass = MAL1302
