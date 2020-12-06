local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MEB2202 = Class(TStructureUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
				IdleState = State (TDFGaussCannonWeapon.IdleState) {
                Main = function(self)
                    TDFGaussCannonWeapon.IdleState.Main(self)
                end,
                
                OnGotTarget = function(self)
						if not self.SpinManip01 then 
							self.SpinManip01 = CreateRotator(self.unit, 'Spinner', 'z', nil, 750, 750, 750)
							self.unit.Trash:Add(self.SpinManip01)
							self.SpinManip01:SetTargetSpeed(550)
						end	
						TDFGaussCannonWeapon.OnGotTarget(self)
                end,
					OnFire = function(self)
						TDFGaussCannonWeapon.IdleState.OnFire(self)
						if self.SpinManip01 then
						self.SpinManip01:SetTargetSpeed(550)
						end	
                end,                
            },
                  
            OnLostTarget = function(self)
                if self.SpinManip01 then
					self.SpinManip01:SetTargetSpeed(0)
				end	

                TDFGaussCannonWeapon.OnLostTarget(self)
            end,  
        },
    },

OnKilled = function(self, instigator, damagetype, overkillRatio)
        TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()  
    end,

CreatTheEffectsDeath = function(self)
	local army =  self:GetArmy()
	for k, v in MCPEffectTemplate['UEFDeath02'] do
		self.Trash:Add(CreateAttachedEmitter(self, 'Turret', army, v):ScaleEmitter(1.05))
	end
end,
}

TypeClass = MEB2202