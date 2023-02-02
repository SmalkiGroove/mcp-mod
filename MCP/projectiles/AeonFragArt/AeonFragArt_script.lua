
local EffectTemplate = import('/lua/EffectTemplates.lua')
local _AeonFragArt = import('/mods/MCP/lua/MCPprojectiles.lua').AeonFragArt
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat

AeonFragArt = Class(_AeonFragArt) {
               
    OnImpact = function(self, TargetType, TargetEntity) 
        
        local FxFragEffect = EffectTemplate.AIFBallisticMortarHit01 
        local ChildProjectileBP = '/mods/MCP/projectiles/AeonFragArt2/AeonFragArt2_proj.bp'  
              
        
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

TypeClass = AeonFragArt