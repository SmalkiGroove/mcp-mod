local CollisionBeam = import('/lua/sim/CollisionBeam.lua').CollisionBeam
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/utilities.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local MCPCollisionBeam = import('/mods/MCP/lua/MCPCollisionBeam.lua').CollisionBeam

-- Base class that defines supreme commander specific defaults
HawkCollisionBeam = Class(CollisionBeam) {
    FxImpactUnit = EffectTemplate.DefaultProjectileLandUnitImpact,
    FxImpactLand = {},
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = EffectTemplate.DefaultProjectileUnderWaterImpact,
    FxImpactAirUnit = EffectTemplate.DefaultProjectileAirUnitImpact,
    FxImpactProp = {},
    FxImpactShield = {},    
    FxImpactNone = {},
}

-- Section including code for the ACUs Expansion Mod
PDLaserCollisionBeam = Class(HawkCollisionBeam) {
    FxBeam = {'/effects/emitters/em_pdlaser_beam_01_emit.bp'},
    FxBeamEndPoint = {
        '/effects/emitters/quantum_generator_end_01_emit.bp',
        '/effects/emitters/quantum_generator_end_03_emit.bp',
        '/effects/emitters/quantum_generator_end_04_emit.bp',
    },
    
    FxBeamStartPoint = {
        '/effects/emitters/quantum_generator_01_emit.bp',
        '/effects/emitters/quantum_generator_02_emit.bp',
        '/effects/emitters/quantum_generator_04_emit.bp',
    },
    
    FxBeamStartPointScale = 0.05,
    FxBeamEndPointScale = 0.05,
    
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread(self.ScorchThread)   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnEnable = function(self)
        CollisionBeam.OnEnable(self)
        if self.Scorching == nil then
            self.Scorching = self:ForkThread(self.ScorchThread)
        end
    end,
    
    OnDisable = function(self)
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
    end,    
}

PDLaser2CollisionBeam = Class(CollisionBeam) {
    FxBeamStartPoint = EffectTemplate.TDFHiroGeneratorMuzzle01,
    FxBeam = EffectTemplate.TDFHiroGeneratorBeam,
    FxBeamEndPoint = EffectTemplate.TDFHiroGeneratorHitLand,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
    FxBeamStartPointScale = 0.75,
    FxBeamEndPointScale = 0.75,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread(self.ScorchThread)   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function(self)
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
    end,
}

-- SEADRAGON & REAPER BEAMS
MartyrMicrowaveLaserCollisionBeam01 = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPointScale = 0.2,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/mini_microwave_laser_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
}

-- Mini QUANTUM BEAM GENERATOR COLLISION BEAM
MiniQuantumBeamGeneratorCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam02',
    TerrainImpactScale = 0.2,
        
    FxBeam = {'/mods/MCP/effects/emitters/mini_quantum_generator_beam_01_emit.bp'},
    FxBeamEndPoint = {
        '/effects/emitters/quantum_generator_end_01_emit.bp',
        '/effects/emitters/quantum_generator_end_03_emit.bp',
        '/effects/emitters/quantum_generator_end_04_emit.bp',
    },   
    FxBeamEndPointScale = 0.2,
    FxBeamStartPoint = {
        '/effects/emitters/quantum_generator_01_emit.bp',
        '/effects/emitters/quantum_generator_02_emit.bp',
        '/effects/emitters/quantum_generator_04_emit.bp',
    },   
    FxBeamStartPointScale = 0.2,

    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnEnable = function( self )
        CollisionBeam.OnEnable(self)
        if self.Scorching == nil then
            self.Scorching = self:ForkThread( self.ScorchThread )
        end
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 3.5 + (Random() * 3.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 250, 250, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 3.2 + (Random() * 3.5)
            CurrentPosition = self:GetPosition(1)
        end 
    end,  
}

