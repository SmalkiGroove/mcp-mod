local Projectile = import('/lua/sim/projectile.lua').Projectile
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local EmitterProjectile = DefaultProjectileFile.EmitterProjectile
local OnWaterEntryEmitterProjectile = DefaultProjectileFile.OnWaterEntryEmitterProjectile
local SingleBeamProjectile = DefaultProjectileFile.SingleBeamProjectile
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local MultiPolyTrailProjectile = DefaultProjectileFile.MultiPolyTrailProjectile
local SingleCompositeEmitterProjectile = DefaultProjectileFile.SingleCompositeEmitterProjectile
local NullShell = DefaultProjectileFile.NullShell
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local util = import('/lua/utilities.lua')

-- Null Shell
EXNullShell = Class(Projectile) {}

-- PROJECTILE WITH ATTACHED EFFECT EMITTERS
EXEmitterProjectile = Class(Projectile) {
    FxTrails = {'/effects/emitters/missile_munition_trail_01_emit.bp',},
    FxTrailScale = 1,
    FxTrailOffset = 0,

    OnCreate = function(self)
        Projectile.OnCreate(self)
        local army = self:GetArmy()
        for i in self.FxTrails do
            CreateEmitterOnEntity(self, army, self.FxTrails[i]):ScaleEmitter(self.FxTrailScale):OffsetEmitter(0, 0, self.FxTrailOffset)
        end
    end,
}

-- BEAM PROJECTILES
EXSingleBeamProjectile = Class(EXEmitterProjectile) {
    BeamName = '/effects/emitters/default_beam_01_emit.bp',
    FxTrails = {},

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        if self.BeamName then
            CreateBeamEmitterOnEntity( self, -1, self:GetArmy(), self.BeamName )
        end
    end,
}

EXMultiBeamProjectile = Class(EXEmitterProjectile) {
    Beams = {'/effects/emitters/default_beam_01_emit.bp',},
    FxTrails = {},

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        local beam = nil
        local army = self:GetArmy()
        for k, v in self.Beams do
            CreateBeamEmitterOnEntity( self, -1, army, v )
        end
    end,
}

-- POLY-TRAIL PROJECTILES
EXSinglePolyTrailProjectile = Class(EXEmitterProjectile) {
    PolyTrail = '/effects/emitters/test_missile_trail_emit.bp',
    PolyTrailOffset = 0,
    FxTrails = {},

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        if self.PolyTrail ~= '' then
            CreateTrail(self, -1, self:GetArmy(), self.PolyTrail):OffsetEmitter(0, 0, self.PolyTrailOffset)
        end
    end,
}

EXMultiPolyTrailProjectile = Class(EXEmitterProjectile) {
    PolyTrailOffset = {0},
    FxTrails = {},
    RandomPolyTrails = 0, -- Count of how many are selected randomly for PolyTrail table

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        if self.PolyTrails then
            local NumPolyTrails = table.getn( self.PolyTrails )
            local army = self:GetArmy()

            if self.RandomPolyTrails ~= 0 then
                local index = nil
                for i = 1, self.RandomPolyTrails do
                    index = math.floor( Random( 1, NumPolyTrails))
                    CreateTrail(self, -1, army, self.PolyTrails[index] ):OffsetEmitter(0, 0, self.PolyTrailOffset[index])
                end
            else
                for i = 1, NumPolyTrails do
                    CreateTrail(self, -1, army, self.PolyTrails[i] ):OffsetEmitter(0, 0, self.PolyTrailOffset[i])
                end
            end
        end
    end,
}

-- COMPOSITE EMITTER PROJECTILES - MULTIPURPOSE PROJECTILES
-- THAT COMBINES BEAMS, POLYTRAILS, AND NORMAL EMITTERS

-- LIGHTWEIGHT VERSION THAT LIMITS USE TO 1 BEAM, 1 POLYTRAIL, AND STANDARD EMITTERS
EXSingleCompositeEmitterProjectile = Class(EXSinglePolyTrailProjectile) {
    BeamName = '/effects/emitters/default_beam_01_emit.bp',
    FxTrails = {},

    OnCreate = function(self)
        SinglePolyTrailProjectile.OnCreate(self)
        if self.BeamName ~= '' then
            CreateBeamEmitterOnEntity( self, -1, self:GetArmy(), self.BeamName )
        end
    end,
}

-- HEAVYWEIGHT VERSION, ALLOWS FOR MULTIPLE BEAMS, POLYTRAILS, AND STANDARD EMITTERS
EXMultiCompositeEmitterProjectile = Class(EXMultiPolyTrailProjectile) {
    Beams = {'/effects/emitters/default_beam_01_emit.bp',},
    PolyTrailOffset = {0},
    RandomPolyTrails = 0, -- Count of how many are selected randomly for PolyTrail table
    FxTrails = {},

    OnCreate = function(self)
        MultiPolyTrailProjectile.OnCreate(self)
        local beam = nil
        local army = self:GetArmy()
        for k, v in self.Beams do
            CreateBeamEmitterOnEntity( self, -1, army, v )
        end
    end,
}

RailGun01Projectile = Class(MultiPolyTrailProjectile) {
    FxImpactWater = MCPEffectTemplate.RailGunCannonHit,
    FxImpactLand = MCPEffectTemplate.RailGunCannonHit,
    FxImpactNone = MCPEffectTemplate.RailGunCannonHit,
    FxImpactProp = MCPEffectTemplate.RailGunCannonUnitHit,    
    FxImpactUnit = MCPEffectTemplate.RailGunCannonUnitHit,   
    
    FxTrails = MCPEffectTemplate.RailGunFxTrails,
    PolyTrails = MCPEffectTemplate.RailGunPolyTrails,
    FxImpactProjectile = {},
    FxImpactUnderWater = {},
}

MiniRocketPRojectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactUnderWater = {},

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,

    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale ~= 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
}

MiniRocket03PRojectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -0.25,

    BeamName = '/mods/MCP/effects/emitters/missile_munition_exhaust_beam_02_emit.bp',

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactUnderWater = {},

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,

    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale ~= 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
}

MiniRocket04PRojectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    BeamName = '/mods/MCP/effects/emitters/missile_munition_exhaust_beam_03_emit.bp',

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,

    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale ~= 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
}

MiniRocket02Projectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = 0,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',

    -- Hit Effects
    FxImpactUnit = EffectTemplate.CMissileLOAHit01,
    FxImpactLand = EffectTemplate.CMissileLOAHit01,
    FxImpactProp = EffectTemplate.CMissileLOAHit01,
    FxImpactNone = EffectTemplate.CMissileLOAHit01,
    FxImpactUnderWater = {},
    
    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale ~= 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
    
    OnExitWater = function(self)
        EmitterProjectile.OnExitWater(self)
        local army = self:GetArmy()
        for k, v in self.FxExitWaterEmitter do
            CreateEmitterAtBone(self,-2,army,v)
        end
    end,
}

-- SeaDragon Projectiles
SeaDragonShell = Class(SinglePolyTrailProjectile) {

    PolyTrail = '/effects/emitters/default_polytrail_01_emit.bp',

    -- Hit Effects
    FxImpactUnit = EffectTemplate.CMolecularResonanceHitUnit01,
    FxUnitHitScale = 2,
    FxImpactProp = EffectTemplate.CMolecularResonanceHitUnit01,
    FxPropHitScale = 2,    
    FxImpactLand = EffectTemplate.CMolecularResonanceHitUnit01,
    FxLandHitScale = 2,
    FxImpactUnderWater = {},
    DestroyOnImpact = false,

    OnCreate = function(self)
        SinglePolyTrailProjectile.OnCreate(self)
        self.Impacted = false
    end,

    DelayedDestroyThread = function(self)
        WaitSeconds( 0.3 )
        self.CreateImpactEffects( self, self:GetArmy(), self.FxImpactUnit, self.FxUnitHitScale )
        self:Destroy()
    end,

    OnImpact = function(self, TargetType, TargetEntity)
        if self.Impacted == false then
            self.Impacted = true
            if TargetType == 'Terrain' then
                SinglePolyTrailProjectile.OnImpact(self, TargetType, TargetEntity)
                self:ForkThread( self.DelayedDestroyThread )
            else
                SinglePolyTrailProjectile.OnImpact(self, TargetType, TargetEntity)
                self:Destroy()
            end
        end
    end,
}

XCannonProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.XCannonPolyTrail,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.XCannonFXTrail01,

    FxImpactUnit = EffectTemplate.CMobileKamikazeBombExplosion,
    FxImpactProp = EffectTemplate.CMobileKamikazeBombExplosion,
    FxImpactLand = EffectTemplate.CMobileKamikazeBombExplosion,
    FxImpactUnderWater = EffectTemplate.CHvyProtonCannonHit01,
    FxImpactWater = EffectTemplate.CHvyProtonCannonHit01,
    FxTrailOffset = 0,
    FxLandHitScale = 0.8,
    FxPropHitScale = 0.8,
    FxUnitHitScale = 0.8,
    FxUnderWaterHitScale = 0.8,
    FxWaterHitScale = 0.8,
}

-- Bismark Projectiles
ZCannon01Projectile = Class(MultiPolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    PolyTrails = MCPEffectTemplate.ZCannonPolytrail01,
    PolyTrailOffset = {0,0,0},
    FxTrails = MCPEffectTemplate.ZCannonFxtrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.ZCannonHit01,
    FxImpactProp = MCPEffectTemplate.ZCannonHit01,
    FxImpactLand = MCPEffectTemplate.ZCannonHit01,
    FxImpactWater = MCPEffectTemplate.ZCannonHit01,
    FxLandHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxUnitHitScale = 1.5,
    FxImpactUnderWater = {},
    FxSplatScale = 9,

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        if targetType == 'Terrain' then
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_001_normals', '', 'Alpha Normals', self.FxSplatScale, self.FxSplatScale, 150, 50, army )
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_002_albedo', '', 'Albedo', self.FxSplatScale * 2, self.FxSplatScale * 2, 150, 50, army )
            self:ShakeCamera(20, 1, 0, 1)
        end
        local pos = self:GetPosition()
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

--  Cybran Dumb MISSILE PROJECTILES
DumbRocketProjectile = Class(SingleBeamProjectile) {
    FxTrails = {'/effects/emitters/missile_cruise_munition_trail_01_emit.bp',},
    BeamName = '/effects/emitters/missile_exhaust_fire_beam_01_emit.bp',
    FxImpactUnit = EffectTemplate.CCorsairMissileUnitHit01,
    FxImpactProp = EffectTemplate.CCorsairMissileHit01,
    FxImpactLand = EffectTemplate.CCorsairMissileLandHit01,
    FxLandHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxUnitHitScale = 1.5,
    FxImpactUnderWater = {},
}

DumbRocketProjectile02 = Class(EmitterProjectile) {
    FxTrails = {'/effects/emitters/mortar_munition_01_emit.bp',},
    FxImpactUnit = EffectTemplate.CCorsairMissileUnitHit01,
    FxImpactProp = EffectTemplate.CCorsairMissileHit01,
    FxImpactLand = EffectTemplate.CCorsairMissileLandHit01,
    FxLandHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxUnitHitScale = 1.5,
    FxImpactUnderWater = {},
}

-- Scorp Laser
ScorpPulseLaser = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        EffectTemplate.CHvyProtonCannonPolyTrail,
        '/effects/emitters/electron_bolter_trail_01_emit.bp',
    },
    PolyTrailScale = 0.5,
    PolyTrailOffset = {0,0}, 

    FxImpactUnit = EffectTemplate.CHvyProtonCannonHitUnit,
    FxUnitHitScale = 0.5,
    FxImpactProp = EffectTemplate.CHvyProtonCannonHitUnit,
    FxPropHitScale = 0.5,
    FxImpactLand = EffectTemplate.CHvyProtonCannonHitLand,
    FxLandHitScale = 0.5,
    FxImpactUnderWater = EffectTemplate.CHvyProtonCannonHit01,
    FxUnderWarerHitScale = 0.5,
    FxImpactWater = EffectTemplate.CHvyProtonCannonHit01,
    FxWaterHitScale = 0.5,
    FxTrailOffset = 0,
}

--  AEON MIRV MISSILE PROJECTILES
MIRVChild01Projectile = Class(SingleCompositeEmitterProjectile) {
    PolyTrail = '/effects/emitters/serpentine_missile_trail_emit.bp',
    BeamName = '/effects/emitters/serpentine_missle_exhaust_beam_01_emit.bp',
    PolyTrailOffset = -0.05,

    FxImpactUnit = MCPEffectTemplate.Aeon_MirvHit,
    FxImpactProp = MCPEffectTemplate.Aeon_MirvHit,
    FxImpactLand = MCPEffectTemplate.Aeon_MirvHit,
    FxLandHitScale = 1,
    FxPropHitScale = 1,
    FxUnitHitScale = 1,
    FxImpactUnderWater = {},
}

-- Aira Projectiles
SonicWaveProjectile = Class(MultiPolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    PolyTrails = MCPEffectTemplate.WaveCannonPolytrail01,
    PolyTrailOffset = {0,0,0},
    FxTrails = MCPEffectTemplate.WaveCannonFxtrail01,

    -- Hit Effects
    FxImpactUnit = EffectTemplate.AGravitonBolterHit01,
    FxImpactProp = EffectTemplate.AGravitonBolterHit01,
    FxImpactLand = EffectTemplate.AGravitonBolterHit01,
    FxLandHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxUnitHitScale = 1.5,
    FxImpactUnderWater = {},
}

