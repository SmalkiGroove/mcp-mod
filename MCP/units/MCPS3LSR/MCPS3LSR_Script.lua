local SLandUnit = import('/lua/seraphimunits.lua').SLandUnit
local WeaponsFile = import ('/lua/seraphimweapons.lua')
local SDFExperimentalPhasonProj = WeaponsFile.SDFExperimentalPhasonProj
local SDFSihEnergyRifleNormalMode = WeaponsFile.SDFSniperShotNormalMode

MCPS3LSR = Class(SLandUnit) {
    Weapons = {
        Ram = Class(SDFExperimentalPhasonProj) {},
        GattlingGun = Class(SDFSihEnergyRifleNormalMode) {
        	SetOnTransport = function(self,transportstate)
        		SDFSihEnergyRifleNormalMode.SetOnTransport(self,transportstate)
        		self.unit:SetScriptBit('RULEUTC_WeaponToggle',false)
        	end,
        },
    },

    AmbientEffects = {
    	'/effects/emitters/seraphim_t1_power_ambient_01_emit.bp'
	},

    OnCreate = function(self)
    	SLandUnit.OnCreate(self)
    	CreateAttachedEmitter(self, 'DSL301', self:GetArmy(), '/effects/emitters/seraphim_t1_power_ambient_01_emit.bp'):OffsetEmitter(-0.28,0.5,0)
    	CreateAttachedEmitter(self, 'DSL301', self:GetArmy(), '/effects/emitters/seraphim_chromatic_beam_generator_hit_03_emit.bp'):OffsetEmitter(0,0.5,0)
    	self:SetWeaponEnabledByLabel('GattlingGun',false)
    	local gungun = self:GetWeaponByLabel('GattlingGun')
    	gungun:ChangeMaxRadius(0)
    	gungun:ChangeMinRadius(0)
    	local ramgun = self:GetWeaponByLabel('Ram')
    	ramgun:ChangeMaxRadius(4)
    	ramgun:ChangeMinRadius(1.5)
    	self.Spin = CreateRotator(self, 'Spinner', 'z', nil, 75, 75, 75)
    	#self.unit.Trash:Add(self.Spin)
    end,

    OnScriptBitSet = function(self,bit)
    	SLandUnit.OnScriptBitSet(self,bit)
    	if bit == 1 then
    		if not self.AnimationManipulator then
    			self.AnimationManipulator = CreateAnimator(self)
    			self.Trash:Add(self.AnimationManipulator)
    			self.AnimationManipulator:PlayAnim(self:GetBlueprint().Display.AnimationOpen)
    		end
    		self.AnimationManipulator:SetRate(0.5)
    		local bp  self:GetBlueprint()
    		self:SetWeaponEnabledByLabel('GattlingGun',true)
    		local gungun = self:GetWeaponByLabel('GattlingGun')
    		gungun:ChangeMaxRadius(30)
    		gungun:ChangeMinRadius(3)
    		self:SetWeaponEnabledByLabel('Ram',false)
    		local ramgun = self:GetWeaponByLabel('Ram')
    		ramgun:ChangeMaxRadius(0)
    		ramgun:ChangeMinRadius(0)
    		self:GetWeaponManipulatorByLabel('GattlingGun'):SetHeadingPitch(self:GetWeaponManipulatorByLabel('Ram'):GetHeadingPitch())
    	end
    end,

    OnScriptBitClear = function(self,bit)
    	SLandUnit.OnScriptBitClear(self,bit)
    	if bit == 1 then
    		#Reset stuff
    		if self.AnimationManipulator then
    			self.AnimationManipulator:SetRate(-0.5)
    		end
    		local bp = self:GetBlueprint()
    		self:SetWeaponEnabledByLabel('GattlingGun',false)
    		local gungun = self:GetWeaponByLabel('GattlingGun')
    		gungun:ChangeMaxRadius(0)
    		gungun:ChangeMinRadius(0)
    		self:SetWeaponEnabledByLabel('Ram',true)
    		local ramgun = self:GetWeaponByLabel('Ram')
    		ramgun:ChangeMaxRadius(4)
    		ramgun:ChangeMinRadius(1.5)
    		self:GetWeaponManipulatorByLabel('Ram'):SetHeadingPitch(self:GetWeaponManipulatorByLabel('GattlingGun'):GetHeadingPitch())
		end
	end,
}

TypeClass = MCPS3LSR
