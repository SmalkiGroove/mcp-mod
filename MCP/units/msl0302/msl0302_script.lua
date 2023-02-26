local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SDFAireauBolterWeapon = import('/lua/seraphimweapons.lua').SDFAireauBolterWeapon02
local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator

MSL0302 = Class(SWalkingLandUnit) {
    Weapons = {
        ArmGun = Class(SDFAireauBolterWeapon) {},
        Eye = Class(SDFUltraChromaticBeamGenerator) {},
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)

        CreateAttachedEmitter(self, 'Torso', self:GetArmy(), '/effects/emitters/seraphim_t1_power_ambient_01_emit.bp'):OffsetEmitter(-0.28,-0.28,0)

		self.blink = CreateAnimator(self)
		self.Trash:Add(self.blink)
		self.blink:PlayAnim(self:GetBlueprint().Display.AnimationIdle,true):SetRate(1)


    end,
    
}

TypeClass = MSL0302