-- Seraphim Lambda Projectiles
EyeBlast01Projectile = Class(EmitterProjectile) {
    FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.SDFExperimentalPhasonProjFXTrails01,
    FxImpactUnit = MCPEffectTemplate.SDFExperimentalPhasonProjHitUnit,
    FxImpactProp = MCPEffectTemplate.SDFExperimentalPhasonProjHit01,
    FxImpactShield = MCPEffectTemplate.SDFExperimentalPhasonProjHit01,
    FxImpactLand = MCPEffectTemplate.SDFExperimentalPhasonProjHit01,
    FxImpactWater = MCPEffectTemplate.SDFExperimentalPhasonProjHit01,
}

-- Seraphim LPD Projectiles
SeraHeavyLightningCannonChildProjectile = Class(EmitterProjectile) {
    FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.SDFExperimentalPhasonProjFXTrails01,
    FxImpactLand = EffectTemplate.SHeavyQuarnonCannonLandHit,
    FxImpactNone = EffectTemplate.SHeavyQuarnonCannonHit,
    FxImpactProp = EffectTemplate.SHeavyQuarnonCannonHit,    
    FxImpactUnit = EffectTemplate.SHeavyQuarnonCannonUnitHit,
    FxOnKilled = EffectTemplate.SHeavyQuarnonCannonUnitHit,
}

-- CYBRAN SUB LAUNCHED TORPEDO
AssaultTorpedoSubProjectile = Class(EmitterProjectile) {
    FxTrails = {'/effects/emitters/torpedo_underwater_wake_02_emit.bp',},

    -- Hit Effects
    FxImpactUnit = EffectTemplate.CTorpedoUnitHit01,
    FxImpactProp = EffectTemplate.CTorpedoUnitHit01,
    FxImpactUnderWater = EffectTemplate.CTorpedoUnitHit01,    
    FxImpactLand = EffectTemplate.CTorpedoUnitHit01,
    FxLandHitScale = 4,
    FxPropHitScale = 4,
    FxUnitHitScale = 4,
    FxNoneHitScale = 4,
    FxImpactNone = {},
}

ShadowCannonProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        '/mods/MCP/effects/emitters/shadowcannon_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.ShadowCannonFXTrail01,
    FxTrailScale = 0.5,
    FxImpactUnit = MCPEffectTemplate.MGQAICannonHitUnit,
    FxImpactProp = MCPEffectTemplate.MGQAICannonHitUnit,
    FxImpactLand = MCPEffectTemplate.MGQAICannonHitUnit,
    FxImpactUnderWater = MCPEffectTemplate.MGQAICannonHitUnit,
    FxImpactWater = MCPEffectTemplate.MGQAICannonHitUnit,
    FxLandHitScale = 0.7,
    FxPropHitScale = 0.7,
    FxUnitHitScale = 0.7,
    FxNoneHitScale = 0.7,
    FxTrailOffset = 0,
}

HellFireMissileProjectile = Class(SingleCompositeEmitterProjectile) {
    FxTrails = {'/effects/emitters/missile_cruise_munition_trail_01_emit.bp',},
    FxTrailScale = 0.25,  
    BeamName = '/effects/emitters/missile_exhaust_fire_beam_01_emit.bp',
    FxImpactUnit = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactProp = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactLand = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxImpactUnderWater = {},
}

ACUShadowCannonProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        '/effects/emitters/electron_bolter_trail_01_emit.bp',
        '/mods/MCP/effects/emitters/shadowcannon_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.ShadowCannonFXTrail01,
    FxImpactUnit = MCPEffectTemplate.ACUShadowCannonHit01,
    FxImpactProp = MCPEffectTemplate.ACUShadowCannonHit01,
    FxImpactLand = MCPEffectTemplate.ACUShadowCannonHit01,
    FxImpactUnderWater = MCPEffectTemplate.ACUShadowCannonHit01,
    FxImpactWater = MCPEffectTemplate.ACUShadowCannonHit01,
    FxLandHitScale = 0.7,
    FxPropHitScale = 0.7,
    FxUnitHitScale = 0.7,
    FxNoneHitScale = 0.7,
    FxTrailOffset = 0,
}

-- TERRAN Heavy GAUSS CANNON PROJECTILES
HawkGaussCannonProjectile = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

-- AEON ARTILLERY PROJECTILES
WraithProjectile = Class(SinglePolyTrailProjectile) {
    FxImpactLand = MCPEffectTemplate.WraithCannonHit01,
    FxImpactNone = MCPEffectTemplate.WraithCannonHit01,
    FxImpactProp = MCPEffectTemplate.WraithCannonHit01,    
    FxImpactUnit = MCPEffectTemplate.WraithCannonHit01,    
    FxImpactUnderWater = {},
    FxImpactProjectile = {},
    FxLandHitScale = 0.7,
    FxPropHitScale = 0.7,
    FxUnitHitScale = 0.7,
    FxNoneHitScale = 0.7,
    PolyTrail = MCPEffectTemplate.WraithPolytrail01,
    FxTrails = MCPEffectTemplate.WraithMunition01,
}

-- Fire test
Juggfire01 = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.HGaussCannonPolyTrail,
    FxTrails = {
        '/mods/MCP/effects/emitters/Juggfire01_emit.bp',
        '/effects/emitters/napalm_hvy_thin_smoke_emit.bp',
    },
    PolyTrailOffset = {0,0,0},    

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactProp = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactLand = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactWater = MCPEffectTemplate.FlameThrowerHitWater01,
    FxLandHitScale = 0.5,
    FxPropHitScale = 0.5,
    FxUnitHitScale = 0.5,
    FxImpactUnderWater = {},
    FxTrailOffset = 0,
}

-- Flamethrower Projectile
NapalmProjectile01 = Class(EmitterProjectile) {
    FxTrails = {'/mods/MCP/Effects/Emitters/NapalmTrailFX.bp',},
    
    FxImpactTrajectoryAligned = false,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactProp = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactLand = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactWater = MCPEffectTemplate.FlameThrowerHitWater01,
    FxImpactUnderWater = {},
}
NapalmProjectile02 = Class(EmitterProjectile) {
    FxTrails = {'/mods/MCP/Effects/Emitters/NapalmTrailFX.bp',},
       FxTrailScale = 0.5,
    
    FxImpactTrajectoryAligned = false,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactProp = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactLand = MCPEffectTemplate.FlameThrowerHitLand01,
    FxImpactWater = MCPEffectTemplate.FlameThrowerHitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 0.5,
    FxPropHitScale = 0.5,
    FxUnitHitScale = 0.5,
    FxNoneHitScale = 0.5,
}

-- AEON ABOVE WATER LAUNCHED TORPEDO
AMTorpedoShipProjectile = Class(OnWaterEntryEmitterProjectile) {
    FxInitial = {},
    FxTrails = {'/effects/emitters/torpedo_munition_trail_01_emit.bp',},
    FxTrailScale = 1,
    TrailDelay = 0,
    TrackTime = 0,

    FxUnitHitScale = 1.25,
    FxImpactLand = {},
    FxImpactUnit = EffectTemplate.ATorpedoUnitHit01,
    FxImpactProp = EffectTemplate.ATorpedoUnitHit01,
    FxImpactUnderWater = EffectTemplate.DefaultProjectileUnderWaterImpact,
    FxImpactProjectile = EffectTemplate.ATorpedoUnitHit01,
    FxImpactProjectileUnderWater = EffectTemplate.DefaultProjectileUnderWaterImpact,
    FxKilled = EffectTemplate.ATorpedoUnitHit01,
    FxImpactNone = {},

    OnCreate = function(self,inWater)
        OnWaterEntryEmitterProjectile.OnCreate(self,inWater)
        -- If we are starting in the water then immediately switch to tracking in water
        if inWater == true then
            self:TrackTarget(true):StayUnderwater(false)
            self:OnEnterWater(self)
        else
            self:TrackTarget(true)
        end
    end, 
}

AMTorpedoCluster = Class(SingleCompositeEmitterProjectile) {
    FxInitial = {},
    PolyTrail = '/effects/emitters/serpentine_missile_trail_emit.bp',
    BeamName = '/effects/emitters/serpentine_missle_exhaust_beam_01_emit.bp',
    FxTrailScale = 1,
    TrailDelay = 0,
    TrackTime = 0,

    FxUnitHitScale = 1.25,
    FxImpactLand = {},
    FxImpactUnit = EffectTemplate.ATorpedoUnitHit01,
    FxImpactProp = EffectTemplate.ATorpedoUnitHit01,
    FxImpactUnderWater = EffectTemplate.ATorpedoUnitHitUnderWater01,
    FxImpactProjectile = EffectTemplate.ATorpedoUnitHit01,
    FxImpactProjectileUnderWater = EffectTemplate.ATorpedoUnitHitUnderWater01,
    FxKilled = EffectTemplate.ATorpedoUnitHit01,
    FxImpactNone = {},
    
     OnCreate = function(self,inWater)
        SingleCompositeEmitterProjectile.OnCreate(self,inWater)
        -- If we are starting in the water then immediately switch to tracking in water
        if inWater == true then
            self:TrackTarget(true):StayUnderwater(false)
            self:OnEnterWater(self)
        else
            self:TrackTarget(true)
        end
    end, 
}

-- AEON GUIDED AA PROJECTILES
GoldAAProjectile = Class(SinglePolyTrailProjectile) {
    FxTrails =  MCPEffectTemplate.GoldAAFxTrails,
    PolyTrail = MCPEffectTemplate.GoldAAPolyTrail,

    FxImpactUnit = EffectTemplate.AMercyGuidedMissileSplitMissileHitUnit,
    FxImpactAirUnit = EffectTemplate.AMercyGuidedMissileSplitMissileHitUnit,
    FxImpactProp = EffectTemplate.AMercyGuidedMissileSplitMissileHit,
    FxImpactNone = EffectTemplate.AMercyGuidedMissileSplitMissileHit,
    FxImpactLand = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
    FxImpactUnderWater = {},
}

-- SERAPHIM TAU CANNON
ShieldTauCannonProjectile = Class(MultiPolyTrailProjectile) {
    FxImpactLand = EffectTemplate.STauCannonHit,
    FxImpactNone = EffectTemplate.STauCannonHit,
    FxImpactProp = EffectTemplate.STauCannonHit,    
    FxImpactUnit = EffectTemplate.STauCannonHit,
    FxImpactShield = EffectTemplate.ADisruptorHitShield,
    FxTrails = EffectTemplate.STauCannonProjectileTrails,
    PolyTrailOffset = {0,0},    
    PolyTrails = EffectTemplate.STauCannonProjectilePolyTrails,
}

SOmegaCannonOverCharge = Class(MultiPolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    FxImpactLand = MCPEffectTemplate.OmegaOverChargeLandHit,
    FxImpactNone = MCPEffectTemplate.OmegaOverChargeLandHit,
    FxImpactProp = MCPEffectTemplate.OmegaOverChargeLandHit,    
    FxImpactUnit = MCPEffectTemplate.OmegaOverChargeUnitHit,
    FxLandHitScale = 4,
    FxPropHitScale = 4,
    FxUnitHitScale = 4,
    FxNoneHitScale = 4,
    FxTrails = MCPEffectTemplate.OmegaOverChargeProjectileFxTrails,
    PolyTrails = MCPEffectTemplate.OmegaOverChargeProjectileTrails,
    PolyTrailOffset = {0,0,0},
}

-- SERAPHIM LAANSE TACTICAL MISSILE
SLaanseTacticalMissile = Class(SinglePolyTrailProjectile) {
    FxImpactLand = EffectTemplate.SLaanseMissleHit,
    FxImpactProp = EffectTemplate.SLaanseMissleHitUnit,
    FxImpactUnderWater = {},
    FxImpactUnit = EffectTemplate.SLaanseMissleHitUnit,    
    FxTrails = EffectTemplate.SLaanseMissleExhaust02,
    PolyTrail = EffectTemplate.SLaanseMissleExhaust01,
}

-- MGAI PROJECTILES
MGHeadshotProjectile = Class(MultiPolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    PolyTrails = MCPEffectTemplate.MGHeadshotPolytrail01,
    PolyTrailOffset = {0,0,0},
    FxTrails = MCPEffectTemplate.MGHeadshotFxtrail01,

    -- Hit Effects
    FxImpactLand = MCPEffectTemplate.MGHeadshotHit01,
    FxImpactNone = MCPEffectTemplate.MGHeadshotHit01,
    FxImpactProp = MCPEffectTemplate.MGHeadshotHit01,    
    FxImpactUnit = MCPEffectTemplate.MGHeadshotHit01,
    FxLandHitScale = 1.5,
    FxPropHitScale = 1.5,
    FxUnitHitScale = 1.5,
    FxImpactUnderWater = {},
}

MGQAIRocketProjectile = Class(SingleBeamProjectile) {
    BeamName = '/effects/emitters/missile_loa_munition_exhaust_beam_01_emit.bp',
    FxTrails = {'/effects/emitters/missile_cruise_munition_trail_01_emit.bp',},
    PolyTrailOffset = -0.05,

    FxImpactUnit = MCPEffectTemplate.MissileUnitHit01,
    FxImpactProp = MCPEffectTemplate.MissileLandHit01,
    FxImpactLand = MCPEffectTemplate.MissileLandHit01,
    FxLandHitScale = 0.65,
    FxPropHitScale = 0.65,
    FxUnitHitScale = 0.65,
    FxNoneHitScale = 0.65,
    FxImpactUnderWater = {},
}

