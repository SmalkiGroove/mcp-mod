--****************************************************************************
--**
--**  File     :  /lua/shield.lua
--**  Author(s):  John Comes, Gordon Duclos
--**
--**  Summary  : Shield lua module
--**
--**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

--HUGE HELP from "Experimental Square Shields" by "TheEverfades", who figured out the unit_script solution
--Her/His solution has been generalized for all units into the below shield.lua hook

local Entity = import('/lua/sim/Entity.lua').Entity
local Overspill = import('/lua/overspill.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('utilities.lua')

-- Default values for a shield specification table (to be passed to native code)
local DEFAULT_OPTIONS = {
    Mesh = '',
    MeshZ = '',
    ImpactMesh = '',
    ImpactEffects = '',
    Size = 10,
    ShieldMaxHealth = 250,
    ShieldRechargeTime = 10,
    ShieldEnergyDrainRechargeTime = 10,
    ShieldVerticalOffset = -1,
    ShieldRegenRate = 1,
    ShieldRegenStartTime = 5,
    PassOverkillDamage = false,
}

Shield = Class(moho.shield_methods,Entity) {
    __init = function(self, spec, owner)
        -- This key deviates in name from the blueprints...
        spec.Size = spec.ShieldSize

        -- Apply default options
        local spec = table.assimilate(spec, DEFAULT_OPTIONS)
        spec.Owner = owner

        _c_CreateShield(self,spec)
    end,

    OnCreate = function(self,spec)
        self.Trash = TrashBag()
        self.Owner = spec.Owner
        self.MeshBp = spec.Mesh
        --Dairy Farm Edit!
        if spec.CustomShield == 1 then
        else
            self.MeshZBp = spec.MeshZ
        end
        self.ImpactMeshBp = spec.ImpactMesh
        self._IsUp = false
        if spec.ImpactEffects ~= '' then
            self.ImpactEffects = EffectTemplate[spec.ImpactEffects]
        else
            self.ImpactEffects = {}
        end

        self:SetSize(spec.Size)
        self:SetMaxHealth(spec.ShieldMaxHealth)
        self:SetHealth(self,spec.ShieldMaxHealth)
        -- Dairy Farm Edit! 
        if spec.CustomShield == 1 then 
            self:SetType('Box')
            self.sizex = spec.sizex
            self.sizey = spec.sizey
            self.sizez = spec.sizez 
        else
            self:SetType('Bubble')
        end
        -- Dairy Farm Edit ends
        self:SetSpillOverDmgMod(spec.SpillOverDamageMod or 0.15)

        -- Show our 'lifebar'
        self:UpdateShieldRatio(1.0)

        self:SetRechargeTime(spec.ShieldRechargeTime or 5, spec.ShieldEnergyDrainRechargeTime or 5)
        self:SetVerticalOffset(spec.ShieldVerticalOffset)

        self:SetVizToFocusPlayer('Always')
        self:SetVizToEnemies('Intel')
        self:SetVizToAllies('Always')
        self:SetVizToNeutrals('Intel')

        self:AttachBoneTo(-1,spec.Owner,(spec.AttachBone or -1)) --Dairy Farm Edit! 

        self:SetShieldRegenRate(spec.ShieldRegenRate)
        self:SetShieldRegenStartTime(spec.ShieldRegenStartTime)

        self.OffHealth = -1

        self.PassOverkillDamage = spec.PassOverkillDamage

        ChangeState(self, self.OnState)
    end,

    SetRechargeTime = function(self, rechargeTime, energyRechargeTime)
        self.ShieldRechargeTime = rechargeTime
        self.ShieldEnergyDrainRechargeTime = energyRechargeTime
    end,

    SetVerticalOffset = function(self, offset)
        self.ShieldVerticalOffset = offset
    end,

    SetSize = function(self, size)
        self.Size = size
    end,

    SetShieldRegenRate = function(self, rate)
        self.RegenRate = rate
    end,

    SetShieldRegenStartTime = function(self, time)
        self.RegenStartTime = time
    end,

    SetType = function(self, type)
        self.ShieldType = type
    end,

    SetSpillOverDmgMod = function(self, dmgMod)
        self.SpillOverDmgMod = math.max(dmgMod, 0)
    end,

    UpdateShieldRatio = function(self, value)        
        if value >= 0 then
            self.Owner:SetShieldRatio(value)
        else
            self.Owner:SetShieldRatio(self:GetHealth() / self:GetMaxHealth())
        end
    end,

    GetCachePosition = function(self)
        return self:GetPosition()
    end,

    -- Note, this is called by native code to calculate spillover damage. The
    -- damage logic will subtract this value from any damage it does to units
    -- under the shield. The default is to always absorb as much as possible
    -- but the reason this function exists is to allow flexible implementations
    -- like shields that only absorb partial damage (like armor).
    OnGetDamageAbsorption = function(self,instigator,amount,type)
        --LOG('absorb: ', math.min( self:GetHealth(), amount ))

        -- Like armor damage, first multiply by armor reduction, then apply handicap
        -- See SimDamage.cpp (DealDamage function) for how this should work
        amount = amount * (self.Owner:GetArmorMult(type))
        amount = amount * ( 1.0 - ArmyGetHandicap(self:GetArmy()) )
        return math.min( self:GetHealth(), amount )
    end,

    OnCollisionCheckWeapon = function(self, firingWeapon)
        local weaponBP = firingWeapon:GetBlueprint()
        local collide = weaponBP.CollideFriendly
        if collide == false then
            if not ( IsEnemy(self:GetArmy(),firingWeapon.unit:GetArmy()) ) then
                return false
            end
        end
        --Check DNC list
        if weaponBP.DoNotCollideList then
            for k, v in pairs(weaponBP.DoNotCollideList) do
                if EntityCategoryContains(ParseEntityCategory(v), self) then
                    return false
                end
            end
        end  

        return true
    end,

    GetOverkill = function(self,instigator,amount,type)
        --LOG('absorb: ', math.min( self:GetHealth(), amount ))

        -- Like armor damage, first multiply by armor reduction, then apply handicap
        -- See SimDamage.cpp (DealDamage function) for how this should work
        amount = amount * (self.Owner:GetArmorMult(type))
        amount = amount * ( 1.0 - ArmyGetHandicap(self:GetArmy()) )
        local finalVal =  amount - self:GetHealth()
        if finalVal < 0 then
            finalVal = 0
        end
        return finalVal
    end,    

    OnDamage = function(self, instigator, amount, vector, dmgType)
        -- Only called when a shield is directly impacted, so not for Personal Shields
        -- This means personal shields never have ApplyDamage called with doOverspill as true
        self:ApplyDamage(instigator, amount, vector, dmgType, true)
    end,

    ApplyDamage = function(self, instigator, amount, vector, dmgType, doOverspill)
        if self.Owner ~= instigator then
            local absorbed = self:OnGetDamageAbsorption(instigator, amount, dmgType)

            self:AdjustHealth(instigator, -absorbed)
            self:UpdateShieldRatio(-1)
            ForkThread(self.CreateImpactEffect, self, vector)
            if self.RegenThread then
                KillThread(self.RegenThread)
                self.RegenThread = nil
            end
            if self:GetHealth() <= 0 then
                ChangeState(self, self.DamageRechargeState)
            elseif self.OffHealth < 0 then
                if self.RegenRate > 0 then
                    self.RegenThread = ForkThread(self.RegenStartThread, self)
                    self.Owner.Trash:Add(self.RegenThread)
                end
            else
                self:UpdateShieldRatio(0)
            end		
        end	
        -- Only do overspill on events where we have an instigator. 
        -- "Force" damage events from stratbombs are one example
        -- where we don't.
        if doOverspill and IsEntity(instigator) then
            Overspill.DoOverspill(self, instigator, amount, dmgType, self.SpillOverDmgMod)
        end
    end,

    RegenStartThread = function(self)
        WaitSeconds(self.RegenStartTime)
        while self:GetHealth() < self:GetMaxHealth() do

            self:AdjustHealth(self.Owner, self.RegenRate)

            self:UpdateShieldRatio(-1)

            WaitSeconds(1)
        end
    end,

    CreateImpactEffect = function(self, vector)
        local army = self:GetArmy()
        local OffsetLength = Util.GetVectorLength(vector)
        local ImpactMesh = Entity { Owner = self.Owner }
        Warp( ImpactMesh, self:GetPosition())        

        if self.ImpactMeshBp ~= '' then
            if self.sizex then
                ImpactMesh:SetMesh(self.ImpactMeshBp)
                ImpactMesh:SetDrawScale(self.Size)
                if math.floor(vector.x+0.5) == self.sizex then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(-1,0,0)),true)
                elseif math.floor(vector.x+0.5) == -self.sizex then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(1,0,0)),true)
                elseif math.floor(vector.y+0.5) == self.sizey then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(0,-1,0)),true)
                elseif math.floor(vector.y+0.5) == -self.sizey then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(0,1,0)),true)
                elseif math.floor(vector.z+0.5) == self.sizez then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(0,0,-1)),true)
                elseif math.floor(vector.z+0.5) == -self.sizez then
                    ImpactMesh:SetOrientation(OrientFromDir(Vector(0,0,1)),true)
                else

                    local xscale = self.sizex/2 / math.abs(vector.x)
                    local yscale = self.sizey/2 / math.abs(vector.y)
                    local zscale = self.sizez/2 / math.abs(vector.z)
                    local vectorscale = math.min(xscale, yscale, zscale)
                    local vector = Vector(vector.x*vectorscale, vector.y*vectorscale, vector.z*vectorscale)
                    
                    local vecmax = math.max(math.abs(vector.x), math.abs(vector.y), math.abs(vector.z))
                    if vecmax == math.abs(vector.x) then
                        -- it's coming from x
                        if vector.x > 0 then
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(-1,0,0)),true)
                        else
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(1,0,0)),true)
                        end
                    elseif vecmax == math.abs(vector.y) then
                        -- y
                        if vector.y > 0 then
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(0,-1,0)),true)
                        else
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(0,1,0)),true)
                        end
                    elseif vecmax == math.abs(vector.z) then
                        -- z
                        if vector.z > 0 then
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(0,0,-1)),true)
                        else
                            ImpactMesh:SetOrientation(OrientFromDir(Vector(0,0,1)),true)
                        end
                    end
                    Warp( ImpactMesh, Vector(
                        self:GetPosition().x - vector.x,
                        self:GetPosition().y - vector.y,
                        self:GetPosition().z - vector.z
                        ))
                end
            else
                ImpactMesh:SetMesh(self.ImpactMeshBp)
                ImpactMesh:SetDrawScale(self.Size)
                ImpactMesh:SetOrientation(OrientFromDir(Vector(-vector.x,-vector.y,-vector.z)),true)
            end
        end

        for k, v in self.ImpactEffects do
            CreateEmitterAtBone( ImpactMesh, -1, army, v ):OffsetEmitter(0,0,OffsetLength)
        end

        WaitSeconds(5)
        ImpactMesh:Destroy()
    end,

    OnDestroy = function(self)
        self:SetMesh('')
        if self.MeshZ ~= nil then
            self.MeshZ:Destroy()
            self.MeshZ = nil
        end
        self:UpdateShieldRatio(0)
        ChangeState(self, self.DeadState)
    end,

    -- Return true to process this collision, false to ignore it.
    OnCollisionCheck = function(self,other)
        if other:GetArmy() == -1 then
            return false
        end

        -- allow strategic nuke missile to penetrate shields
        if EntityCategoryContains( categories.STRATEGIC, other ) and
            EntityCategoryContains( categories.MISSILE, other ) then
            return false
        end

        if other:GetBlueprint().Physics.CollideFriendlyShield then
            return true
        end

        return IsEnemy(self:GetArmy(),other:GetArmy())
    end,

    TurnOn = function(self)
        ChangeState(self, self.OnState)
    end,

    TurnOff = function(self)
        ChangeState(self, self.OffState)
    end,

    IsOn = function(self)
        return false
    end,

    IsUp = function(self)
        return (self:IsOn() and self._IsUp)
    end,

    RemoveShield = function(self)
        self._IsUp = false

        self:SetCollisionShape('None')

        self:SetMesh('')
        if self.MeshZ ~= nil then
            self.MeshZ:Destroy()
            self.MeshZ = nil
        end
    end,

    CreateShieldMesh = function(self)

        --Dairy Farm Edit! 
        if self.sizex then
            self:SetCollisionShape('Box', 0, 0, 0, self.sizex/2, self.sizey/2, self.sizez/2)
        else
            self:SetCollisionShape( 'Sphere', 0, 0, 0, self.Size/2)
        end
        --Dairy Farm Edit Ends

        self:SetMesh(self.MeshBp, true)
        self:SetParentOffset(Vector(0,self.ShieldVerticalOffset,0))
        self:SetDrawScale(self.Size)

        --Dairy Farm Edit!
        if self.sizex then
        else
            if self.MeshZ == nil then
                self.MeshZ = Entity { Owner = self.Owner }
                self.MeshZ:SetMesh(self.MeshZBp)
                Warp( self.MeshZ, self.Owner:GetPosition() )
                self.MeshZ:SetDrawScale(self.Size)
                self.MeshZ:AttachBoneTo(-1,self.Owner,(self.AttachBone or -1)) --Dairy Farm Edit!
                self.MeshZ:SetParentOffset(Vector(0,self.ShieldVerticalOffset,0))

                self.MeshZ:SetVizToFocusPlayer('Always')
                self.MeshZ:SetVizToEnemies('Intel')
                self.MeshZ:SetVizToAllies('Always')
                self.MeshZ:SetVizToNeutrals('Intel')
            end
        end
        --DairyFarm Edit ends
        self._IsUp = true
    end,

    -- Basically run a timer, but with visual bar movement
    ChargingUp = function(self, curProgress, time)
        local owner = self.Owner
        local position = owner:GetPosition()
        local shieldbp = self.Owner:GetBlueprint().Defense.Shield
        local shieldRadius = shieldbp.ShieldSize
        local aiBrain = owner:GetAIBrain()
        local otherShields = aiBrain:GetUnitsAroundPoint(( categories.SHIELD * categories.DEFENSE), position, shieldRadius, 'Ally' )
        local rechargeTime = time + ((table.getn(otherShields) - 1) * .2 * time)
        if rechargeTime > (time * 3) then
            rechargeTime = time
        else
        end
        while curProgress < rechargeTime do
            local fraction = self.Owner:GetResourceConsumed()
            curProgress = curProgress + ( fraction / 10 )
            curProgress = math.min( curProgress, rechargeTime )

            local workProgress = curProgress / rechargeTime

            self:UpdateShieldRatio( workProgress )
            WaitTicks(1)
        end    
    end,

    OnState = State {
        Main = function(self)

            -- If the shield was turned off; use the recharge time before turning back on
            if self.OffHealth >= 0 then
                self.Owner:SetMaintenanceConsumptionActive()
                self:ChargingUp(0, self.ShieldEnergyDrainRechargeTime)

                -- If the shield has less than full health, allow the shield to begin regening
                if self:GetHealth() < self:GetMaxHealth() and self.RegenRate > 0 then
                    self.RegenThread = ForkThread(self.RegenStartThread, self)
                    self.Owner.Trash:Add(self.RegenThread)
                end
            end

            self.Owner:OnShieldEnabled()

            -- We are no longer turned off
            self.OffHealth = -1
            
            self:UpdateShieldRatio(-1)
            self:CreateShieldMesh()
            
            self.Owner:PlayUnitSound('ShieldOn')
            self.Owner:SetMaintenanceConsumptionActive()

            local aiBrain = self.Owner:GetAIBrain()

            WaitSeconds(1.0)
            local fraction = self.Owner:GetResourceConsumed()
            local on = true
            local test = false

            -- Test in here if we have run out of power; if the fraction is ever not 1 we don't have full power
            while on do
                WaitTicks(1)

                self:UpdateShieldRatio(-1)

                fraction = self.Owner:GetResourceConsumed()
                if fraction ~= 1 and aiBrain:GetEconomyStored('ENERGY') <= 1 then
                    if test then
                        on = false
                    else
                        test = true
                    end
                else
                    on = true
                    test = false
                end
            end

            -- Record the amount of health on the shield here so when the unit tries to turn its shield
            -- back on and off it has the amount of health from before.
            --self.OffHealth = self:GetHealth()
            ChangeState(self, self.EnergyDrainRechargeState)
        end,

        IsOn = function(self)
            return true
        end,
    },

    -- When manually turned off
    OffState = State {
        Main = function(self)
            self.Owner:OnShieldDisabled()

            -- No regen during off state
            if self.RegenThread then
                KillThread(self.RegenThread)
                self.RegenThread = nil
            end

            -- Set the offhealth - this is used basically to let the unit know the unit was manually turned off
            self.OffHealth = self:GetHealth()

            -- Get rid of the shield bar
            self:UpdateShieldRatio(0)
            self:RemoveShield()

            self.Owner:PlayUnitSound('ShieldOff')
            self.Owner:SetMaintenanceConsumptionInactive()

            WaitSeconds(1)
        end,

        IsOn = function(self)
            return false
        end,
    },

    -- This state happens when the shield has been depleted due to damage
    DamageRechargeState = State {
        Main = function(self)
            self:RemoveShield()

            self.Owner:OnShieldDisabled()
            self.Owner:PlayUnitSound('ShieldOff')
            
            -- We must make the unit charge up before getting its shield back
            self:ChargingUp(0, self.ShieldRechargeTime)

            -- Fully charged, get full health
            self:SetHealth(self, self:GetMaxHealth())

            ChangeState(self, self.OnState)
        end,

        IsOn = function(self)
            return false
        end,
    },

    -- This state happens only when the army has run out of power
    EnergyDrainRechargeState = State {
        Main = function(self)
            self:RemoveShield()

            self.Owner:OnShieldDisabled()
            self.Owner:PlayUnitSound('ShieldOff')

            self:ChargingUp(0, self.ShieldEnergyDrainRechargeTime)

            -- If the unit is attached to a transport, make sure the shield goes to the off state
            -- so the shield isn't turned on while on a transport
            if not self.Owner:IsUnitState('Attached') then
                ChangeState(self, self.OnState)
            else
                ChangeState(self, self.OffState)
            end
        end,

        IsOn = function(self)
            return false
        end,
    },

    DeadState = State {
        Main = function(self)
        end,

        IsOn = function(self)
            return false
        end,
    },
}

