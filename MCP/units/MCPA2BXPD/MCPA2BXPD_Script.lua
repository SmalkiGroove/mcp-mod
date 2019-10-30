local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local AWeapons = import('/lua/aeonweapons.lua')
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local AAAZealotMissileWeapon = AWeapons.AAAZealotMissileWeapon


MCPA2BXPD = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 2.2,
            FxMuzzleFlash = EffectTemplate.ASerpFlash01,
	},      
        DeathWeapon = Class(SCUDeathWeapon) {
        },
        AntiAirMissiles = Class(AAAZealotMissileWeapon) {
	},
    },

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['AeonUnitDeathRing02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'BROT2EPD', army, v):ScaleEmitter(1.50))
	end
end,
}

TypeClass = MCPA2BXPD