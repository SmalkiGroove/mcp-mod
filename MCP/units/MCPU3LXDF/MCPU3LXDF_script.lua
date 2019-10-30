local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFIonizedPlasmaCannon = WeaponsFile.TDFIonizedPlasmaCannon
local TAALinkedRailgun = WeaponsFile.TAALinkedRailgun
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon

MCPU3LXDF = Class(TLandUnit) {
    SwitchAnims = true,
	IsWaiting = false,
	
    Weapons = {
		####Armes Non Deploy�es###
        PlasmaCannon01 = Class(TDFIonizedPlasmaCannon) {},
		DroiteAAGun = Class(TAALinkedRailgun) {},
		GaucheAAGun = Class(TAALinkedRailgun) {}, 
		ArriereGaucheAAGun = Class(TAALinkedRailgun) {},
		ArriereDroitAAGun = Class(TAALinkedRailgun) {},
		####/fin Armes Non Deploy�es###
		####Armes A Deployer###
		TourelleAvantDroite = Class(TDFGaussCannonWeapon) {},
		TourelleAvantGauche = Class(TDFGaussCannonWeapon) {},
		TourelleArriereDroite = Class(TDFGaussCannonWeapon) {},
		TourelleArriereGauche = Class(TDFGaussCannonWeapon) {},
		####/fin Armes A Deployer###
		
    },	
	
     OnStopBeingBuilt = function(self,builder,layer)
        TLandUnit.OnStopBeingBuilt(self,builder,layer)
		self:SetWeaponEnabledByLabel('TourelleAvantDroite', false)
		self:SetWeaponEnabledByLabel('TourelleAvantGauche', false)
		self:SetWeaponEnabledByLabel('TourelleArriereDroite', false)
		self:SetWeaponEnabledByLabel('TourelleArriereGauche', false)
    end,
	
	
    TransformThread = function(self, land)
        if( not self.AnimManip ) then
            self.AnimManip = CreateAnimator(self)
        end
        local bp = self:GetBlueprint()
        local scale = bp.Display.UniformScale or 1

        if( land ) then
			self:SetImmobile(true)
			self:SetSpeedMult(0)          
            
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetRate(1)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
			self.IsWaiting = false
            self.Trash:Add(self.AnimManip)
			self:SetWeaponEnabledByLabel('TourelleAvantDroite', true)
			self:SetWeaponEnabledByLabel('TourelleAvantGauche', true)
			self:SetWeaponEnabledByLabel('TourelleArriereDroite', true)
			self:SetWeaponEnabledByLabel('TourelleArriereGauche', true)	
			self.SwitchAnims = true
        else
            self:SetImmobile(true)
			self:SetWeaponEnabledByLabel('TourelleAvantDroite', false)
			self:SetWeaponEnabledByLabel('TourelleAvantGauche', false)
			self:SetWeaponEnabledByLabel('TourelleArriereDroite', false)
			self:SetWeaponEnabledByLabel('TourelleArriereGauche', false) 
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetAnimationFraction(1)
            self.AnimManip:SetRate(-1)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
			self.IsWaiting = false
			self:SetSpeedMult(1)
            self.AnimManip:Destroy()
            self.AnimManip = nil
            self:SetImmobile(false)
        end
    end,

	
    OnScriptBitSet = function(self, bit)
        TLandUnit.OnScriptBitSet(self, bit)
		local bp = self:GetBlueprint()
        if bit == 1 then 
			self.AT1 = self:ForkThread(self.TransformThread, true)
        end
    end,

    OnScriptBitClear = function(self, bit)
        TLandUnit.OnScriptBitClear(self, bit)
        if bit == 1 then 
			self.AT1 = self:ForkThread(self.TransformThread, false)
        end
    end,
	
}

TypeClass = MCPU3LXDF