MGQAIRocketChildProjectile = Class(SingleCompositeEmitterProjectile) {
    PolyTrail = '/mods/MCP/effects/emitters/mgqai_missile_trail_emit.bp',
    BeamName = '/mods/MCP/effects/emitters/mgqai_missle_exhaust_beam_01_emit.bp',
    PolyTrailOffset = -0.05,

    FxImpactUnit = MCPEffectTemplate.MissileUnitHit01,
    FxImpactProp = MCPEffectTemplate.MissileLandHit01,
    FxImpactLand = MCPEffectTemplate.MissileLandHit01,
    FxLandHitScale = 0.65,
    FxPropHitScale = 0.65,
    FxUnitHitScale = 0.65,
    FxNoneHitScale = 0.65,
    FxImpactUnderWater = {},
}

MGQAIPlasmaArtyChildProjectile = Class(EmitterProjectile) {
    FxTrails = MCPEffectTemplate.MGQAIPlasmaArtyChildFxtrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.MGQAIPlasmaArtyHitLand01,
    FxImpactProp = MCPEffectTemplate.MGQAIPlasmaArtyHitLand01,
    FxImpactLand = MCPEffectTemplate.MGQAIPlasmaArtyHitLand01,
    FxImpactUnderWater = MCPEffectTemplate.MGQAIPlasmaArtyHitLand01,
    FxImpactWater = MCPEffectTemplate.MGQAIPlasmaArtyHitLand01,
    FxImpactUnderWater = {},
    OnCreate = function(self, TargetType, TargetEntity)
    local projectile = self
        
        SetDamageThread = ForkThread(function(self)
            projectile.DamageData = {
                DamageRadius = 3,
                DamageAmount = 20,
                DoTPulses = 15,
                DoTTime = 4.5,
                DamageType = 'Normal',
                DamageFriendly = true,
                MetaImpactAmount = nil,
                MetaImpactRadius = nil,
            }
            KillThread(self)
        end)
        EmitterProjectile.OnCreate(self, TargetType, TargetEntity)
    end,

}

MGQAIPlasmaArtyProjectile = Class(EmitterProjectile) {
    FxTrails = MCPEffectTemplate.MGQAIPlasmaArtyFxtrail01,

    -- Hit Effects
    FxImpactUnit = {},
    FxImpactLand = {},
    FxImpactUnderWater = {},
    ChildProjectile = '/mods/MCP/projectiles/MGQAIPlasmaArtyChild01/MGQAIPlasmaArtyChild01_proj.bp',

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        self.Impacted = false
    end,

    DoDamage = function(self, instigator, damageData, targetEntity)
        EmitterProjectile.DoDamage(self, instigator, damageData, targetEntity)
    end,

    OnImpact = function(self, TargetType, TargetEntity)
        if self.Impacted == false and TargetType ~= 'Air' then
            self.Impacted = true
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(0,Random(1,5),Random(1.5,5))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(Random(1,4),Random(1,5),Random(1,2))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(0,Random(1,5),-Random(1.5,5))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(Random(1.5,5),Random(1,5),0)
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(1,4),Random(1,5),-Random(1,2))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(1.5,4.5),Random(1,5),0)
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(1,4),Random(1,5),Random(2,4))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(1,2),Random(1,7),-Random(1,3))
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(2.5,3.5),Random(2,6),0)
            self:CreateChildProjectile(self.ChildProjectile):SetVelocity(-Random(2,3),Random(2,3),Random(3,5))
            EmitterProjectile.OnImpact(self, TargetType, TargetEntity)
        end
    end,
    
    -- Overriding Destruction
    OnImpactDestroy = function( self, TargetType, TargetEntity)
        self:ForkThread( self.DelayedDestroyThread )
    end,

    DelayedDestroyThread = function(self)
        WaitSeconds( 0.5 )
        self:Destroy()
    end,
}

MGQAILaserHeavyProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        '/effects/emitters/electron_bolter_trail_01_emit.bp',
        '/effects/emitters/default_polytrail_03_emit.bp',
    },
    PolyTrailOffset = {0,0}, 
    FxTrails = {'/effects/emitters/electron_bolter_munition_01_emit.bp',},
    
    -- Hit Effects
    FxImpactUnit = EffectTemplate.CLaserHitUnit01,
    FxImpactProp = EffectTemplate.CLaserHitUnit01,
    FxImpactLand = EffectTemplate.CLaserHitLand01,
    FxImpactUnderWater = {},
}

RedTurbolaser2Projectile = Class(MultiPolyTrailProjectile) {
    FxTrails = {'/effects/emitters/electron_bolter_munition_01_emit.bp',},
    PolyTrails = MCPEffectTemplate.RedTurboLaser02,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.MGQAICannonHitUnit,
    FxUnitHitScale = 0.7,
    FxImpactProp = MCPEffectTemplate.MGQAICannonHitUnit,
    FxPropHitScale = 0.7,
    FxImpactAirUnit = MCPEffectTemplate.MGQAICannonHitUnit,
    FxAirUnitHitScale = 0.7,
    FxImpactLand = MCPEffectTemplate.MGQAICannonHitUnit,
    FxLandHitScale = 0.7,  
    FxImpactUnderWater = {},
}

-- AEON RAIDER CANNON PROJECTILES
RaiderCannonProjectile = Class(SinglePolyTrailProjectile) {
    FxTrails = {
        '/effects/emitters/reacton_cannon_fxtrail_01_emit.bp',
        '/effects/emitters/reacton_cannon_fxtrail_02_emit.bp',
        '/effects/emitters/reacton_cannon_fxtrail_03_emit.bp',
        '/mods/MCP/effects/emitters/raider_cannon_01_emit.bp',
        '/mods/MCP/effects/emitters/raider_cannon_02_emit.bp',
    },
    PolyTrail = '/effects/emitters/aeon_commander_overcharge_trail_01_emit.bp',

    FxImpactUnit = EffectTemplate.AReactonCannonHitUnit01,
    FxImpactProp = EffectTemplate.AReactonCannonHitUnit01,
    FxImpactLand = EffectTemplate.AReactonCannonHitLand01,
}

TAAHeavyFragmentationProjectile = Class(SingleCompositeEmitterProjectile) {
    BeamName = '/effects/emitters/antiair_munition_beam_01_emit.bp',
    PolyTrail = '/effects/emitters/default_polytrail_01_emit.bp',
    PolyTrailOffset = 0,
    FxTrails = {'/effects/emitters/terran_flack_fxtrail_01_emit.bp'},
    FxImpactAirUnit = MCPEffectTemplate.THeavyFragmentationShell01,
    FxImpactNone = MCPEffectTemplate.THeavyFragmentationShell01,
    FxImpactUnderWater = {},
    FxAirHitScale = 1.5,
    FxNoneHitScale = 1.5,
}

-- UEF ACU Antimatter Cannon
UEFACUAntiMatterProjectile01 = Class(EXMultiCompositeEmitterProjectile ) {
    PolyTrails = MCPEffectTemplate.ZCannonPolytrail02,
    PolyTrailOffset = {0,0,0},
    FxTrails = MCPEffectTemplate.ZCannonFxtrail02,
    
    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.ACUAntiMatter01,
    FxImpactProp = MCPEffectTemplate.ACUAntiMatter01,
    FxImpactLand = MCPEffectTemplate.ACUAntiMatter01,
    FxImpactWater = MCPEffectTemplate.ACUAntiMatter01,
    FxImpactUnderWater = {},
    FxSplatScale = 8,

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        if targetType == 'Terrain' then
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0.0,6.28), 'nuke_scorch_001_normals', '', 'Alpha Normals', self.FxSplatScale, self.FxSplatScale, 150, 30, army )
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0.0,6.28), 'nuke_scorch_002_albedo', '', 'Albedo', self.FxSplatScale * 2, self.FxSplatScale * 2, 150, 30, army )
            self:ShakeCamera(20, 1, 0, 1)
        end
        local pos = self:GetPosition()
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

-- AEON Disk TMD Projectile
DiskTMD01 = Class(SinglePolyTrailProjectile) {
    FxTrails = {
        '/effects/emitters/quantum_cannon_munition_03_emit.bp',
        '/effects/emitters/quantum_cannon_munition_04_emit.bp',
    },
    PolyTrail = '/effects/emitters/quantum_cannon_polytrail_01_emit.bp',

    -- Hit Effects
    FxImpactLand = EffectTemplate.ATemporalFizzHit01,
    FxImpactNone= EffectTemplate.ATemporalFizzHit01,
    FxImpactProjectile = EffectTemplate.ATemporalFizzHit01,
    FxImpactProp = EffectTemplate.ATemporalFizzHit01,    
    FxImpactUnit = EffectTemplate.ATemporalFizzHit01,
    FxImpactUnderWater = {},
}

NovaStunProjectile = Class(NullShell) {
    FxImpactTrajectoryAligned = false,
    PolyTrails = MCPEffectTemplate.MGHeadshotPolytrail01,
    PolyTrailOffset = {0,0,0},
    FxTrails = MCPEffectTemplate.MGHeadshotFxtrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.NovaCannonHitUnit,
    FxImpactProp = MCPEffectTemplate.NovaCannonHitUnit,
    FxImpactLand = MCPEffectTemplate.NovaCannonHitUnit,
    FxImpactUnderWater = MCPEffectTemplate.NovaCannonHitUnit,
    FxImpactWater = MCPEffectTemplate.NovaCannonHitUnit,
    FxImpactUnderWater = {},
    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        local blanketSides = 12
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 2

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
            self:CreateProjectile('/effects/entities/EffectProtonAmbient01/EffectProtonAmbient01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end

        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

-- Cybran Hailfire Projectiles
CybranHailfire01ChildProjectile = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/default_polytrail_05_emit.bp',
    FxTrails = MCPEffectTemplate.CybranHailfire02FXTrails,
    FxTrailOffset = -0.3,
    FxTrailScale = 0.005,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.CybranHailfire01HitUnit01,
    FxImpactProp = MCPEffectTemplate.CybranHailfire01HitUnit01,    
    FxImpactLand = MCPEffectTemplate.CybranHailfire01HitLand01,
    FxImpactWater = MCPEffectTemplate.CybranHailfire01HitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 2,
    FxUnitHitScale = 2,
    FxPropHitScale = 2,
    FxWaterHitScale = 2,
}

CybranHailfire02Projectile = Class(SinglePolyTrailProjectile) {
    FxTrails = MCPEffectTemplate.CybranHailfire01FXTrails,
    FxTrailOffset = -0.3,
    FxTrailScale = 0.05,
    FxImpactTrajectoryAligned = false,

    PolyTrail = EffectTemplate.CNanoDartPolyTrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.CybranHailfire01HitUnit01,
    FxImpactProp = MCPEffectTemplate.CybranHailfire01HitUnit01,    
    FxImpactLand = MCPEffectTemplate.CybranHailfire01HitLand01,
    FxImpactWater = MCPEffectTemplate.CybranHailfire01HitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 2,
    FxUnitHitScale = 2,
    FxPropHitScale = 2,
    FxWaterHitScale = 2,
}

CybranHailfire04Projectile = Class(SinglePolyTrailProjectile) {
    FxTrails = MCPEffectTemplate.CybranHailfire03FXTrails,
    FxTrailOffset = -0.3,
    FxTrailScale = 0.05,
    FxImpactTrajectoryAligned = false,

    PolyTrail = EffectTemplate.CNanoDartPolyTrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.CybranHailfire01HitUnit01,
    FxImpactProp = MCPEffectTemplate.CybranHailfire01HitUnit01,    
    FxImpactLand = MCPEffectTemplate.CybranHailfire01HitLand01,
    FxImpactWater = MCPEffectTemplate.CybranHailfire01HitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 2,
    FxUnitHitScale = 2,
    FxPropHitScale = 2,
    FxWaterHitScale = 2,
}

CybranHailfire03Projectile = Class(SinglePolyTrailProjectile) {
    FxTrails = MCPEffectTemplate.CybranHailfire01FXTrails,
    FxTrailOffset = -0.3,
    FxTrailScale = 0.05,
    FxImpactTrajectoryAligned = false,

    PolyTrail = EffectTemplate.CNanoDartPolyTrail01,

    -- Hit Effects
    FxImpactUnit = MCPEffectTemplate.CybranHailfire01HitUnit01,
    FxImpactProp = MCPEffectTemplate.CybranHailfire01HitUnit01,    
    FxImpactLand = MCPEffectTemplate.CybranHailfire01HitLand01,
    FxImpactWater = MCPEffectTemplate.CybranHailfire01HitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 2.2,
    FxUnitHitScale = 2.2,
    FxPropHitScale = 2.2,
    FxWaterHitScale = 2.2,
}

RapierNapalmShellProjectile = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/default_polytrail_07_emit.bp',

    -- Hit Effects
    FxImpactUnit = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactProp = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactLand = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxImpactUnderWater = {},
}

GoliathTMDProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.GoliathTMD01,
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactNone = EffectTemplate.FireCloudSml01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactUnderWater = {},
    FxImpactProjectile = EffectTemplate.TMissileHit02,
    FxProjectileHitScale = 0.7,
}

