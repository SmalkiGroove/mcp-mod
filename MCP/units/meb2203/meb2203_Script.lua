local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon

MEB2203 = Class(TStructureUnit) {
    Weapons = {
        Gauss01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 1.5,
            FxMuzzleFlash = { 
            	'/effects/emitters/proton_artillery_muzzle_01_emit.bp',
            	'/effects/emitters/proton_artillery_muzzle_03_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_smoke_01_emit.bp',                                
            }, 
	    FxGroundEffect = EffectTemplate.ConcussionRingLrg01,
	        FxVentEffect3 = EffectTemplate.CDisruptorGroundEffect,
	        FxVentEffect = EffectTemplate.FireCloudMed01,
	        FxVentEffect4 = EffectTemplate.CDisruptorVentEffect,
	        FxVentEffect2 = EffectTemplate.WeaponSteam01,
	        FxMuzzleEffect = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
	        FxCoolDownEffect = EffectTemplate.CDisruptorCoolDownEffect,     
	        PlayFxMuzzleSequence = function(self, muzzle)
		        local army = self.unit:GetArmy()
		        
	            for k, v in self.FxGroundEffect do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'BRNT2EPD', army, v):ScaleEmitter(2.90))
                end
	            for k, v in self.FxVentEffect3 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'BRNT2EPD', army, v):ScaleEmitter(2.4))
                end
  	            for k, v in self.FxMuzzleEffect do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'Turret_Muzzle', army, v):ScaleEmitter(3.25))
                end
  	            for k, v in self.FxVentEffect4 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'vent01', army, v):ScaleEmitter(1.45))
                end
  	            for k, v in self.FxVentEffect4 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'vent02', army, v):ScaleEmitter(1.45))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'smoke01', army, v):ScaleEmitter(2.25))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'smoke02', army, v):ScaleEmitter(2.25))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'smoke03', army, v):ScaleEmitter(2.25))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'smoke04', army, v):ScaleEmitter(2.25))
                end
  	            for k, v in self.FxVentEffect2 do
                    self.unit.Trash:Add(CreateAttachedEmitter(self.unit, 'Turret_Muzzle', army, v):ScaleEmitter(2.25))
                end
            end, 
	},      
        DeathWeapon = Class(SCUDeathWeapon) {
        },
    },
}

TypeClass = MEB2203