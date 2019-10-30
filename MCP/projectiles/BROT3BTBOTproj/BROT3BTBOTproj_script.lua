local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')
local TArtilleryProjectile = import('/lua/terranprojectiles.lua').TArtilleryProjectile
local AeonBROT3BTBOTproj = import('/mods/MCP/lua/MCPprojectiles.lua').AeonBROT3BTBOTproj
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat
local VizMarker = import('/lua/sim/VizMarker.lua').VizMarker

BROT3BTBOTproj = Class(AeonBROT3BTBOTproj) {
               
    OnImpact = function(self, TargetType, TargetEntity) 
        
        local FxFragEffect = EffectTemplate.AIFBallisticMortarHit01 
        local ChildProjectileBP = '/mods/MCP/projectiles/BROT3BTBOT2proj/BROT3BTBOT2proj_proj.bp'  
              
        
        # Split effects
        for k, v in FxFragEffect do
            CreateEmitterAtEntity( self, self:GetArmy(), v )
        self:Destroy()
        end
        
        local vx, vy, vz = self:GetVelocity()
        local velocity = 10
    
    # One initial projectile following same directional path as the original
        self:CreateChildProjectile(ChildProjectileBP):SetVelocity(vx, vy, vz):SetVelocity(velocity):PassDamageData(self.DamageData)
      
    # Create several other projectiles in a dispersal pattern
        local numProjectiles = 10
        local angle = (2*math.pi) / numProjectiles
        local angleInitial = RandomFloat( 0, angle )
        
        # Randomization of the spread
        local angleVariation = angle * 0.85 # Adjusts angle variance spread
        local spreadMul = 1.6 # Adjusts the width of the dispersal        
        
        local xVec = 0 
        local yVec = vy
        local zVec = 0

        # Launch projectiles at semi-random angles away from split location
        for i = 0, (numProjectiles -1) do
            xVec = vx + (math.sin(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul
            zVec = vz + (math.cos(angleInitial + (i*angle) + RandomFloat(-angleVariation, angleVariation))) * spreadMul 
            local proj = self:CreateChildProjectile(ChildProjectileBP)
            proj:SetVelocity(xVec,yVec,zVec)
            proj:SetVelocity(velocity)
            proj:PassDamageData(self.DamageData)                        
        end
        local pos = self:GetPosition()
    end,
    
    

}

TypeClass = BROT3BTBOTproj