CitadelHVM01Projectile = Class(EmitterProjectile) {
    -- Emitter Values
    FxInitial = {},
    TrailDelay = 0.3,
    FxTrails = MCPEffectTemplate.CitadelHVM01Trails,
    FxTrailOffset = -0.3,
    FxTrailScale = 4,

    FxAirUnitHitScale = 1,
    FxLandHitScale = 1,
    FxUnitHitScale = 1,
    FxPropHitScale = 1,
    FxImpactUnit = EffectTemplate.TMissileHit02,
    FxImpactAirUnit = EffectTemplate.TMissileHit02,
    FxImpactProp = EffectTemplate.TMissileHit02,    
    FxImpactLand = EffectTemplate.TMissileHit02,
    FxImpactUnderWater = {},
}

UEFClusterCruise01Projectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    FxTrails = MCPEffectTemplate.UEFCruiseMissile01Trails,
    FxTrailOffset = -0.3,
	FxTrailScale = 1.5,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactUnderWater = {},

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,

    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale != 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
}

UEFHeavyPlasmaGatlingCannon01 = Class(SinglePolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    FxImpactUnit = EffectTemplate.THeavyPlasmaGatlingCannonHit,
    FxImpactProp = EffectTemplate.THeavyPlasmaGatlingCannonHit,
    FxImpactWater = EffectTemplate.THeavyPlasmaGatlingCannonHit,
    FxImpactLand = EffectTemplate.THeavyPlasmaGatlingCannonHit,
	FxImpactShield = EffectTemplate.THeavyPlasmaGatlingCannonHit,
    FxImpactUnderWater = {},
    FxTrails = EffectTemplate.THeavyPlasmaGatlingCannonFxTrails,
    PolyTrail = EffectTemplate.THeavyPlasmaGatlingCannonPolyTrail,
}

UEFHVM01Projectile = Class(EmitterProjectile) {
# Emitter Values
    FxInitial = {},
    TrailDelay = 0.3,
    FxTrails = MCPEffectTemplate.UEFHVM01Trails,
    FxTrailOffset = -0.3,
	FxTrailScale = 4,

    FxAirUnitHitScale = 0.4,
    FxLandHitScale = 0.4,
    FxUnitHitScale = 0.4,
    FxPropHitScale = 0.4,
    FxImpactUnit = EffectTemplate.TMissileHit02,
    FxImpactAirUnit = EffectTemplate.TMissileHit02,
    FxImpactProp = EffectTemplate.TMissileHit02,    
    FxImpactLand = EffectTemplate.TMissileHit02,
    FxImpactUnderWater = {},
}

UEFCruiseMissile01Projectile = Class(SingleBeamProjectile) {
    DestroyOnImpact = false,
    FxTrails = MCPEffectTemplate.UEFCruiseMissile01Trails,
    FxTrailOffset = -0.3,
	FxTrailScale = 1.5,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactUnderWater = {},

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,

    CreateImpactEffects = function( self, army, EffectTable, EffectScale )
        local emit = nil
        for k, v in EffectTable do
            emit = CreateEmitterAtEntity(self,army,v)
            if emit and EffectScale != 1 then
                emit:ScaleEmitter(EffectScale or 1)
            end
        end
    end,
}

