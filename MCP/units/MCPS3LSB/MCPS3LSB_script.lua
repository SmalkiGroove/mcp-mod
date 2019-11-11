local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SDFAireauBolterWeapon = import('/lua/seraphimweapons.lua').SDFAireauBolterWeapon02
local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator
local Entity = import('/lua/sim/Entity.lua').Entity

MCPS3LSB = Class(SWalkingLandUnit) {
    Weapons = {
        ArmGun = Class(SDFAireauBolterWeapon) {},
        Eye = Class(SDFUltraChromaticBeamGenerator) {},
    },
    
    ShieldEffects = {
        '/effects/emitters/aeon_shield_generator_mobile_01_emit.bp',
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
		self.ShieldEffectsBag = {}

        CreateAttachedEmitter(self, 'Torso', self:GetArmy(), '/effects/emitters/seraphim_t1_power_ambient_01_emit.bp'):OffsetEmitter(-0.28,-0.28,0)

		self.blink = CreateAnimator(self)
		self.Trash:Add(self.blink)
		self.blink:PlayAnim(self:GetBlueprint().Display.AnimationIdle,true):SetRate(1)


    end,
    
    OnShieldEnabled = function(self)
        
        self.ShieldDeploy = CreateAnimator(self)
        self.Trash:Add(self.ShieldDeploy)
        self.ShieldDeploy:PlayAnim(self:GetBlueprint().Display.AnimationShield,false):SetRate(1)
        
        SWalkingLandUnit.OnShieldEnabled(self)
                
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
        for k, v in self.ShieldEffects do
            table.insert( self.ShieldEffectsBag, CreateAttachedEmitter( self, 'Shield', self:GetArmy(), v ):OffsetEmitter(0,-0.5,0) )
        end
    end,

    OnShieldDisabled = function(self)
        self.ShieldDeploy:SetRate(-1)
        
        SWalkingLandUnit.OnShieldDisabled(self)
         
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
    end,


}

TypeClass = MCPS3LSB