-- Super QUANTUM BEAM GENERATOR COLLISION BEAM
SuperQuantumBeamGeneratorCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam02',
    TerrainImpactScale = 1,
        
    FxBeam = {'/mods/MCP/effects/emitters/super_quantum_generator_beam_01_emit.bp'},
    FxBeamEndPoint = {
        '/effects/emitters/quantum_generator_end_01_emit.bp',
        '/effects/emitters/quantum_generator_end_03_emit.bp',
        '/effects/emitters/quantum_generator_end_04_emit.bp',
        '/effects/emitters/quantum_generator_end_05_emit.bp',
        '/effects/emitters/quantum_generator_end_06_emit.bp',
    },   
    FxBeamEndPointScale = 0.6,
    FxBeamStartPoint = {
        '/effects/emitters/quantum_generator_01_emit.bp',
        '/effects/emitters/quantum_generator_02_emit.bp',
        '/effects/emitters/quantum_generator_04_emit.bp',
    },   
    FxBeamStartPointScale = 0.6,

    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnEnable = function( self )
        CollisionBeam.OnEnable(self)
        if self.Scorching == nil then
            self.Scorching = self:ForkThread( self.ScorchThread )
        end
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 3.5 + (Random() * 3.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 250, 250, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 3.2 + (Random() * 3.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,  
}

MiniPhasonLaserCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.5,
    FxBeamStartPoint = EffectTemplate.APhasonLaserMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/mini_phason_laser_beam_01_emit.bp'},
    FxBeamStartPointScale = 0.2,
    FxBeamEndPoint = EffectTemplate.APhasonLaserImpact01,
    FxBeamEndPointScale = 0.4,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnEnable = function( self )
        CollisionBeam.OnEnable(self)
        if self.Scorching == nil then
            self.Scorching = self:ForkThread( self.ScorchThread )
        end
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 1.5 + (Random() * 1.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

MiniMicrowaveLaserCollisionBeam01 = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeamStartPointScale = 0.2,
    FxBeam = {'/mods/MCP/effects/emitters/mini_microwave_laser_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    FxBeamEndPointScale = 0.2,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnEnable = function( self )
        CollisionBeam.OnEnable(self)
        if self.Scorching == nil then
            self.Scorching = self:ForkThread( self.ScorchThread )
        end
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 1.5 + (Random() * 1.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

HawkTractorClawCollisionBeam = Class(HawkCollisionBeam) {
    FxBeam = {EffectTemplate.TTransportBeam01},
    FxBeamEndPoint = {EffectTemplate.TTransportGlow01},
    FxBeamEndPointScale = 1.0,
    FxBeamStartPoint = {EffectTemplate.TTransportGlow01},
}

-- Juggernaut LASERS
JuggLaserCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam02',
    TerrainImpactScale = 0.02,
        
    FxBeam = {'/mods/MCP/effects/emitters/jugg_laser_beam_01_emit.bp'},
    FxBeamEndPoint = {
        '/effects/emitters/quantum_generator_end_01_emit.bp',
        '/effects/emitters/quantum_generator_end_03_emit.bp',
        '/effects/emitters/quantum_generator_end_04_emit.bp',
    },   
    FxBeamEndPointScale = 0.02,
    FxBeamStartPoint = {
        '/effects/emitters/quantum_generator_01_emit.bp',
        '/effects/emitters/quantum_generator_02_emit.bp',
        '/effects/emitters/quantum_generator_04_emit.bp',
    },   
    FxBeamStartPointScale = 0.02,
}

-- ShadowCat beam
RailLaserCollisionBeam01 = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeamStartPointScale = 0.2,
    FxBeam = {'/mods/MCP/effects/emitters/rail_microwave_laser_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    FxBeamEndPointScale = 0.2,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
    
    OnImpactDestroy = function( self, targetType, targetEntity )
       if targetEntity and not IsUnit(targetEntity) then
          RailLaserCollisionBeam01.OnImpactDestroy(self, targetType, targetEntity)
          return
       end
   
       if self.counter then
          if self.counter >= 3 then
             RailLaserCollisionBeam01.OnImpactDestroy(self, targetType, targetEntity)
             return
          else
             self.counter = self.counter + 1
          end
           else
              self.counter = 1
           end
           if targetEntity then
            self.lastimpact = targetEntity:GetEntityId()
        end
    end,
}

-- ZAPPER STUN BEAM
EMCHPRFDisruptorBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.3,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeamStartPointScale = 0.3,
    FxBeam = {'/mods/MCP/effects/emitters/manticore_microwave_laser_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    FxBeamEndPointScale = 0.3,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
    
    OnImpact = function(self, impactType, targetEntity)
        if targetEntity then 
            if EntityCategoryContains(categories.TECH1, targetEntity) then
                targetEntity:SetStunned(0.2)
            elseif EntityCategoryContains(categories.TECH2, targetEntity) then
                targetEntity:SetStunned(0.2)
            elseif EntityCategoryContains(categories.TECH3, targetEntity) and not EntityCategoryContains(categories.SUBCOMMANDER, targetEntity) then--SUBCOMS HAVE SUMCOM ADDED IN MOD
                targetEntity:SetStunned(0.2)
            end
        end

        HawkCollisionBeam.OnImpact(self, impactType, targetEntity)
    end, 
}

-- HIRO LASER COLLISION BEAM
TDFGoliathCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamEndPoint = {
        '/mods/MCP/effects/emitters/goliath_death_laser_end_01_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_end_02_emit.bp',
        '/effects/emitters/uef_orbital_death_laser_end_03_emit.bp',
        '/effects/emitters/uef_orbital_death_laser_end_04_emit.bp',
        '/effects/emitters/uef_orbital_death_laser_end_05_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_end_06_emit.bp',
        '/effects/emitters/uef_orbital_death_laser_end_07_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_end_08_emit.bp',
        '/effects/emitters/uef_orbital_death_laser_end_distort_emit.bp',
    },
    FxBeamStartPointScale = 1,
    FxBeam = {'/mods/MCP/effects/emitters/goliath_death_laser_beam_01_emit.bp'},
    FxBeamStartPoint = {
        '/mods/MCP/effects/emitters/goliath_death_laser_muzzle_01_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_muzzle_02_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_muzzle_03_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_muzzle_04_emit.bp',
        '/mods/MCP/effects/emitters/goliath_death_laser_muzzle_05_emit.bp',
    },
    FxBeamEndPointScale = 1,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

-- MGAALaser CANNON COLLISION BEAM
MGAALaserCollisionBeam = Class(HawkCollisionBeam) {
    FxBeam = {
        '/mods/MCP/effects/emitters/aa_cannon_beam_01_emit.bp',
    },
    FxBeamEndPoint = {
        '/effects/emitters/particle_cannon_end_01_emit.bp',
        '/effects/emitters/particle_cannon_end_02_emit.bp',
    },
    FxBeamEndPointScale = 1,
}

-- Aeon t4 beam
GoldenLaserCollisionBeam01 = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPointScale = 0.2,
    FxBeamStartPoint = MCPEffectTemplate.GLaserMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/mini_golden_laser_beam_01_emit.bp'},
    FxBeamEndPoint = MCPEffectTemplate.GLaserEndPoint01,
    FxBeamEndPointScale = 0.2,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
}

YenaothaExperimentalLaserCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = EffectTemplate.SExperimentalPhasonLaserMuzzle01,
    FxBeam = EffectTemplate.SExperimentalPhasonLaserBeam,
    FxBeamEndPoint = EffectTemplate.SExperimentalPhasonLaserHitLand,
    SplatTexture = 'scorch_004_albedo',
    ScorchSplatDropTime = 0.1,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 4.0 + (Random() * 1.0) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 4.0 + (Random() * 1.0)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

YenaothaExperimentalLaser02CollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = EffectTemplate.SExperimentalPhasonLaserMuzzle01,
    FxBeamStartPointScale = 0.2,
    FxBeam = MCPEffectTemplate.SExperimentalDronePhasonLaserBeam,
    FxBeamEndPoint = EffectTemplate.SExperimentalPhasonLaserHitLand,
    FxBeamEndPointScale = 0.2,
    SplatTexture = 'scorch_004_albedo',
    ScorchSplatDropTime = 0.1,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 4.0 + (Random() * 1.0) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 4.0 + (Random() * 1.0)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

YenaothaExperimentalChargeLaserCollisionBeam = Class(HawkCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = EffectTemplate.SExperimentalPhasonLaserMuzzle01,
    FxBeamStartPointScale = 0.5,
    FxBeam = MCPEffectTemplate.SExperimentalChargePhasonLaserBeam,
    FxBeamEndPoint = EffectTemplate.SExperimentalPhasonLaserHitLand,
    FxBeamEndPointScale = 0.5,
}

SCCollisionBeam = Class(CollisionBeam) {
    FxImpactUnit = EffectTemplate.DefaultProjectileLandUnitImpact,
    FxImpactLand = {},#EffectTemplate.DefaultProjectileLandImpact,
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = EffectTemplate.DefaultProjectileUnderWaterImpact,
    FxImpactAirUnit = EffectTemplate.DefaultProjectileAirUnitImpact,
    FxImpactProp = {},
    FxImpactShield = {},    
    FxImpactNone = {},
}

SonicDisruptorWaveCBeam = Class(MCPCollisionBeam) {
	FxBeam = {},

    TerrainImpactType = 'LargeBeam02',
    
    FxBeamStartPoint = MCPEffectTemplate.SonicDisruptorWaveMuzzle,
    FxBeam = MCPEffectTemplate.SonicDisruptorWaveBeam01,
    FxBeamEndPoint = MCPEffectTemplate.SonicDisruptorWaveHit,
	
	FxBeamStartPointScale = 0.5,
	FxBeamEndPointScale = 0.5,
	TerrainImpactScale = 0.2,
	
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
}

CybranBeamWeapons = Class(SCCollisionBeam) {
    
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = {'/effects/emitters/microwave_laser_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,

    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.5 + (Random() * 1.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

CybranSSBeam = Class(CybranBeamWeapons) {
    TerrainImpactScale = 0.25,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/exss_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    FxBeamStartPointScale = 0.5,
    FxBeamEndPointScale = 0.5,
}

CybranAriesBeam01 = Class(CybranBeamWeapons) {
    TerrainImpactScale = 0.5,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/exaries_beam_01_emit.bp'},
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    FxBeamStartPointScale = 0.75,
    FxBeamEndPointScale = 0.75,
}

TMNovaCatBlueLaserBeam = Class(SCCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPointScale = 0.8,
    FxBeamStartPoint = EffectTemplate.SDFExperimentalPhasonProjMuzzleFlash,
    FxBeam = {'/mods/MCP/effects/emitters/novacat_bluelaser_emit.bp'},
    FxBeamEndPoint = MCPEffectTemplate.AeonNovaCatBlueLaserHit,
    FxBeamEndPointScale = 0.5,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
}

EXCEMPArrayBeam01CollisionBeam = Class(SCCollisionBeam) {
    FxBeam = {'/mods/MCP/effects/emitters/excemparraybeam01_emit.bp'},
    FxBeamEndPoint = {

    },
    FxBeamStartPoint = {

    },
    FxBeamStartPointScale = 0.05,
    FxBeamEndPointScale = 0.05,
    
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,
}

TMSpiderBeam = Class(SCCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.8,
    FxBeamStartPointScale = 1.4,
    FxBeamStartPoint = EffectTemplate.SDFExperimentalPhasonProjMuzzleFlash,
    FxBeam = {'/mods/MCP/effects/emitters/battlespider_laser_emit.bp'},
    FxBeamEndPoint = EffectTemplate.APhasonLaserImpact01,
    FxBeamEndPointScale = 2.0,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.4,
}

MicrowaveLaserCollisionBeam01 = Class( SCCollisionBeam ) {
    
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = { '/effects/emitters/microwave_laser_beam_01_emit.bp' },
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function( self, impactType, targetEntity )
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread( self.Scorching )
            self.Scorching = nil
        end
        CollisionBeam.OnImpact( self, impactType, targetEntity )
    end,

    OnDisable = function( self )
        CollisionBeam.OnDisable( self )
        KillThread( self.Scorching )
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 1.5 + ( Random() * 1.5 ) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + ( Random() * 1.5 )
            CurrentPosition = self:GetPosition( 1 )
        end
    end,
}

MicrowaveLaserCollisionBeam02 = Class( MicrowaveLaserCollisionBeam01 ) {
    TerrainImpactScale = 5,
    FxBeamStartPointScale = 5,
    FxBeamEndPointScale = 5,
    FxBeamScale = 5,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = { '/mods/MCP/effects/emitters/microwave_laser_beam_03_emit.bp' },
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,

}

MicrowaveLaserCollisionBeam03 = Class( MicrowaveLaserCollisionBeam01 ) {
    TerrainImpactScale = 0.1,
	FxBeamStartPointScale = 0.1,
	FxBeamEndPointScale = 0.1,
	FxBeamScale = 0.1,
    FxBeamStartPoint = EffectTemplate.CMicrowaveLaserMuzzle01,
    FxBeam = { '/Mods/MCP/effects/emitters/microwave_laser_beam_04_emit.bp' },
    FxBeamEndPoint = EffectTemplate.CMicrowaveLaserEndPoint01,
    
	OnImpact = function( self, impactType, targetEntity )
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread( self.Scorching )
            self.Scorching = nil
        end
        CollisionBeam.OnImpact( self, impactType, targetEntity )
    end,

    OnDisable = function( self )
        CollisionBeam.OnDisable( self )
        KillThread( self.Scorching )
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.1 + ( Random() * 0.1 ) 
        local CurrentPosition = self:GetPosition( 1 )
        local LastPosition = Vector( 0, 0, 0 )
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 0.1 + ( Random() * 0.1 )
            CurrentPosition = self:GetPosition( 1 )
        end
    end,
}

TractorClawCollisionBeam = Class( CollisionBeam ) {
    
    FxBeam = { EffectTemplate.ACollossusTractorBeam01 },
    FxBeamEndPoint = { EffectTemplate.ACollossusTractorBeamGlow02 },
    FxBeamEndPointScale = 1.0,
    FxBeamStartPoint = { EffectTemplate.ACollossusTractorBeamGlow01 },
}

TractorClawCollisionBeam02 = Class( CollisionBeam ) {
    
    FxBeam = { EffectTemplate.ACollossusTractorBeam01 },
    FxBeamEndPoint = { EffectTemplate.ACollossusTractorBeamGlow02 },
    FxBeamEndPointScale = 2.0,
    FxBeamStartPoint = { EffectTemplate.ACollossusTractorBeamGlow01 },
}

TMMizuraBlueLaserBeam = Class(SCCollisionBeam) {
    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 0.2,
    FxBeamStartPointScale = 1.2,
    FxBeamStartPoint = EffectTemplate.ASDisruptorCannonMuzzle01,
    FxBeam = {'/mods/MCP/effects/emitters/mizura_bluelaser_emit.bp'},
    FxBeamEndPoint = MCPEffectTemplate.AeonNovaCatBlueLaserHit,
    FxBeamEndPointScale = 0.07,
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,
}