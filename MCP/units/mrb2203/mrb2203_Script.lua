local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MRB2203 = Class(TStructureUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 2.6,
            FxMuzzleFlash = { 
            	'/effects/emitters/proton_artillery_muzzle_01_emit.bp',
            	'/effects/emitters/proton_artillery_muzzle_03_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_smoke_01_emit.bp',                                
            }, 
	    FxGroundEffect = EffectTemplate.ConcussionRingLrg01,
	        FxVentEffect3 = EffectTemplate.CDisruptorGroundEffect,
	        FxVentEffect = EffectTemplate.CDisruptorVentEffect,
	        FxVentEffect2 = EffectTemplate.WeaponSteam01,
	        FxMuzzleEffect = EffectTemplate.CElectronBolterMuzzleFlash01,
	        FxCoolDownEffect = EffectTemplate.CDisruptorCoolDownEffect,     
	        PlayFxMuzzleSequence = function(self, muzzle)
		        local army = self.unit:GetArmy()
		        
	            for k, v in self.FxVentEffect3 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'BRMT2EPD', army, v):ScaleEmitter(1.35))
                end
	            for k, v in self.FxMuzzleEffect do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'Turret_Muzzle', army, v):ScaleEmitter(3.15))
                end
  	            for k, v in self.FxVentEffect do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'vent01', army, v):ScaleEmitter(1))
                end
  	            for k, v in self.FxVentEffect do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'vent02', army, v):ScaleEmitter(1))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'smoke01', army, v):ScaleEmitter(1))
                end
            end, 
	}, 
        DeathWeapon = Class(SCUDeathWeapon) {
        },
    },
OnStopBeingBuilt = function(self,builder,layer)
        TStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'radar', 'y', nil, 110, 0, 0))   
        self:CreatTheEffects()
    end,
CreatTheEffects = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['BRMT3EXBMPOWEREFFECT'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'effect01', army, v):ScaleEmitter(3.30))
	end
    end,
}


TypeClass = MRB2203