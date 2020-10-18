-------------------------------------------------------------
-- File     :  /data/projectiles/GoldAA01/GoldAA01_script.lua
-- Author(s):  Matt Vainio, Gordon Duclos
-- Summary  :  Aeon Guided Missile, DAA0206
-- Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local GoldAAProjectile = import('/mods/MCP/lua/MCPProjectiles.lua').GoldAAProjectile
local RandF = import('/lua/utilities.lua').GetRandomFloat
local EffectTemplate = import('/lua/EffectTemplates.lua')

GoldAA = Class(GoldAAProjectile) {
    OnCreate = function(self)
        GoldAAProjectile.OnCreate(self)
        self:ForkThread(self.SplitThread)
    end,

    SplitThread = function(self)
        for k, v in EffectTemplate.AMercyGuidedMissileSplit do
            CreateEmitterOnEntity(self,self:GetArmy(),v)
        end


        WaitSeconds(0.1)
        -- Create several other projectiles in a dispersal pattern
        local vx, vy, vz = self:GetVelocity()
        local velocity = 16
        local numProjectiles = 8
        local angle = (2*math.pi) / numProjectiles
        local angleInitial = RandF(0, angle)
        local ChildProjectileBP = '/mods/MCP/projectiles/GoldAA02/GoldAA02_proj.bp'
        local spreadMul = 0.4 -- Adjusts the width of the dispersal

        local xVec = 0
        local yVec = vy*0.8
        local zVec = 0

        -- Adjust damage by number of split projectiles
        self.DamageData.DamageAmount = self.DamageData.DamageAmount / numProjectiles

        -- Launch projectiles at semi-random angles away from split location
        for i = 0, (numProjectiles -1) do
            xVec = vx + math.sin(angleInitial + (i*angle)) * spreadMul * RandF(0.6, 1.3)
            zVec = vz + math.cos(angleInitial + (i*angle)) * spreadMul * RandF(0.6, 1.3)
            local proj = self:CreateChildProjectile(ChildProjectileBP)
            proj:SetVelocity(xVec, yVec, zVec)
            proj:SetVelocity(velocity * RandF(0.8, 1.2))
            proj:PassDamageData(self.DamageData)
        end
        self:Destroy()
    end,
}

TypeClass = GoldAA