AeonBROT3HADES2proj = Class(EmitterProjectile) {
    
    FxImpactUnit = MCPEffectTemplate.ValiantHit,
    FxUnitHitScale = 2.55,
    FxImpactProp = MCPEffectTemplate.ValiantHit,
    FxPropHitScale = 2.55,
    FxImpactLand = MCPEffectTemplate.ValiantHit,
    FxLandHitScale = 2.55,
    FxImpactUnderWater = MCPEffectTemplate.ValiantHit,
    FxImpactWater = MCPEffectTemplate.ValiantHit,
    FxWaterHitScale = 2.55,
    FxTrails = EffectTemplate.SZthuthaamArtilleryProjectileFXTrails,
    PolyTrails = EffectTemplate.SZthuthaamArtilleryProjectilePolyTrails, 
    PolyTrailOffset = {0,0},

    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_002_albedo', 28, 28, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        EmitterProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

AeonBROT3HADESproj = Class(EmitterProjectile) {
    FxTrails = {'/effects/emitters/oblivion_cannon_munition_01_emit.bp'},
    FxImpactUnit = MCPEffectTemplate.HadesHit01,
    FxUnitHitScale = 2.4,
    FxImpactProp = MCPEffectTemplate.HadesHit01,
    FxPropHitScale = 2.4,
    FxImpactLand = MCPEffectTemplate.HadesHit01,
    FxLandHitScale = 2.4,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},

    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_001_albedo', 6, 6, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        EmitterProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

CybBRMAT2ADVBOMBERproj = Class(EmitterProjectile) {
    
    FxImpactUnit = MCPEffectTemplate.AvalancheRocketHit,
    FxUnitHitScale = 0.45,
    FxImpactProp = MCPEffectTemplate.AvalancheRocketHit,
    FxPropHitScale = 0.45,
    FxImpactLand = MCPEffectTemplate.AvalancheRocketHit,
    FxLandHitScale = 0.45,
    FxImpactUnderWater = MCPEffectTemplate.AvalancheRocketHit,
    FxImpactWater = MCPEffectTemplate.AvalancheRocketHit,
    FxWaterHitScale = 0.45,
    FxTrailOffset = -0.5,

    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_008_albedo', 5, 5, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        EmitterProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

CybBRMT3AVARLproj = Class(SingleBeamProjectile) {
    BeamName = '/effects/emitters/missile_exhaust_fire_beam_01_emit.bp',
    FxTrails = EffectTemplate.TMissileExhaust03,
    FxImpactUnit = MCPEffectTemplate.AvalancheRocketHit,
    FxUnitHitScale = 1,
    FxImpactProp = MCPEffectTemplate.AvalancheRocketHit,
    FxPropHitScale = 1,
    FxImpactLand = MCPEffectTemplate.AvalancheRocketHit,
    FxLandHitScale = 1,
    FxImpactUnderWater = MCPEffectTemplate.AvalancheRocketHit,
    FxImpactWater = MCPEffectTemplate.AvalancheRocketHit,
    FxWaterHitScale = 1,
    FxTrailOffset = -0.5,

    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_003_albedo', 18, 18, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        SingleBeamProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

UefBRNT1ADVBOTproj = Class(EmitterProjectile) {
    FxTrails = MCPEffectTemplate.BRNT1ADVBOTFXTrails01,
    FxImpactUnit = MCPEffectTemplate.UEFT1ADVBOThit1,
    FxUnitHitScale = 0.5,
    FxImpactProp = MCPEffectTemplate.UEFT1ADVBOThit1,
    FxPropHitScale = 0.5,
    FxImpactLand = MCPEffectTemplate.UEFT1ADVBOThit1,
    FxLandHitScale = 0.5,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

SerBRPT3SHBMproj = Class(EmitterProjectile) {
    FxTrails = EffectTemplate.SDFSinnutheWeaponFXTrails01,
    FxImpactUnit = MCPEffectTemplate.SerT3SHBMHit01,
    FxUnitHitScale = 1.6,
    FxImpactProp = MCPEffectTemplate.SerT3SHBMHit01,
    FxPropHitScale = 1.6,
    FxImpactLand = MCPEffectTemplate.SerT3SHBMHit01,
    FxLandHitScale = 1.6,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

SerBRPT1EXTANK2proj = Class(MultiPolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.SChronotronCannonProjectileFxTrails,
    PolyTrails = EffectTemplate.SChronotronCannonProjectileTrails,
    PolyTrailOffset = {0,0,0},
    FxImpactUnit = MCPEffectTemplate.SerT1AdvancedTankHit01,
    FxUnitHitScale = 1.6,
    FxImpactProp = MCPEffectTemplate.SerT1AdvancedTankHit01,
    FxPropHitScale = 1.6,
    FxImpactLand = MCPEffectTemplate.SerT1AdvancedTankHit01,
    FxLandHitScale = 1.6,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonT3SHPDproj = Class(MultiPolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.TIonizedPlasmaGatlingCannonFxTrails,
    PolyTrails = {},
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxUnitHitScale = 7,
    FxImpactProp = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxPropHitScale = 7,
    FxImpactLand = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxLandHitScale = 7,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT1EXMOBARTproj = Class(MultiPolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.TIonizedPlasmaGatlingCannonFxTrails,
    PolyTrails = {},
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxUnitHitScale = 7,
    FxImpactProp = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxPropHitScale = 7,
    FxImpactLand = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxLandHitScale = 7,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT1EXMOBART2proj = Class(MultiPolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.TIonizedPlasmaGatlingCannonFxTrails,
    PolyTrails = {},
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.AeonExpT1ArtilleryHit,
    FxUnitHitScale = 1,
    FxImpactProp = MCPEffectTemplate.AeonExpT1ArtilleryHit,
    FxPropHitScale = 1,
    FxImpactLand = MCPEffectTemplate.AeonExpT1ArtilleryHit,
    FxLandHitScale = 1,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT3PDROproj = Class(EmitterProjectile) {
    
    FxTrails = EffectTemplate.AOblivionCannonFXTrails02,
    FxImpactUnit = MCPEffectTemplate.AeonBattleShipHit01,
    FxUnitHitScale = 2.4,
    FxImpactProp = MCPEffectTemplate.AeonBattleShipHit01,
    FxPropHitScale = 2.4,
    FxImpactLand = MCPEffectTemplate.AeonBattleShipHit01,
    FxLandHitScale = 2.4,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROST2ADVBATTLESHIPproj = Class(EmitterProjectile) {
    
    FxTrails = MCPEffectTemplate.BROST2ADVBATTLESHIPTRAILS,
    FxImpactUnit = MCPEffectTemplate.BROST2ADVBATTLESHIPHIT,
    FxUnitHitScale = 2,
    FxImpactProp = MCPEffectTemplate.BROST2ADVBATTLESHIPHIT,
    FxPropHitScale = 2,
    FxImpactLand = MCPEffectTemplate.BROST2ADVBATTLESHIPHIT,
    FxLandHitScale = 2,
    FxTrailOffset = 0,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxWaterHitScale = 2,
    FxImpactUnderWater = {},
    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_004_albedo', 11, 11, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        MultiPolyTrailProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

UefBRNST2ADVBATTLESHIPproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.BRNST2ADVBATTLESHIPHIT,
    FxUnitHitScale = 1.4,
    FxImpactProp = MCPEffectTemplate.BRNST2ADVBATTLESHIPHIT,
    FxPropHitScale = 1.4,
    FxImpactLand = MCPEffectTemplate.BRNST2ADVBATTLESHIPHIT,
    FxLandHitScale = 1.4,
    FxTrailOffset = 0,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxWaterHitScale = 2,
    FxImpactUnderWater = {},
    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_004_albedo', 7, 7, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        MultiPolyTrailProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

AeonBROT1BTCLAWproj = Class(SinglePolyTrailProjectile) {
    
    PolyTrail = '/effects/emitters/aeon_laser_trail_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.AeonClawHit01,
    FxUnitHitScale = 0.35,
    FxImpactProp = MCPEffectTemplate.AeonClawHit01,
    FxPropHitScale = 0.35,
    FxImpactLand = MCPEffectTemplate.AeonClawHit01,
    FxLandHitScale = 0.35,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonHvyClawproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {'/effects/emitters/oblivion_cannon_munition_01_emit.bp'},
    FxImpactUnit = MCPEffectTemplate.AeonHvyClawHit01,
    FxUnitHitScale = 1.35,
    FxImpactProp = MCPEffectTemplate.AeonHvyClawHit01,
    FxPropHitScale = 1.35,
    FxImpactLand = MCPEffectTemplate.AeonHvyClawHit01,
    FxLandHitScale = 1.35,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonAAmissile01 = Class(EmitterProjectile) {
    FxTrails = EffectTemplate.AAntiMissileFlare,
    FxTrailScale = 1.0,
    FxImpactUnit = {},
    FxImpactAirUnit = {},
    FxImpactNone = EffectTemplate.AAntiMissileFlareHit,
    FxImpactProjectile = EffectTemplate.AAntiMissileFlareHit,
    FxOnKilled = EffectTemplate.AAntiMissileFlareHit,
    FxUnitHitScale = 1.4,
    FxLandHitScale = 1.4,
    FxWaterHitScale = 1.4,
    FxUnderWaterHitScale = 1.4,
    FxAirUnitHitScale = 1.4,
    FxNoneHitScale = 1.4,
    FxImpactLand = {},
    FxImpactUnderWater = {},
    DestroyOnImpact = false,

    OnImpact = function(self, TargetType, targetEntity)
        EmitterProjectile.OnImpact(self, TargetType, targetEntity)
        if TargetType == 'Terrain' or TargetType == 'Water' or TargetType == 'Prop' then
            if self.Trash then
                self.Trash:Destroy()
            end
            self:Destroy()
        end
    end,
}

AeonBROT1PDROproj = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.AAntiMissileFlare,
    FxTrailScale = 1.0,
    FxImpactUnit = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
    FxUnitHitScale = 1.0,
    FxImpactProp = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
    FxPropHitScale = 1.0,
    FxImpactLand = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
    FxLandHitScale = 1.0,
    FxImpactUnderWater = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
    FxImpactWater = EffectTemplate.AMercyGuidedMissileSplitMissileHitLand,
}

AeonBROT3ML2proj = Class(SinglePolyTrailProjectile) {
    FxTrails = {
        '/effects/emitters/quantum_cannon_munition_03_emit.bp',
        '/effects/emitters/quantum_cannon_munition_04_emit.bp',
    },
    PolyTrail = '/effects/emitters/quantum_cannon_polytrail_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.AeonBattleShipHit01,
    FxUnitHitScale = 1,
    FxImpactProp = MCPEffectTemplate.AeonBattleShipHit01,
    FxPropHitScale = 1,
    FxImpactLand = MCPEffectTemplate.AeonBattleShipHit01,
    FxLandHitScale = 1,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT2EXBMproj = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/aeon_missile_trail_01_emit.bp',

    FxImpactUnit = MCPEffectTemplate.AeonBattleShipHit01,
    FxUnitHitScale = 1,
    FxImpactProp = MCPEffectTemplate.AeonBattleShipHit01,
    FxPropHitScale = 1,
    FxImpactLand = MCPEffectTemplate.AeonBattleShipHit01,
    FxLandHitScale = 1,
    FxImpactUnderWater = {},
}

AeonBROT3SHBMproj = Class(EmitterProjectile) {
    FxTrails = EffectTemplate.AIFBallisticMortarTrails01,
    FxTrailScale = 0.75,
    FxImpactUnit = MCPEffectTemplate.AeonEnforcerMainGuns,
    FxUnitHitScale = 2,
    FxImpactProp = MCPEffectTemplate.AeonEnforcerMainGuns,
    FxPropHitScale = 2,
    FxImpactLand = MCPEffectTemplate.AeonEnforcerMainGuns,
    FxLandHitScale = 2,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT3MLproj = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.AAntiMissileFlare,
    FxTrailScale = 1.0,
    FxImpactUnit = MCPEffectTemplate.AeonT3RocketHit01,
    FxUnitHitScale = 1.6,
    FxImpactProp = MCPEffectTemplate.AeonT3RocketHit01,
    FxPropHitScale = 1.6,
    FxImpactLand = MCPEffectTemplate.AeonT3RocketHit01,
    FxLandHitScale = 1.6,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

AeonBROT3SHBMEMPproj = Class(SinglePolyTrailProjectile) {
    FxImpactUnit = MCPEffectTemplate.AeonT3EMPburst,
    FxUnitHitScale = 4,
    FxImpactProp = MCPEffectTemplate.AeonT3EMPburst,
    FxPropHitScale = 4,
    FxImpactLand = MCPEffectTemplate.AeonT3EMPburst,
    FxLandHitScale = 4,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

CybranBMRocketProjectile = Class(SingleCompositeEmitterProjectile) {
    BeamName = '/effects/emitters/missile_loa_munition_exhaust_beam_01_emit.bp',
    FxTrails = {'/effects/emitters/missile_cruise_munition_trail_01_emit.bp',},
    FxTrailOffset = -0.5,
    FxImpactUnit = EffectTemplate.CHvyDisintegratorHit02,
    FxUnitHitScale = 4,
    FxImpactProp = EffectTemplate.CHvyDisintegratorHit02,
    FxPropHitScale = 4,
    FxImpactLand = EffectTemplate.CHvyDisintegratorHit02,
    FxLandHitScale = 4,
    FxImpactUnderWater = {},
}

CybBRMT1BTRLproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
		'/effects/emitters/electron_bolter_trail_02_emit.bp',
		'/effects/emitters/default_polytrail_01_emit.bp',
	},
	PolyTrailOffset = {0,0},  
    FxTrails = {'/effects/emitters/electron_bolter_munition_01_emit.bp',},
    FxImpactUnit = EffectTemplate.CMissileHit02a,
    FxUnitHitScale = 2,
    FxImpactProp = EffectTemplate.CMissileHit02a,
    FxPropHitScale = 2,
    FxImpactLand = EffectTemplate.CMissileHit02a,
    FxLandHitScale = 2,
    FxImpactUnderWater = EffectTemplate.CMissileHit02a,
    FxImpactWater = EffectTemplate.CMissileHit02a,
    FxWaterHitScale = 2,
    FxTrailOffset = 0,
}

CybBRMT3RAPproj = Class(MultiPolyTrailProjectile) {
	PolyTrailOffset = {0.05,0.05,0.05},  
    PolyTrailOffset = EffectTemplate.TPlasmaGatlingCannonPolyTrailsOffsets,

    FxImpactNone = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactUnit = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactProp = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactLand = EffectTemplate.TPlasmaGatlingCannonHit,
    FxImpactWater= EffectTemplate.TPlasmaGatlingCannonHit,
    RandomPolyTrails = 1,
    PolyTrails = MCPEffectTemplate.RedGatlingCannonPolyTrails,

}

uefBRNT3ARGUSMINIproj = Class(MultiPolyTrailProjectile) {
	PolyTrailOffset = {0.05,0.05,0.05},  
    PolyTrailOffset = EffectTemplate.TPlasmaGatlingCannonPolyTrailsOffsets,

    FxImpactNone = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactUnit = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactProp = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactLand = EffectTemplate.TPlasmaGatlingCannonHit,
    FxImpactWater= EffectTemplate.TPlasmaGatlingCannonHit,
    RandomPolyTrails = 1,
    PolyTrails = MCPEffectTemplate.GreenGatlingCannonPolyTrails,

}

uefBRNT3ARGUSLASERproj = Class(MultiPolyTrailProjectile) {
	PolyTrailOffset = {0.05,0.05,0.05},  
    PolyTrailOffset = EffectTemplate.TPlasmaGatlingCannonPolyTrailsOffsets,

    FxImpactNone = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactUnit = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactProp = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactLand = EffectTemplate.TPlasmaGatlingCannonHit,
    FxImpactWater= EffectTemplate.TPlasmaGatlingCannonHit,
    RandomPolyTrails = 1,
    PolyTrails = MCPEffectTemplate.YellowLaserPolyTrails,

}

CybBRMT2BEETLEproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail02,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranT2BeetleHit01,
    FxUnitHitScale = 1.7,
    FxImpactProp = MCPEffectTemplate.CybranT2BeetleHit01,
    FxPropHitScale = 1.7,
    FxImpactLand = MCPEffectTemplate.CybranT2BeetleHit01,
    FxLandHitScale = 1.7,
    FxImpactUnderWater = MCPEffectTemplate.CybranT2BeetleHit01,
    FxImpactWater = MCPEffectTemplate.CybranT2BeetleHit01,
    FxTrailOffset = 0,
}

CybBRMT2EPDproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.HeavyLaserPolyTrail,
    FxImpactUnit = EffectTemplate.CDisintegratorHitUnit01,
    FxImpactAirUnit = EffectTemplate.CDisintegratorHitAirUnit01,
    FxImpactProp = EffectTemplate.CDisintegratorHitUnit01,
    FxLandHitScale = 2.4,
    FxUnitHitScale = 2.4,
    FxPropHitScale = 2.4,
    FxImpactLand = EffectTemplate.CDisintegratorHitLand01,
    FxImpactUnderWater = {},
}

CybNULLWEAPONproj = Class(NullShell) {
    # Hit Effects
    FxImpactUnit = {},
    FxImpactAirUnit = {},
    FxImpactProp = {},
    FxImpactLand = {},
    FxImpactUnderWater = {},
}

AeonBROT3BTBOTproj = Class(EmitterProjectile) {
    FxTrails = {'/effects/emitters/oblivion_cannon_munition_01_emit.bp'},
    FxImpactUnit = EffectTemplate.AOblivionCannonHit01,
    FxImpactProp = EffectTemplate.AOblivionCannonHit01,
    FxImpactLand = EffectTemplate.AOblivionCannonHit01,
    FxImpactWater = EffectTemplate.AOblivionCannonHit01,
}

AeonBROT3BTBOT2proj = Class(SinglePolyTrailProjectile) {
    PolyTrail = '/effects/emitters/quantum_displacement_cannon_polytrail_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.UEFDeath01,
    FxImpactProp = MCPEffectTemplate.UEFDeath01,
    FxImpactLand = MCPEffectTemplate.UEFDeath01,
    FxLandHitScale = 0.55,
    FxUnitHitScale = 0.55,
    FxPropHitScale = 0.55,
    FxImpactWater = MCPEffectTemplate.UEFDeath01,
    FxWaterHitScale = 0.55,
}

CybBRMT3BM2TLproj = Class(MultiPolyTrailProjectile) {
	FxTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_03_brightglow_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_04_smoke_emit.bp',
	},
	FxTrailOffset = 0.2,
	PolyTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_01_polytrails_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_02_polytrails_emit.bp',
	},
	PolyTrailOffset = {0.3,0},
    FxImpactUnit = MCPEffectTemplate.BattleMech2RocketHit,
    FxUnitHitScale = 1.3,
    FxImpactProp = MCPEffectTemplate.BattleMech2RocketHit,
    FxPropHitScale = 1.3,
    FxImpactLand = MCPEffectTemplate.BattleMech2RocketHit,
    FxLandHitScale = 1.3,
    FxImpactUnderWater = MCPEffectTemplate.BattleMech2RocketHit,
    FxImpactWater = MCPEffectTemplate.BattleMech2RocketHit,
    FxWaterHitScale = 1.3,
    FxTrailOffset = 0,
}

CybBRMT1ADVBOTRLproj = Class(SingleBeamProjectile) {
    BeamName = '/effects/emitters/missile_loa_munition_exhaust_beam_01_emit.bp',
    FxTrails = {'/effects/emitters/missile_cruise_munition_trail_01_emit.bp',},
    FxTrailOffset = -0.5,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranHeavyProtonRocketHit,
    FxUnitHitScale = 1.1,
    FxImpactProp = MCPEffectTemplate.CybranHeavyProtonRocketHit,
    FxPropHitScale = 1.1,
    FxImpactLand = MCPEffectTemplate.CybranHeavyProtonRocketHit,
    FxLandHitScale = 1.1,
    FxImpactUnderWater = MCPEffectTemplate.CybranHeavyProtonRocketHit,
    FxImpactWater = MCPEffectTemplate.CybranHeavyProtonRocketHit,
    FxWaterHitScale = 1.1,
}

CybBRMT3AVAproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
		'/effects/emitters/disintegrator_polytrail_04_emit.bp',
		'/effects/emitters/disintegrator_polytrail_05_emit.bp',
		'/effects/emitters/default_polytrail_03_emit.bp',
	},
	PolyTrailOffset = {0,0,0},  
	FxTrails = EffectTemplate.CDisintegratorFxTrails01,  
	
    FxImpactUnit = MCPEffectTemplate.Beetleprojectilehit01,
    FxUnitHitScale = 1.4,
    FxImpactProp = MCPEffectTemplate.Beetleprojectilehit01,
    FxPropHitScale = 1.4,
    FxImpactLand = MCPEffectTemplate.Beetleprojectilehit01,
    FxLandHitScale = 1.4,
    FxImpactUnderWater = MCPEffectTemplate.Beetleprojectilehit01,
    FxImpactWater = MCPEffectTemplate.Beetleprojectilehit01,
}

UefBRNT3BTproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT3BattletankHit,
    FxUnitHitScale = 1.0,
    FxImpactProp = MCPEffectTemplate.UefT3BattletankHit,
    FxPropHitScale = 1.0,
    FxImpactLand = MCPEffectTemplate.UefT3BattletankHit,
    FxLandHitScale = 1.0,
    FxImpactUnderWater = MCPEffectTemplate.UefT3BattletankHit,
    FxImpactWater = MCPEffectTemplate.UefT3BattletankHit,
}

UefBRNT2HTproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT2BattleTankHit,
    FxUnitHitScale = 1.1,
    FxImpactProp = MCPEffectTemplate.UefT2BattleTankHit,
    FxPropHitScale = 1.1,
    FxImpactLand = MCPEffectTemplate.UefT2BattleTankHit,
    FxLandHitScale = 1.1,
    FxImpactUnderWater = MCPEffectTemplate.UefT2BattleTankHit,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
}

UefBRNT2EXLMproj = Class(MultiPolyTrailProjectile) {
    FxTrails = MCPEffectTemplate.UEFArmoredBattleBotTrails,
    PolyTrailOffset = {0,0},    
    PolyTrails = MCPEffectTemplate.UEFArmoredBattleBotPolyTrails,
    FxImpactUnit = MCPEffectTemplate.BRNT2EXLMHit1,
    FxUnitHitScale = 2.1,
    FxImpactProp = MCPEffectTemplate.BRNT2EXLMHit1,
    FxPropHitScale = 2.1,
    FxImpactLand = MCPEffectTemplate.BRNT2EXLMHit1,
    FxLandHitScale = 2.1,
    FxImpactUnderWater = MCPEffectTemplate.BRNT2EXLMHit1,
}

UefBRNT3BTRLproj = Class(SingleBeamProjectile) {
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.UefT3BattletankRocketHit,
    FxUnitHitScale = 0.8,
    FxImpactProp = MCPEffectTemplate.UefT3BattletankRocketHit,
    FxPropHitScale = 0.8,
    FxImpactLand = MCPEffectTemplate.UefT3BattletankRocketHit,
    FxLandHitScale = 0.8,
    FxImpactUnderWater = MCPEffectTemplate.UefT3BattletankRocketHit,
    FxImpactWater = MCPEffectTemplate.UefT3BattletankRocketHit,
}

UefBRNT3DOOMSGUNproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UEFDeath02,
    FxUnitHitScale = 0.9,
    FxImpactProp = MCPEffectTemplate.UEFDeath02,
    FxPropHitScale = 0.9,
    FxImpactLand = MCPEffectTemplate.UEFDeath02,
    FxLandHitScale = 0.9,
    FxImpactUnderWater = MCPEffectTemplate.UEFDeath02,
    FxImpactWater = MCPEffectTemplate.UEFDeath02,
}

UefBRNT3DOOMSDAYproj = Class(SingleBeamProjectile) {
    FxTrailOffset = -0.8,
    FxTrails = EffectTemplate.TMissileExhaust03,
    FxImpactUnit = MCPEffectTemplate.UEFmayhemRocketHit,
    FxUnitHitScale = 1.7,
    FxImpactProp = MCPEffectTemplate.UEFmayhemRocketHit,
    FxPropHitScale = 1.7,
    FxImpactLand = MCPEffectTemplate.UEFmayhemRocketHit,
    FxLandHitScale = 1.7,
    FxImpactUnderWater = MCPEffectTemplate.UEFmayhemRocketHit,
    FxImpactWater = MCPEffectTemplate.UEFmayhemRocketHit,
}

UefBRNT1EXM1proj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UEFHighExplosiveShellHit01,	
    FxUnitHitScale = 1.5,
    FxImpactProp = MCPEffectTemplate.UEFHighExplosiveShellHit01,
    FxPropHitScale = 1.5,
    FxImpactLand = MCPEffectTemplate.UEFHighExplosiveShellHit01,
    FxLandHitScale = 1.5,
    FxImpactUnderWater = MCPEffectTemplate.UEFHighExplosiveShellHit01,
    FxImpactWater = MCPEffectTemplate.UEFHighExplosiveShellHit01,
}

UefBRNT2EPDproj = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.TPlasmaCannonHeavyMunition,
    RandomPolyTrails = 1,
    PolyTrailOffset = {0,0,0},
    PolyTrails = EffectTemplate.TPlasmaCannonHeavyPolyTrails,
    FxImpactUnit = MCPEffectTemplate.UefT2EPDPlasmaHit01,
    FxUnitHitScale = 1.7,
    FxImpactProp = MCPEffectTemplate.UefT2EPDPlasmaHit01,
    FxPropHitScale = 1.7,
    FxImpactLand = MCPEffectTemplate.UefT2EPDPlasmaHit01,
    FxLandHitScale = 1.7,
    FxImpactUnderWater = MCPEffectTemplate.UefT2EPDPlasmaHit01,
    FxImpactWater = MCPEffectTemplate.UefT2EPDPlasmaHit01,
}