--- A bubble shield attached to a single unit.
PersonalBubble = Class(Shield) {
    OnCreate = function(self, spec)
        Shield.OnCreate(self, spec)

        -- Store off useful values from the blueprint
        local OwnerBp = self.Owner:GetBlueprint()

        self.SizeX = OwnerBp.SizeX
        self.SizeY = OwnerBp.SizeY
        self.SizeZ = OwnerBp.SizeZ

        self.ShieldSize = spec.ShieldSize

        --Manually disable the bubble shield's collision sphere after its creation so it acts like the new personal shields
        if self.sizex then
            self:SetCollisionShape('Box', 0, 0, 0, self.sizex/2, self.sizey/2, self.sizez/2)
            self:SetType('Box')
        else
            self:SetCollisionShape('None')
            self:SetType('Personal')
        end
    end,
    
    ApplyDamage = function(self, instigator, amount, vector, dmgType, doOverspill)
        -- We want all personal shields to pass overkill damage, including this one
        -- Was handled by self.PassOverkillDamage bp value, now defunct
        if self.Owner ~= instigator then
            local overkill = self:GetOverkill(instigator,amount,dmgType)    
            if self.Owner and IsUnit(self.Owner) and overkill > 0 then
                self.Owner:DoTakeDamage(instigator, overkill, vector, dmgType)
            end
        end
        
        Shield.ApplyDamage(self, instigator, amount, vector, dmgType, doOverspill)
    end,
    
    CreateShieldMesh = function(self)
        Shield.CreateShieldMesh(self)
        if self.sizex then
            self:SetCollisionShape('Box', 0, 0, 0, self.sizex/2, self.sizey/2, self.sizez/2)
        else
            self:SetCollisionShape('None')
        end
    end,

    RemoveShield = function(self)
        Shield.RemoveShield(self)
        self:SetCollisionShape('None')
    end,

    OnState = State(Shield.OnState) {
        Main = function(self)
            -- Set the collision profile of the unit to match the apparent shield sphere.
            -- Since the collision handler in Unit deals with personal shields, the damage will be
            -- passed to the shield.
            if self.sizex then
                self.Owner:SetCollisionShape('Box', 0, 0, 0, self.sizex/2, self.sizey/2, self.sizez/2)
            else
                self.Owner:SetCollisionShape('Sphere', 0, self.SizeY * 0.5, 0, self.ShieldSize * 0.5)
            end
            Shield.OnState.Main(self)
        end
    },

    OffState = State(Shield.OffState) {
        Main = function(self)
            -- When the shield is down for some reason, reset the unit's collision profile so it can
            -- again be hit.
            self.Owner:RevertCollisionShape()
            Shield.OffState.Main(self)
        end
    },

    DamageRechargeState = State(Shield.DamageRechargeState) {
        Main = function(self)
            self.Owner:RevertCollisionShape()
            Shield.DamageRechargeState.Main(self)
         end
    },

    EnergyDrainRechargeState = State(Shield.EnergyDrainRechargeState) {
        Main = function(self)
            self.Owner:RevertCollisionShape()
            Shield.EnergyDrainRechargeState.Main(self)
        end
    }
}