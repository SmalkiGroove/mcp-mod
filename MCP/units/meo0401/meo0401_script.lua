
local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')
local Entity = import('/lua/sim/Entity.lua').Entity
local explosion = import('/lua/defaultexplosions.lua')
local CreateDeathExplosion = explosion.CreateDefaultHitExplosionAtBone
local EffectTemplate = import('/lua/EffectTemplates.lua')
local utilities = import('/lua/Utilities.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')


MEO0401 = Class(TAirUnit) {
	DestroyNoFallRandomChance = 1.1,

	BuildAttachBone = 'Build_Bone_01',

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
		self.AT1 = self:ForkThread(self.ArrivalThread, true)
		ChangeState(self, self.IdleState)
    end,

    CreateBuildEffects = function( self, unitBeingBuilt, order )
        EffectUtil.CreateUEFBuildSliceBeams( self, unitBeingBuilt, self:GetBlueprint().General.BuildBones.BuildEffectBones, self.BuildEffectsBag )
    end,

    OnFailedToBuild = function(self)
        TAirUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
			self:SetImmobile(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            TAirUnit.OnStartBuild(self, unitBuilding, order)
            self.UnitBeingBuilt = unitBuilding
            ChangeState(self, self.BuildingState)
        end,
    },

    BuildingState = State {
        Main = function(self)
            -- local unitBuilding = self.UnitBeingBuilt
            self:SetBusy(true)
			self:SetImmobile(true)
            local bone = self.BuildAttachBone
            self:DetachAll(bone)
            -- unitBuilding:HideBone(0, true)
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            TAirUnit.OnStopBuild(self, unitBeingBuilt)
            ChangeState(self, self.FinishedBuildingState)
        end,
    },

    FinishedBuildingState = State {
        Main = function(self)
            self:SetBusy(true)
			self:SetImmobile(false)
            -- local unitBuilding = self.UnitBeingBuilt
            -- unitBuilding:DetachFrom(true)
            self:DetachAll(self.BuildAttachBone)
            -- if self:TransportHasAvailableStorage() then
            --     self:AddUnitToStorage(unitBuilding)
            -- else
            --     local worldPos = self:CalculateWorldPositionFromRelative({0, 0, 0})
            --     IssueMoveOffFactory({unitBuilding}, worldPos)
            --     unitBuilding:ShowBone(0,true)
            -- end
            self:SetBusy(false)
            self:RequestRefreshUI()
            ChangeState(self, self.IdleState)
        end,
    },

	
	
	CreateDamageEffects = function(self, bone, army )
        for k, v in EffectTemplate.DamageFireSmoke01 do
            CreateAttachedEmitter( self, bone, army, v ):ScaleEmitter(1.5)
        end
    end,

    CreateDeathExplosionDustRing = function( self )
        local blanketSides = 18
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 2.8

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)

            local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 1.5, blanketZ + 4, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end        
    end,

	CreateFirePlumes = function( self, army, bones, yBoneOffset )
        local proj, position, offset, velocity
        local basePosition = self:GetPosition()
        for k, vBone in bones do
            position = self:GetPosition(vBone)
            offset = utilities.GetDifferenceVector( position, basePosition )
            velocity = utilities.GetDirectionVector( position, basePosition ) # 
            velocity.x = velocity.x + utilities.GetRandomFloat(-0.3, 0.3)
            velocity.z = velocity.z + utilities.GetRandomFloat(-0.3, 0.3)
            velocity.y = velocity.y + utilities.GetRandomFloat( 0.0, 0.3)
            proj = self:CreateProjectile('/effects/entities/DestructionFirePlume01/DestructionFirePlume01_proj.bp', offset.x, offset.y + yBoneOffset, offset.z, velocity.x, velocity.y, velocity.z)
            proj:SetBallisticAcceleration(utilities.GetRandomFloat(-1, -2)):SetVelocity(utilities.GetRandomFloat(3, 4)):SetCollision(false)
            
            local emitter = CreateEmitterOnEntity(proj, army, '/effects/emitters/destruction_explosion_fire_plume_02_emit.bp')

            local lifetime = utilities.GetRandomFloat( 12, 22 )
        end
    end,
	
	CreateExplosionDebris = function( self, army )
        for k, v in EffectTemplate.ExplosionDebrisLrg01 do
            CreateAttachedEmitter( self, 'UEOW1105', army, v )
        end
    end,
	
	ArrivalThread = function(self)
		WaitSeconds(1.5)
        self:PlayUnitSound('Destroyed')
		WaitSeconds(2.0)
        self:PlayUnitSound('Destroyed')
        local army = self:GetArmy()
		WaitSeconds(3.5)
        # Create Initial explosion effects
        explosion.CreateFlash( self, 'UEOW1105', 4.5, army )
		explosion.CreateFlash( self, 'Bay_Lower08', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower09', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower10', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower11', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower01', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower12', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower13', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower15', 2.0, army )
		WaitSeconds(2.5)
		self:PlayUnitSound('Destroyed')

        WaitSeconds(1)
        
        CreateDeathExplosion( self, 'UEOW1105', 1.5)

        WaitSeconds( 1 )
        self:CreateDeathExplosionDustRing()
		self:PlayUnitSound('Destroyed')
        WaitSeconds(0.4)
		
        
		local totalBones = self:GetBoneCount() - 1
        local army = self:GetArmy()
        for k, v in EffectTemplate.SmokeLrg01 do
            for bone = 1, totalBones do
                CreateAttachedEmitter(self,bone,army, v)
            end
        end
		WaitSeconds(1)
		explosion.CreateFlash( self, 'UEOW1105', 4.5, army )
		explosion.CreateFlash( self, 'Bay_Lower08', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower09', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower10', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower11', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower01', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower12', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower13', 2.0, army )
		explosion.CreateFlash( self, 'Bay_Lower15', 2.0, army )
		WaitSeconds(1)
		for k, v in EffectTemplate.SmokeLrg01 do
            for bone = 1, totalBones do
                CreateAttachedEmitter(self,bone,army, v)
            end
        end
		WaitSeconds(1.8)
		for k, v in EffectTemplate.SmokeLrg01 do
            for bone = 1, totalBones do
                CreateAttachedEmitter(self,bone,army, v)
            end
        end
		WaitSeconds(3.6)
		for k, v in EffectTemplate.SmokeLrg01 do
            for bone = 1, totalBones do
                CreateAttachedEmitter(self,bone,army, v)
            end
        end
        
        WaitSeconds(0.5)
        CreateDeathExplosion( self, 'UEOW1105', 2)
    end,
	
}
TypeClass = MEO0401