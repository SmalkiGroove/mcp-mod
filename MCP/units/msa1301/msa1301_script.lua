local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SAAShleoCannonWeapon = import('/lua/seraphimweapons.lua').SAAShleoCannonWeapon
local SDFUltraChromaticBeamGenerator = import('/mods/MCP/lua/MCPWeapons.lua').SDFUltraChromaticBeamGenerator
local SDFHeavyQuarnon01Cannon = import('/mods/MCP/lua/MCPWeapons.lua').SDFHeavyQuarnon01Cannon

MSA1301 = Class(SAirUnit) {
	DestroyNoFallRandomChance = 1.1,
	
    Weapons = {
        MainGun = Class(SDFUltraChromaticBeamGenerator) {},
        AAGun = Class(SAAShleoCannonWeapon) {},
		AntiVaisseaux = Class(SDFHeavyQuarnon01Cannon) {},
    },
	
    OnStopBeingBuilt = function(self,builder,layer)
	local army = self:GetArmy()
        SAirUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateAttachedEmitter(self, 'Effect01', army, '/effects/emitters/seraphim_gate_06_emit.bp'):OffsetEmitter( 0, 0, 0 ))
		self.Trash:Add(CreateAttachedEmitter(self, 'Effect01', army, '/effects/emitters/seraphim_gate_05_emit.bp'):OffsetEmitter( 0, 0, 0 ))
		self.Trash:Add(CreateAttachedEmitter(self, 'Effect01', army, '/effects/emitters/seraphim_gate_04_emit.bp'):OffsetEmitter( 0, 0, 0 ))
		self.Trash:Add(CreateAttachedEmitter(self, 'Effect01', army, '/effects/emitters/seraphim_gate_03_emit.bp'):OffsetEmitter( 0, -2, 0 ))
		self.Trash:Add(CreateAttachedEmitter(self, 'Effect01', army, '/effects/emitters/seraphim_gate_02_emit.bp'):OffsetEmitter( 0, -2, 0 ))
        self.Trash:Add(CreateRotator(self, 'Rotator01', 'z', nil, 50, 0, 50))
    end,		
	
}
TypeClass = MSA1301