UefBRNT3SHPDproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT3SHPDGaussHit01,
    FxUnitHitScale = 1.4,
    FxImpactProp = MCPEffectTemplate.UefT3SHPDGaussHit01,
    FxPropHitScale = 1.4,
    FxImpactLand = MCPEffectTemplate.UefT3SHPDGaussHit01,
    FxLandHitScale = 1.4,
    FxImpactUnderWater = MCPEffectTemplate.UefT3SHPDGaussHit01,
    FxImpactWater = MCPEffectTemplate.UefT3SHPDGaussHit01,
}

UefBRNT3MOBproj = Class(MultiPolyTrailProjectile) {
	PolyTrailOffset = {0.05,0.05,0.05},  
	FxTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_03_brightglow_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_04_smoke_emit.bp',
	},
	PolyTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_01_polytrails_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_02_polytrails_emit.bp',
	},
    FxImpactUnit = MCPEffectTemplate.UefMobileFortressGunhit,
    FxUnitHitScale = 1.5,
    FxImpactProp = MCPEffectTemplate.UefMobileFortressGunhit,
    FxPropHitScale = 1.5,
    FxImpactLand = MCPEffectTemplate.UefMobileFortressGunhit,
    FxLandHitScale = 1.5,
    FxImpactUnderWater = MCPEffectTemplate.UefMobileFortressGunhit,
    FxImpactWater = MCPEffectTemplate.UefMobileFortressGunhit,
}

UefBRNT2HTRLproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {'/effects/emitters/missile_munition_trail_01_emit.bp',},
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxUnitHitScale = 0.45,
    FxImpactProp = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxPropHitScale = 0.45,
    FxImpactLand = EffectTemplate.TNapalmHvyCarpetBombHitLand01,
    FxLandHitScale = 0.45,
    FxImpactUnderWater = EffectTemplate.TShipGaussCannonHit02,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
}

UefBRNT3PDROproj = Class(SingleBeamProjectile) {
    FxTrails = {'/effects/emitters/missile_munition_trail_01_emit.bp',},
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.UEFHEAVYROCKET02,
    FxUnitHitScale = 2.2,
    FxImpactProp = MCPEffectTemplate.UEFHEAVYROCKET02,
    FxPropHitScale = 2.2,
    FxImpactLand = MCPEffectTemplate.UEFHEAVYROCKET02,
    FxLandHitScale = 2.2,
    FxImpactUnderWater = MCPEffectTemplate.UEFHEAVYROCKET02,
    FxImpactWater = MCPEffectTemplate.UEFHEAVYROCKET02,
    FxWaterHitScale = 2.2,
}

UefBRNT3FFARproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {'/effects/emitters/missile_munition_trail_01_emit.bp',},
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.UEFHighExplosiveRocketHit,
    FxUnitHitScale = 0.8,
    FxImpactProp = MCPEffectTemplate.UEFHighExplosiveRocketHit,
    FxPropHitScale = 0.8,
    FxImpactLand = MCPEffectTemplate.UEFHighExplosiveRocketHit,
    FxLandHitScale = 0.8,
    FxImpactUnderWater = MCPEffectTemplate.UEFHighExplosiveRocketHit,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
}

AeonBROT3SHPD2proj = Class(MultiPolyTrailProjectile) {
    
    PolyTrails  = {
            '/mods/MCP/effects/emitters/AeonT3SHPD_polytrails_emit.bp',
    },
    FxImpactUnit = MCPEffectTemplate.AeonT2ExperimentalTankHunterHit01,
    FxUnitHitScale = 1.25,
    FxImpactProp = MCPEffectTemplate.AeonT2ExperimentalTankHunterHit01,
    FxPropHitScale = 1.25,
    FxImpactLand = MCPEffectTemplate.AeonT2ExperimentalTankHunterHit01,
    FxLandHitScale = 1.25,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

UefBRNT2EXARTproj = Class(MultiPolyTrailProjectile) {
    PolyTrailOffset = {0.05,0.05,0.05},  
    PolyTrails  = {
            '/mods/MCP/effects/emitters/UEFT2EXART_polytrails_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_01_polytrails_emit.bp',
    },
    FxImpactUnit = MCPEffectTemplate.UEFT2EXARTHit02,
    FxUnitHitScale = 1.0,
    FxImpactProp = MCPEffectTemplate.UEFT2EXARTHit02,
    FxPropHitScale = 1.0,
    FxImpactLand = MCPEffectTemplate.UEFT2EXARTHit02,
    FxLandHitScale = 1.0,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

UefBRNT2BTproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT2BattleTankHit2,
    FxUnitHitScale = 1.1,
    FxImpactProp = MCPEffectTemplate.UefT2BattleTankHit2,
    FxPropHitScale = 1.1,
    FxImpactLand = MCPEffectTemplate.UefT2BattleTankHit2,
    FxLandHitScale = 1.1,
    FxImpactUnderWater = MCPEffectTemplate.UefT2BattleTankHit2,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
}

TArtilleryAntiMatterSmallProjectile = Class(SinglePolyTrailProjectile) {
	PolyTrail = '/effects/emitters/default_polytrail_07_emit.bp',

    # Hit Effects
    FxImpactUnit = EffectTemplate.TShipGaussCannonHitUnit01,
    FxImpactProp = EffectTemplate.TShipGaussCannonHit01,
    FxImpactLand = EffectTemplate.TShipGaussCannonHit01,
    FxLandHitScale = 1.5,
	FxUnitHitScale = 1.5,
	FxPropHitScale = 1.5,
    FxImpactUnderWater = {},
    FxSplatScale = 1.8,

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        if targetType == 'Terrain' then
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_001_normals', '', 'Alpha Normals', self.FxSplatScale, self.FxSplatScale, 150, 50, army )
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_002_albedo', '', 'Albedo', self.FxSplatScale * 2, self.FxSplatScale * 2, 150, 50, army )
            --self:ShakeCamera(20, 1, 0, 1)
        end
        local pos = self:GetPosition()
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
		DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

CybBRMT3PDproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranHeavyProtonGunHit,
    FxUnitHitScale = 0.5,
    FxImpactProp = MCPEffectTemplate.CybranHeavyProtonGunHit,
    FxPropHitScale = 0.5,
    FxImpactLand = MCPEffectTemplate.CybranHeavyProtonGunHit,
    FxLandHitScale = 0.5,
    FxImpactUnderWater = MCPEffectTemplate.CybranHeavyProtonGunHit,
    FxImpactWater = EffectTemplate.CNeutronClusterBombHitWater01,
    FxWaterHitScale = 2.5,
    FxTrailOffset = 0,
}

CybBRMT1HVYproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail,
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranT1BattleTankHit,
    FxUnitHitScale = 0.6,
    FxImpactProp = MCPEffectTemplate.CybranT1BattleTankHit,
    FxPropHitScale = 0.6,
    FxImpactLand = MCPEffectTemplate.CybranT1BattleTankHit,
    FxLandHitScale = 0.6,
    FxImpactWater = EffectTemplate.CNeutronClusterBombHitWater01,
    FxWaterHitScale = 2.5,
    FxTrailOffset = 0,
}

UefBRNT1BTproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT1BattleTankHit,
    FxUnitHitScale = 0.9,
    FxImpactProp = MCPEffectTemplate.UefT1BattleTankHit,
    FxPropHitScale = 0.9,
    FxImpactLand = MCPEffectTemplate.UefT1BattleTankHit,
    FxLandHitScale = 0.9,
    FxImpactUnderWater = MCPEffectTemplate.UefT1BattleTankHit,
    FxImpactWater = MCPEffectTemplate.UefT1BattleTankHit,
}

UefBRNT1BTRLproj = Class(MultiPolyTrailProjectile) {
    FxInitial = {},
    TrailDelay = 1,
    FxTrails = {'/effects/emitters/missile_sam_munition_trail_01_emit.bp',},
    FxTrailOffset = -0.5,
    FxImpactUnit = EffectTemplate.TGaussCannonHitLand01,
    FxUnitHitScale = 5,
    FxImpactProp = EffectTemplate.TGaussCannonHitLand01,
    FxPropHitScale = 5,
    FxImpactLand = EffectTemplate.TGaussCannonHitLand01,
    FxLandHitScale = 5,
    FxImpactUnderWater = EffectTemplate.TGaussCannonHitLand01,
    FxImpactWater = EffectTemplate.TGaussCannonHitLand01,
    FxWaterHitScale = 5,
}

TOrbitalHeavyPlasmaCannonProjectile = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.TPlasmaCannonHeavyMunition,
	FxTrailScale = 9,   --TPlasmaCannonHeavyMunition02
    RandomPolyTrails = 5,
    PolyTrailOffset = {0,0,0},
    PolyTrails = EffectTemplate.TPlasmaCannonHeavyPolyTrails,
	PolyTrailsScale = 20,
	FxImpactAirUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,    --EffectTemplate.TAAGinsuHitUnit
    FxAirUnitHitScale = 13,
}

AeonBROT1EXM1proj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
		'/effects/emitters/aeon_laser_trail_02_emit.bp',
		'/effects/emitters/default_polytrail_03_emit.bp',
	},
	PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.AeonT1EXM1MainHit01,
    FxUnitHitScale = 2,
    FxImpactProp = MCPEffectTemplate.AeonT1EXM1MainHit01,
    FxPropHitScale = 2,
    FxImpactLand = MCPEffectTemplate.AeonT1EXM1MainHit01,
    FxLandHitScale = 2,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

CybBRMT1EXM1proj = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.HeavyLaserPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CLaserBotHit01,
    FxUnitHitScale = 1.13,
    FxImpactProp = MCPEffectTemplate.CLaserBotHit01,
    FxPropHitScale = 1.13,
    FxImpactLand = MCPEffectTemplate.CLaserBotHit01,
    FxLandHitScale = 1.13,
    FxImpactUnderWater = MCPEffectTemplate.CLaserBotHit01,
    FxImpactWater = MCPEffectTemplate.CLaserBotHit01,
    FxTrailOffset = 0,
}

UefBRNAT2FIGHTERproj = Class(SingleBeamProjectile) {
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -0.5,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = EffectTemplate.TShipGaussCannonHit02,
    FxUnitHitScale = 0.55,
    FxImpactProp = EffectTemplate.TShipGaussCannonHit02,
    FxPropHitScale = 0.55,
    FxImpactLand = EffectTemplate.TShipGaussCannonHit02,
    FxLandHitScale = 0.55,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

UefBRNT3SHBM2proj = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.SChronotronCannonProjectileFxTrails,
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxUnitHitScale = 1.2,
    FxImpactProp = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxPropHitScale = 1.2,
    FxImpactLand = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxLandHitScale = 1.2,
    FxImpactUnderWater = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxImpactWater = MCPEffectTemplate.UEFMayhemMK4hit1,
    OnImpact = function(self, TargetType, TargetEntity)
        local army = self:GetArmy()

        if TargetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_004_albedo', 11, 11, 250, 200, army )

            #local blanketSides = 12
            #local blanketAngle = (2*math.pi) / blanketSides
            #local blanketStrength = 1
            #local blanketVelocity = 2.25

            #for i = 0, (blanketSides-1) do
            #    local blanketX = math.sin(i*blanketAngle)
            #    local blanketZ = math.cos(i*blanketAngle)
            #    local Blanketparts = self:CreateProjectile('/effects/entities/DestructionDust01/DestructionDust01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
            #        :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
            #end
        end
        MultiPolyTrailProjectile.OnImpact( self, TargetType, TargetEntity )
    end,
}

