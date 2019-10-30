local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon

MCPU1LDT = Class(TLandUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
			SetOnTransport = function(self, transportstate)    --AJOUT par Manimal au cas o�
				self.unit:SetScriptBit('RULEUTC_WeaponToggle', false)    --AJOUT par Manimal au cas o�
			end,    --AJOUT par Manimal au cas o�
		},
		ArmCannonTurret = Class(TDFMachineGunWeapon) {},
	},
	
	
    OnStopBeingBuilt = function(self,builder,layer)
	
		TLandUnit.OnStopBeingBuilt(self,builder,layer)
				
		self:SetWeaponEnabledByLabel('MainGun', false)
		
		IssueClearCommands({self})
		self:AddCommandCap('RULEUCC_Move')
		
		self:SetSpeedMult(1.0)
		self:SetTurnMult(1.0)
	end,
	
	
    OnCreate = function(self)
        local bp = self:GetBlueprint()
		
        TLandUnit.OnCreate(self)
		
        if not self.AnimationManipulator then
            self.AnimationManipulator = CreateAnimator(self)
            self.Trash:Add(self.AnimationManipulator)
        end
        self.AnimationManipulator:PlayAnim(bp.Display.AnimationActivate, false):SetRate(0)
		
        self:SetWeaponEnabledByLabel('MainGun', false)
		
		IssueClearCommands({self})
		self:AddCommandCap('RULEUCC_Move')
		
		self:SetSpeedMult(1.0)
		self:SetTurnMult(1.0)
    end,
	
        
    OnScriptBitSet = function(self, bit)
        TLandUnit.OnScriptBitSet(self, bit)
        if bit == 1 then
    	    if self.AnimationManipulator then
			
                self:SetUnSelectable(true)
				
				IssueClearCommands({self})
				self:RemoveCommandCap('RULEUCC_Move')
		
				self:SetSpeedMult(0)
				self:SetTurnMult(0)
			
                self.AnimationManipulator:SetRate(1.5)   
                self:ForkThread(function()
                    WaitSeconds(self.AnimationManipulator:GetAnimationDuration()*self.AnimationManipulator:GetRate())              
                    self:SetUnSelectable(false)
                end)
				
			
				self:SetWeaponEnabledByLabel('MainGun', true)
				

            end 		
    	end
    end,
    
    OnScriptBitClear = function(self, bit)
        TLandUnit.OnScriptBitClear(self, bit)
        if bit == 1 then 
    	    if self.AnimationManipulator then
			
                self:SetUnSelectable(true)
				
                IssueClearCommands({self})
                self:AddCommandCap('RULEUCC_Move')
				
		    	self:SetSpeedMult(1.0)
                self:SetTurnMult(1.0) 		
                self.AnimationManipulator:SetRate(-1.5)
                self:ForkThread(function()
                    WaitSeconds(self.AnimationManipulator:GetAnimationDuration()*self.AnimationManipulator:GetRate())
                    self:SetUnSelectable(false)
                end)
				
				self:SetWeaponEnabledByLabel('MainGun', false)
            end  
    	end
    end,
	
	
}

TypeClass = MCPU1LDT
