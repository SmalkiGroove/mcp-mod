local SShieldStructureUnit = import('/lua/seraphimunits.lua').SShieldStructureUnit
local LaserWeapon = import ('/mods/MCP/lua/MCPWeapons.lua').TMCSpiderLaserweapon
local SSeraphimSubCommanderGateway01 = import('/lua/EffectTemplates.lua').SeraphimSubCommanderGateway01
local SSeraphimSubCommanderGateway02 = import('/lua/EffectTemplates.lua').SeraphimSubCommanderGateway02
local explosion = import('/lua/defaultexplosions.lua')

MSB2403 = Class(SShieldStructureUnit) {
    SpawnEffects = {
        '/effects/emitters/seraphim_othuy_spawn_01_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_02_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_03_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_04_emit.bp',
    },
    
    Weapons = {
        Eye01 = Class(LaserWeapon) {FxMuzzleFlashScale = 1.2,},
        Eye02 = Class(LaserWeapon) {FxMuzzleFlashScale = 1.2,},
    },
    
    OnStopBeingBuilt = function(self, builder, layer)
        for k, v in SSeraphimSubCommanderGateway01 do
            CreateAttachedEmitter(self, 'Spinner', self:GetArmy(), v)
            CreateAttachedEmitter(self, 'Light04', self:GetArmy(), v)
            CreateAttachedEmitter(self, 'Light05', self:GetArmy(), v)
            CreateAttachedEmitter(self, 'Light06', self:GetArmy(), v)
        end
        
        for k, v in SSeraphimSubCommanderGateway02 do
            CreateAttachedEmitter(self, 'Light01', self:GetArmy(), v)
            CreateAttachedEmitter(self, 'Light02', self:GetArmy(), v)
            CreateAttachedEmitter(self, 'Light03', self:GetArmy(), v)
        end
        
        SShieldStructureUnit.OnStopBeingBuilt(self, builder, layer)
        self.Rotator1 = CreateRotator(self, 'Spinner', 'y', nil, 10, 5, 0)
        self.Trash:Add(self.Rotator1)
        self:SetScriptBit('RULEUTC_ShieldToggle', true)
        self:ForkThread(self.ResourceThread)
    end,
    
    DeathThread = function(self, overkillRatio , instigator)
        if self.Rotator1 then
            self.Rotator1:SetTargetSpeed(40)
        end

        local bigExplosionBones = {'Spinner', 'Eye01', 'Eye02'}
        local explosionBones = {'XSB0405', 'Light01',
                                'Light02', 'Light03',
                                'Light04', 'Light05', 'Light06',
        }
        
        explosion.CreateDefaultHitExplosionAtBone(self, bigExplosionBones[Random(1,3)], 4.0)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})           
        WaitSeconds(2)
        
        local RandBoneIter = RandomIter(explosionBones)
        for i=1,Random(4,6) do
            local bone = RandBoneIter()
            explosion.CreateDefaultHitExplosionAtBone(self, bone, 1.0)
            WaitTicks(Random(1,3))
        end
        
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeath') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(3.5)
        explosion.CreateDefaultHitExplosionAtBone(self, 'Spinner', 5.0)        

        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end
    
        self:DestroyAllDamageEffects()
        self:CreateWreckage(overkillRatio)

        -- CURRENTLY DISABLED UNTIL DESTRUCTION
        -- Create destruction debris out of the mesh, currently these projectiles look like crap,
        -- since projectile rotation and terrain collision doesn't work that great. These are left in
        -- hopes that this will look better in the future.. =)
        if(self.ShowUnitDestructionDebris and overkillRatio) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris(self, true, true, true)
            else
                self.CreateUnitDestructionDebris(self, true, true, true)
            end
        end

        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,
    
    OnDamage = function(self, instigator, amount, vector, damagetype)
        SShieldStructureUnit.OnDamage(self, instigator, amount, vector, damagetype) 
    end,
    
    ResourceThread = function(self)
        if not self:IsDead() then
            local energy = self:GetAIBrain():GetEconomyStored('Energy')

            -- Check to see if the player has enough mass / energy
            if  energy <= 10 then
                self:SetScriptBit('RULEUTC_ShieldToggle', false)
                self:ForkThread(self.ResourceThread2)
            else
                -- If the above conditions are not met we check again
                self:ForkThread(self.EconomyWaitUnit)
            end
        end    
    end,

    EconomyWaitUnit = function(self)
        if not self:IsDead() then
        WaitSeconds(2)
            if not self:IsDead() then
                self:ForkThread(self.ResourceThread)
            end
        end
    end,
    
    ResourceThread2 = function(self)
        if not self:IsDead() then
            local energy = self:GetAIBrain():GetEconomyStored('Energy')

            -- Check to see if the player has enough mass / energy
            if  energy > 3000 then
                self:SetScriptBit('RULEUTC_ShieldToggle', true)
                self:ForkThread(self.ResourceThread)
            else
                -- If the above conditions are not met we kill this unit
                self:ForkThread(self.EconomyWaitUnit2)
            end
        end    
    end,

    EconomyWaitUnit2 = function(self)
        if not self:IsDead() then
        WaitSeconds(2)
            if not self:IsDead() then
                self:ForkThread(self.ResourceThread2)
            end
        end
    end,
}

TypeClass = MSB2403