UefBRNT3SHBM2EMPproj = Class(MultiPolyTrailProjectile) {
    FxImpactUnit = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxUnitHitScale = 0,
    FxImpactProp = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxPropHitScale = 0,
    FxImpactLand = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxLandHitScale = 0,
    FxImpactUnderWater = MCPEffectTemplate.UEFMayhemMK4hit1,
    FxImpactWater = MCPEffectTemplate.UEFMayhemMK4hit1,
}

UefBRNT3SHBMNEWRLAproj = Class(SingleBeamProjectile) {
    FxTrailOffset = -0.8,
    FxTrails = EffectTemplate.TMissileExhaust03,
    FxImpactUnit = MCPEffectTemplate.UEFmayhemRocketHit,
    FxUnitHitScale = 1.2,
    FxImpactProp = MCPEffectTemplate.UEFmayhemRocketHit,
    FxPropHitScale = 1.2,
    FxImpactLand = MCPEffectTemplate.UEFmayhemRocketHit,
    FxLandHitScale = 1.2,
    FxImpactUnderWater = MCPEffectTemplate.UEFmayhemRocketHit,
    FxImpactWater = MCPEffectTemplate.UEFmayhemRocketHit,
}

UefBRNT3SHBMNEWRLAproj = Class(SingleBeamProjectile) {
    FxTrailOffset = -0.8,
    FxTrails = EffectTemplate.TMissileExhaust03,
    FxImpactUnit = MCPEffectTemplate.UEFmayhemRocketHitA,
    FxUnitHitScale = 1.2,
    FxImpactProp = MCPEffectTemplate.UEFmayhemRocketHitA,
    FxPropHitScale = 1.2,
    FxImpactLand = MCPEffectTemplate.UEFmayhemRocketHitA,
    FxLandHitScale = 1.2,
    FxImpactUnderWater = MCPEffectTemplate.UEFmayhemRocketHitA,
    FxImpactWater = MCPEffectTemplate.UEFmayhemRocketHitA,
}

UefBRNT3SHBMNEWRL2Aproj = Class(SingleBeamProjectile) {
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -0.5,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.UEFmayhemRocketHit2A,
    FxUnitHitScale = 0.8,
    FxImpactProp = MCPEffectTemplate.UEFmayhemRocketHit2A,
    FxPropHitScale = 0.8,
    FxImpactLand = MCPEffectTemplate.UEFmayhemRocketHit2A,
    FxLandHitScale = 0.8,
    FxImpactUnderWater = MCPEffectTemplate.UEFmayhemRocketHit2A,
    FxImpactWater = MCPEffectTemplate.UEFmayhemRocketHit2A,
}

CybBRMT1EXTANKproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.BRMT1EXTANKTRAILS,
	PolyTrailOffset = {0.05,0.05,0.05},  
    PolyTrailOffset = EffectTemplate.TPlasmaGatlingCannonPolyTrailsOffsets,

    FxImpactUnit = MCPEffectTemplate.BRMT1EXTANKHIT,
    FxUnitHitScale = 1.6,
    FxImpactProp = MCPEffectTemplate.BRMT1EXTANKHIT,
    FxPropHitScale = 1.6,
    FxImpactLand = MCPEffectTemplate.BRMT1EXTANKHIT,
    FxLandHitScale = 1.6,
    FxImpactWater = EffectTemplate.CNeutronClusterBombHitWater01,
    FxWaterHitScale = 2.5,
    FxTrailOffset = 0,
}

TBalrogMagmaCannon = Class(MultiPolyTrailProjectile) {
    FxImpactWater = MCPEffectTemplate.TMagmaCannonHit,
    FxImpactLand = MCPEffectTemplate.TMagmaCannonHit,
    FxImpactNone = MCPEffectTemplate.TMagmaCannonHit,
    FxImpactProp = MCPEffectTemplate.TMagmaCannonUnitHit,    
    FxImpactUnit = MCPEffectTemplate.TMagmaCannonUnitHit,    
    FxTrails = MCPEffectTemplate.TMagmaCannonFxTrails,

	# Using MultPolyTrail:
	PolyTrails = MCPEffectTemplate.TMagmaCannonPolyTrails,
	PolyTrailOffset = {0,-1.55}, # original = {0,0}
    FxImpactProjectile = {},
    FxImpactUnderWater = {},
	
	# Adjusting scale for testing...remove and fix projectile if sizing desired
	FxTrailScale = 1.25,
}
AeonBROT1EXM2proj = Class(SinglePolyTrailProjectile) {

    PolyTrail = '/effects/emitters/aeon_laser_trail_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.AeonT1ExperimentalLaserHit,
    FxImpactProp = MCPEffectTemplate.AeonT1ExperimentalLaserHit,
    FxImpactLand = MCPEffectTemplate.AeonT1ExperimentalLaserHit,
    FxUnitHitScale = 1,
    FxLandHitScale = 1,
    FxPropHitScale = 1,
    FxImpactUnderWater = {},
}

ADepthChargeProjectile = Class(OnWaterEntryEmitterProjectile) {
    FxInitial = {},
    FxTrails = {'/effects/emitters/torpedo_munition_trail_01_emit.bp',},
    TrailDelay = 0,
    TrackTime = 0,

    FxImpactLand = EffectTemplate.ABombHit01,
    FxImpactUnit = EffectTemplate.ABombHit01,
    FxImpactProp = EffectTemplate.ABombHit01,
    FxImpactUnderWater = EffectTemplate.ABombHit01,
    FxImpactNone = {},

    OnCreate = function(self, inWater)
        OnWaterEntryEmitterProjectile.OnCreate(self)
        #self:TrackTarget(true)
    end,

    OnEnterWater = function(self)
        OnWaterEntryEmitterProjectile.OnEnterWater(self)
        local army = self:GetArmy()

        for k, v in self.FxEnterWater do #splash
            CreateEmitterAtEntity(self,army,v)
        end

        #self:TrackTarget(false)
        #self:StayUnderwater(true)
        #self:SetTurnRate(0)
        #self:SetMaxSpeed(1)
        #self:SetVelocity(0, -0.25, 0)
        #self:SetVelocity(0.25)
    end,

    AddDepthCharge = function(self, tbl)
        if not tbl then return end
        if not tbl.Radius then return end
        self.MyDepthCharge = DepthCharge {
            Owner = self,
            Radius = tbl.Radius or 10,
        }
        self.Trash:Add(self.MyDepthCharge)
    end,
}

AOblivionCannonProjectile = Class(EmitterProjectile) {
    FxTrails = {'/effects/emitters/oblivion_cannon_munition_01_emit.bp'},
    FxImpactUnit = EffectTemplate.AOblivionCannonHit01,
    FxImpactProp = EffectTemplate.AOblivionCannonHit01,
    FxImpactLand = EffectTemplate.AOblivionCannonHit01,
    FxImpactWater = EffectTemplate.AOblivionCannonHit01,
}

AOblivionCannonProjectile02 = Class(SinglePolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.AOblivionCannonFXTrails02,
    PolyTrail = EffectTemplate.Aeon_QuanticClusterProjectilePolyTrail,
    FxImpactUnit = EffectTemplate.AOblivionCannonHit02,
    FxImpactProp = EffectTemplate.AOblivionCannonHit02,
    FxImpactLand = EffectTemplate.AOblivionCannonHit02,
    FxImpactWater = EffectTemplate.AOblivionCannonHit02,
}

AQuantumAutogun = Class(SinglePolyTrailProjectile) {
	FxImpactLand = EffectTemplate.Aeon_DualQuantumAutoGunHitLand,
    FxImpactNone = EffectTemplate.Aeon_DualQuantumAutoGunHit,
    FxImpactProp = EffectTemplate.Aeon_DualQuantumAutoGunHit_Unit,  
    FxImpactWater = EffectTemplate.Aeon_DualQuantumAutoGunHitLand,   
    FxImpactUnit = EffectTemplate.Aeon_DualQuantumAutoGunHit_Unit,    
    
    PolyTrail = EffectTemplate.Aeon_DualQuantumAutoGunProjectileTrail, 
    FxTrails = EffectTemplate.Aeon_DualQuantumAutoGunFxTrail,
    FxImpactProjectile = {},
}

SLosaareAAAutoCannon = Class(MultiPolyTrailProjectile) {

	FxImpactLand = EffectTemplate.SLosaareAutoCannonHit,
    FxImpactNone= EffectTemplate.SLosaareAutoCannonHit,
    FxImpactProp = EffectTemplate.SLosaareAutoCannonHit,    
    FxImpactAirUnit = EffectTemplate.SLosaareAutoCannonHit,
    PolyTrails = EffectTemplate.SLosaareAutoCannonProjectileTrail,
    PolyTrailOffset = {0,0},
}

SLosaareAAAutoCannon02 = Class(SLosaareAAAutoCannon) {

    PolyTrails = EffectTemplate.SLosaareAutoCannonProjectileTrail02,
    PolyTrailOffset = {0,0},
}

SDFExperimentalPhasonProjectile = Class(EmitterProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.SDFExperimentalPhasonProjFXTrails01,
    FxImpactUnit = EffectTemplate.SDFExperimentalPhasonProjHitUnit,
    FxImpactProp = EffectTemplate.SDFExperimentalPhasonProjHit01,
    FxImpactLand = EffectTemplate.SDFExperimentalPhasonProjHit01,
    FxImpactWater = EffectTemplate.SDFExperimentalPhasonProjHit01,
}

SDFSinnuntheWeaponProjectile = Class(EmitterProjectile) {
    FxTrails = EffectTemplate.SDFSinnutheWeaponFXTrails01,
    FxImpactUnit = EffectTemplate.SDFSinnutheWeaponHitUnit,
    FxImpactAirUnit = EffectTemplate.SDFSinnutheWeaponHitUnit,
    FxImpactProp = EffectTemplate.SDFSinnutheWeaponHit,
    FxImpactLand = EffectTemplate.SDFSinnutheWeaponHit,
    FxImpactWater = EffectTemplate.SDFSinnutheWeaponHit,
    FxImpactNone = EffectTemplate.SDFSinnutheWeaponHit,
}

CybBRMT3BTproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranT3BattleTankHit,
    FxUnitHitScale = 0.8,
    FxImpactProp = MCPEffectTemplate.CybranT3BattleTankHit,
    FxPropHitScale = 0.8,
    FxImpactLand = MCPEffectTemplate.CybranT3BattleTankHit,
    FxLandHitScale = 0.8,
    FxImpactUnderWater = MCPEffectTemplate.CybranT3BattleTankHit,
    FxImpactWater = MCPEffectTemplate.CybranT3BattleTankHit,
    FxTrailOffset = 0,
}

CybBRMT3BTRLproj = Class(SingleCompositeEmitterProjectile) {
    FxTrails = {},
	PolyTrail = '/effects/emitters/cybran_iridium_missile_polytrail_01_emit.bp',    
    BeamName = '/effects/emitters/rocket_iridium_exhaust_beam_01_emit.bp',
    FxImpactUnit = MCPEffectTemplate.CybranT3BattleTankRocketHit,
    FxUnitHitScale = 0.85,
    FxImpactProp = MCPEffectTemplate.CybranT3BattleTankRocketHit,
    FxPropHitScale = 0.85,
    FxImpactLand = MCPEffectTemplate.CybranT3BattleTankRocketHit,
    FxLandHitScale = 0.85,
    FxImpactUnderWater = MCPEffectTemplate.CybranT3BattleTankRocketHit,
    FxImpactWater = MCPEffectTemplate.CybranT3BattleTankRocketHit,
    FxWaterHitScale = 0.85,
    FxTrailOffset = 0,
}

AeonBROT1BTproj = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
		'/effects/emitters/aeon_laser_trail_02_emit.bp',
		'/effects/emitters/default_polytrail_03_emit.bp',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.ADisruptorHit01,
    FxImpactProp = EffectTemplate.ADisruptorHit01,
    FxImpactLand = EffectTemplate.ADisruptorHit01,
    FxUnitHitScale = 4,
    FxLandHitScale = 4,
    FxPropHitScale = 4,
    FxImpactUnderWater = {},
}

AeonBROT2HTproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = EffectTemplate.ALightDisplacementAutocannonMissilePolyTrails,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.AEONT2HEAVYHOVERTANKHIT,
    FxUnitHitScale = 1,
    FxImpactProp = MCPEffectTemplate.AEONT2HEAVYHOVERTANKHIT,
    FxPropHitScale = 1,
    FxImpactLand = MCPEffectTemplate.AEONT2HEAVYHOVERTANKHIT,
    FxLandHitScale = 1,
    FxImpactUnderWater = {},
}

UefBRNT3WKproj = Class(MultiPolyTrailProjectile) {
    FxTrails = EffectTemplate.TPlasmaCannonHeavyMunition,
    RandomPolyTrails = 1,
    PolyTrailOffset = {0,0,0},
    PolyTrails = EffectTemplate.TPlasmaCannonHeavyPolyTrails,
    FxImpactUnit = MCPEffectTemplate.UEFHeavyMechHit01,
    FxUnitHitScale = 1.0,
    FxImpactProp = MCPEffectTemplate.UEFHeavyMechHit01,
    FxPropHitScale = 1.0,
    FxImpactLand = MCPEffectTemplate.UEFHeavyMechHit01,
    FxLandHitScale = 1.0,
    FxImpactUnderWater = MCPEffectTemplate.UEFHeavyMechHit01,
    FxImpactWater = MCPEffectTemplate.UEFHeavyMechHit01,
    FxWaterHitScale = 1.0,
}

