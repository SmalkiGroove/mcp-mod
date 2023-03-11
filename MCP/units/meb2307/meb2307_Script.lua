local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local WeaponsFile = import('/lua/terranweapons.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local TSAMLauncher = WeaponsFile.TSAMLauncher
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MEB2307 = Class(TStructureUnit) {
    Weapons = {
        Gauss01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
			FxMuzzleFlashScale = 3.75, 
        },
        DeathWeapon = Class(SCUDeathWeapon) {
        },
        MissileRack01 = Class(TSAMLauncher) {
	    },
        missile01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
			FxMuzzleFlashScale = 0.0,
        },  
    },

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['UEFmayhemRocketHit2A'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Turret', army, v):ScaleEmitter(2.25))
	end
end,
}

TypeClass = MEB2307