UefBRNT3WKRLproj = Class(MultiPolyTrailProjectile) {
    FxInitial = {},
    TrailDelay = 1,
    FxTrails = {'/effects/emitters/missile_sam_munition_trail_01_emit.bp',},
    FxTrailOffset = -0.5,
    FxImpactUnit = EffectTemplate.TShipGaussCannonHit02,
    FxUnitHitScale = 1.8,
    FxImpactProp = EffectTemplate.TShipGaussCannonHit02,
    FxPropHitScale = 1.8,
    FxImpactLand = EffectTemplate.TShipGaussCannonHit02,
    FxLandHitScale = 1.8,
    FxImpactUnderWater = EffectTemplate.TShipGaussCannonHit02,
    FxImpactWater = EffectTemplate.TShipGaussCannonHit02,
}

UefBRNT1MTproj = Class(MultiPolyTrailProjectile) {
    FxTrails = {},
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = MCPEffectTemplate.UefT1MedTankHit,
    FxUnitHitScale = 0.7,
    FxImpactProp = MCPEffectTemplate.UefT1MedTankHit,
    FxPropHitScale = 0.7,
    FxImpactLand = MCPEffectTemplate.UefT1MedTankHit,
    FxLandHitScale = 0.7,
    FxImpactUnderWater = MCPEffectTemplate.UefT1MedTankHit,
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
}

AeonBROT3HTproj = Class(MultiPolyTrailProjectile) {
	FxImpactTrajectoryAligned = false,
    FxTrails = EffectTemplate.TIonizedPlasmaGatlingCannonFxTrails,
    PolyTrails = {},
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxUnitHitScale = 3,
    FxImpactProp = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxPropHitScale = 3,
    FxImpactLand = EffectTemplate.TIonizedPlasmaGatlingCannonHit01,
    FxLandHitScale = 3,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

CybBRMT2HVY2proj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    FxImpactUnit = MCPEffectTemplate.CybranT2BattleTankHit,
    FxUnitHitScale = 0.55,
    FxImpactProp = MCPEffectTemplate.CybranT2BattleTankHit,
    FxPropHitScale = 0.55,
    FxImpactLand = MCPEffectTemplate.CybranT2BattleTankHit,
    FxLandHitScale = 0.55,
    FxImpactUnderWater = MCPEffectTemplate.CybranT2BattleTankHit,
    FxImpactWater = MCPEffectTemplate.CybranT2BattleTankHit,
    FxWaterHitScale = 0.55,
    FxTrailOffset = 0,
}

CybBRMT2HVYproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
        MCPEffectTemplate.CybProtonCannonPolyTrail,
        '/effects/emitters/default_polytrail_01_emit.bp',
    },
    PolyTrailOffset = {0,0}, 

    FxTrails = MCPEffectTemplate.CybProtonCannonFXTrail01,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    #PolyTrail = EffectTemplate.CHvyProtonCannonPolyTrail,
    FxImpactUnit = MCPEffectTemplate.CybranT1BattleTankHit,
    FxUnitHitScale = 1.1,
    FxImpactProp = MCPEffectTemplate.CybranT1BattleTankHit,
    FxPropHitScale = 1.1,
    FxImpactLand = MCPEffectTemplate.CybranT1BattleTankHit,
    FxLandHitScale = 1.1,
    FxImpactUnderWater = MCPEffectTemplate.CybranT1BattleTankHit,
    FxImpactWater = MCPEffectTemplate.CybranT1BattleTankHit,
    FxTrailOffset = 0,
}

AeonBROT3EXM1proj = Class(MultiPolyTrailProjectile) {
    FxTrails = {
        '/effects/emitters/quantum_cannon_munition_03_emit.bp',
        '/effects/emitters/quantum_cannon_munition_04_emit.bp',
    },
    PolyTrail = '/effects/emitters/quantum_cannon_polytrail_01_emit.bp',
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = MCPEffectTemplate.AeonGraniteHit01,
    FxImpactProp = MCPEffectTemplate.AeonGraniteHit01,
    FxImpactLand = MCPEffectTemplate.AeonGraniteHit01,
    FxUnitHitScale = 1,
    FxLandHitScale = 1,
    FxPropHitScale = 1,
    FxImpactUnderWater = {},
}

NapalmMissile = Class(SingleCompositeEmitterProjectile) {
    FxInitial = {},
    TrailDelay = 0,
    FxTrails = {'/effects/emitters/missile_sam_munition_trail_01_emit.bp',},
    FxTrailOffset = 0,
    PolyTrail = '/effects/emitters/default_polytrail_01_emit.bp',
    BeamName = '/effects/emitters/rocket_iridium_exhaust_beam_01_emit.bp',
    FxImpactUnit = {
        '/mods/MCP/effects/emitters/napalm_fire_emit_2.bp',
        '/effects/emitters/napalm_01_emit.bp',
    },
    FxImpactProp = {
        '/mods/MCP/effects/emitters/napalm_fire_emit_2.bp',
        '/effects/emitters/napalm_01_emit.bp',
    },
    FxImpactLand = {
        '/mods/MCP/effects/emitters/napalm_fire_emit_2.bp',
        '/effects/emitters/napalm_01_emit.bp',
    },
    FxImpactWater = EffectTemplate.TNapalmHvyCarpetBombHitWater01,
    FxImpactUnderWater = {},
	FxLandHitScale = 2,
    FxPropHitScale = 2,
    FxUnitHitScale = 2,
	FxImpactWaterScale = 2,
}

CybBRMT3MCM4RLproj = Class(MultiPolyTrailProjectile) {
	FxTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_03_brightglow_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_04_smoke_emit.bp',
	},
	FxTrailOffset = 0.2,
	PolyTrails  = {
            '/mods/MCP/effects/emitters/w_u_gau03_p_01_polytrails_emit.bp',
            '/mods/MCP/effects/emitters/w_u_gau03_p_02_polytrails_emit.bp',
	},
	PolyTrailOffset = {0.3,0},

    FxImpactUnit = MCPEffectTemplate.BattleMech2RocketHit,
    FxUnitHitScale = 1.3,
    FxImpactProp = MCPEffectTemplate.BattleMech2RocketHit,
    FxPropHitScale = 1.3,
    FxImpactLand = MCPEffectTemplate.BattleMech2RocketHit,
    FxLandHitScale = 1.3,
    FxImpactUnderWater = MCPEffectTemplate.BattleMech2RocketHit,
    FxImpactWater = MCPEffectTemplate.BattleMech2RocketHit,
    FxWaterHitScale = 1.3,
    FxTrailOffset = 0,
}

CybMadCatMolecular = Class(MultiPolyTrailProjectile) {
    FxImpactTrajectoryAligned = false,
    PolyTrail = '/effects/emitters/default_polytrail_03_emit.bp',
    FxTrails = EffectTemplate.CMolecularCannon01,
    FxImpactUnit = MCPEffectTemplate.CybranT2BattleTankHit,
    FxUnitHitScale = 1.3,
    FxImpactProp = MCPEffectTemplate.CybranT2BattleTankHit,
    FxPropHitScale = 1.3,
    FxImpactLand = MCPEffectTemplate.CybranT2BattleTankHit,
    FxLandHitScale = 1.3,
    FxImpactUnderWater = MCPEffectTemplate.CybranT2BattleTankHit,
    FxImpactWater = MCPEffectTemplate.CybranT2BattleTankHit,
    FxTrailOffset = 0,
}

COrbitalHeavyBolterCanonProjectile = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
		'/effects/emitters/electron_bolter_trail_01_emit.bp',
		'/effects/emitters/default_polytrail_05_emit.bp',
	},
	PolyTrailOffset = {0,0},  
    FxTrails = {'/effects/emitters/electron_bolter_munition_02_emit.bp',},
	FxTrailScale = 4,
	
	# Hit Effects
	FxUnitHitScale = 20,
    FxImpactAirUnit = EffectTemplate.CElectronBolterHit04,
	FxAirUnitHitScale = 13,

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        CreateLightParticle( self, -1, army, 12, 28, 'glow_03', 'ramp_proton_flash_02' )
        CreateLightParticle( self, -1, army, 8, 22, 'glow_03', 'ramp_antimatter_02' )
        if targetType == 'Terrain' then
            CreateSplat( self:GetPosition(), 0, 'scorch_011_albedo', 12, 12, 150, 200, army )
        end

        local blanketSides = 12
        local blanketAngle = (2*math.pi) / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 6.25

        for i = 0, (blanketSides-1) do
            local blanketX = math.sin(i*blanketAngle)
            local blanketZ = math.cos(i*blanketAngle)
            self:CreateProjectile('/effects/entities/EffectProtonAmbient01/EffectProtonAmbient01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ)
                :SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end

        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

SC2SinglePolyTrailProjectile = Class(EmitterProjectile) {

    PolyTrail = '',
    PolyTrailOffset = 0,
    FxTrails = {},

    OnCreate = function(self)
        EmitterProjectile.OnCreate(self)
        if self.PolyTrail != '' then
            CreateTrail(self, -1, self:GetArmy(), self.PolyTrail):OffsetEmitter(0, 0, self.PolyTrailOffset)
        end
    end,
}

CybBRMT1BMproj = Class(MultiPolyTrailProjectile) {
    PolyTrails = MCPEffectTemplate.LightLaserPolyTrail,
    FxImpactUnit = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxUnitHitScale = 0.6,
    FxImpactProp = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxPropHitScale = 0.6,
    FxImpactLand = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxLandHitScale = 0.6,
    FxImpactUnderWater = EffectTemplate.TPlasmaGatlingCannonUnitHit,
    FxImpactWater = EffectTemplate.TPlasmaGatlingCannonUnitHit,
}

SHeavyQuarnonOrbitalCannon = Class(MultiPolyTrailProjectile) {
    FxImpactNone = EffectTemplate.SHeavyQuarnonCannonHit,   
    FxImpactAirUnit = EffectTemplate.SHeavyQuarnonCannonUnitHit,
    PolyTrails = EffectTemplate.SHeavyQuarnonCannonProjectilePolyTrails,
	PolyTrailsScale = 5,
    PolyTrailOffset = {0,0,0},
    FxTrails = EffectTemplate.SHeavyQuarnonCannonProjectileFxTrails,
	FxTrailScale = 5,
	FxAirUnitHitScale = 5,
}

TFragmentationGrenadeMK02 = Class(EmitterProjectile) {
    FxImpactUnit = MCPEffectTemplate.THeavyFragmentationGrenadeHitMK,
    FxImpactLand = MCPEffectTemplate.THeavyFragmentationGrenadeHitMK,
    FxImpactWater = MCPEffectTemplate.THeavyFragmentationGrenadeHitMK,
    FxImpactNone = MCPEffectTemplate.THeavyFragmentationGrenadeHitMK,
    FxImpactProp = MCPEffectTemplate.THeavyFragmentationGrenadeHitMK,
    FxImpactUnderWater = {},
    FxTrails= EffectTemplate.THeavyFragmentationGrenadeFxTrails,
    #PolyTrail= EffectTemplate.THeavyFragmentationGrenadePolyTrail,
}

TArtilleryAntiMatterProjectile05 = Class(SinglePolyTrailProjectile) {
    FxLandHitScale = 1,
    FxUnitHitScale = 0.4,
    FxSplatScale = 5,
	PolyTrail = '/effects/emitters/default_polytrail_07_emit.bp',
	
    # Hit Effects
    FxImpactUnit = EffectTemplate.TAntiMatterShellHit02,
    FxImpactLand = EffectTemplate.TAntiMatterShellHit02,
    FxImpactProp = EffectTemplate.TAntiMatterShellHit02,
    FxImpactWater = MCPEffectTemplate.DefaultProjectileWaterImpact,
    FxSplatScale = 5,
	
    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        #CreateLightParticle( self, -1, army, 16, 6, 'glow_03', 'ramp_antimatter_02' )
        if targetType == 'Terrain' then
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_001_normals', '', 'Alpha Normals', self.FxSplatScale, self.FxSplatScale, 150, 30, army )
            CreateDecal( self:GetPosition(), util.GetRandomFloat(0,2*math.pi), 'nuke_scorch_002_albedo', '', 'Albedo', self.FxSplatScale * 2, self.FxSplatScale * 2, 150, 30, army )
            self:ShakeCamera(20, 1, 0, 1)
        end
        local pos = self:GetPosition()
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}

CybBRMT3ADVBTBOTproj = Class(MultiPolyTrailProjectile) {

	PolyTrails  = {
        '/mods/MCP/effects/emitters/BRMT3ADVBTBOT_polytrails_emit.bp',
		'/effects/emitters/disintegrator_polytrail_02_emit.bp',
		'/effects/emitters/disintegrator_polytrail_03_emit.bp',
		'/effects/emitters/default_polytrail_03_emit.bp',
	},
    FxImpactUnit = MCPEffectTemplate.CybranT3AdvancedBattleBotHit01,
    FxUnitHitScale = 1.25,
    FxImpactProp = MCPEffectTemplate.CybranT3AdvancedBattleBotHit01,
    FxPropHitScale = 1.25,
    FxImpactLand = MCPEffectTemplate.CybranT3AdvancedBattleBotHit01,
    FxLandHitScale = 1.25,
    FxTrailOffset = 0,
    PolyTrailOffset = {0,0,0,0},
    FxImpactUnderWater = {},
}