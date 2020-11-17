local WeaponFile = import('/lua/sim/defaultweapons.lua')
local CollisionBeamFile = import('/lua/defaultcollisionbeams.lua')
local MCPCollisionBeamFile = import('/mods/MCP/lua/MCPDefaultCollisionBeams.lua')
local MiniQuantumBeamGeneratorCollisionBeam = MCPCollisionBeamFile.MiniQuantumBeamGeneratorCollisionBeam
local SuperQuantumBeamGeneratorCollisionBeam = MCPCollisionBeamFile.SuperQuantumBeamGeneratorCollisionBeam
local HawkTractorClawCollisionBeam = MCPCollisionBeamFile.HawkTractorClawCollisionBeam
local MiniPhasonLaserCollisionBeam = MCPCollisionBeamFile.MiniPhasonLaserCollisionBeam
local YenaothaExperimentalLaserCollisionBeam = MCPCollisionBeamFile.YenaothaExperimentalLaserCollisionBeam
local TDFGoliathCollisionBeam = MCPCollisionBeamFile.TDFGoliathCollisionBeam
local JuggLaserCollisionBeam = MCPCollisionBeamFile.JuggLaserCollisionBeam
local MartyrMicrowaveLaserCollisionBeam01 = MCPCollisionBeamFile.MartyrMicrowaveLaserCollisionBeam01
local GoldenLaserCollisionBeam01 = MCPCollisionBeamFile.GoldenLaserCollisionBeam01
local KamikazeWeapon = WeaponFile.KamikazeWeapon
local BareBonesWeapon = WeaponFile.BareBonesWeapon
local DefaultProjectileWeapon = WeaponFile.DefaultProjectileWeapon
local DefaultBeamWeapon = WeaponFile.DefaultBeamWeapon
local GinsuCollisionBeam = CollisionBeamFile.GinsuCollisionBeam
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local QuantumBeamGeneratorCollisionBeam = CollisionBeamFile.QuantumBeamGeneratorCollisionBeam
local PhasonLaserCollisionBeam = CollisionBeamFile.PhasonLaserCollisionBeam
local MicrowaveLaserCollisionBeam01 = CollisionBeamFile.MicrowaveLaserCollisionBeam01

HawkNapalmWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TGaussCannonFlash,
}

RebelArtilleryProtonWeapon = Class(DefaultProjectileWeapon) {
}

MiniQuantumBeamGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MiniQuantumBeamGeneratorCollisionBeam,

    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 0.2,

    PlayFxWeaponUnpackSequence = function( self )
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(0.2)
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

SuperQuantumBeamGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.SuperQuantumBeamGeneratorCollisionBeam,

    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(1)
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

MiniPhasonLaser = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MiniPhasonLaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 0.002,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(0.002)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

MiniHeavyMicrowaveLaserGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MiniMicrowaveLaserCollisionBeam01,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,

    IdleState = State(DefaultBeamWeapon.IdleState) {
        Main = function(self)
            if self.RotatorManip then
                self.RotatorManip:SetSpeed(0)
            end
            if self.SliderManip then
                self.SliderManip:SetGoal(0,0,0)
                self.SliderManip:SetSpeed(2)
            end
            DefaultBeamWeapon.IdleState.Main(self)
        end,
    },

    CreateProjectileAtMuzzle = function(self, muzzle)
        if not self.SliderManip then
            self.SliderManip = CreateSlider(self.unit, 'Center_Turret_Barrel')
            self.unit.Trash:Add(self.SliderManip)
        end
        if not self.RotatorManip then
            self.RotatorManip = CreateRotator(self.unit, 'Center_Turret_Barrel', 'z')
            self.unit.Trash:Add(self.RotatorManip)
        end
        self.RotatorManip:SetSpeed(180)
        self.SliderManip:SetPrecedence(11)
        self.SliderManip:SetGoal(0, 0, -1)
        self.SliderManip:SetSpeed(-1)
        DefaultBeamWeapon.CreateProjectileAtMuzzle(self, muzzle)
    end,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do 
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(0.2)  
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

HawkTractorClaw = Class(DefaultBeamWeapon) {
    BeamType = HawkTractorClawCollisionBeam,
    FxMuzzleFlash = {},

    PlayFxBeamStart = function(self, muzzle)
        local target = self:GetCurrentTarget()
        if not target or
            EntityCategoryContains(categories.STRUCTURE, target) or
            EntityCategoryContains(categories.COMMAND, target) or
            EntityCategoryContains(categories.EXPERIMENTAL, target) or
            EntityCategoryContains(categories.NAVAL, target) or
            EntityCategoryContains(categories.SUBCOMMANDER, target) or
           EntityCategoryContains(categories.TECH3, target) or
            not EntityCategoryContains(categories.ALLUNITS, target) then
            return
        end
        DefaultBeamWeapon.PlayFxBeamStart(self, muzzle)

        self.TT1 = self:ForkThread(self.TractorThread, target)
        self:ForkThread(self.TractorWatchThread, target)
    end,

    OnLostTarget = function(self)
        self:AimManipulatorSetEnabled(true)
        DefaultBeamWeapon.OnLostTarget(self)
    end,

    TractorThread = function(self, target)
        self.unit.Trash:Add(target)
        local beam = self.Beams[1].Beam
        if not beam then return end


        local muzzle = self:GetBlueprint().MuzzleSpecial
        if not muzzle then return end


        local pos0 = beam:GetPosition(0)
        local pos1 = beam:GetPosition(1)

        local dist = VDist3(pos0, pos1)

        self.Slider = CreateSlider(self.unit, muzzle, 0, 0, dist, -1, true)

        WaitFor(self.Slider)

        target:AttachBoneTo(-1, self.unit, muzzle)

        self.AimControl:SetResetPoseTime(10)
        target:SetDoNotTarget(true)

        self.Slider:SetSpeed(15)
        self.Slider:SetGoal(0,0,0)

        WaitFor(self.Slider)

        if not target:IsDead() then
            target:Kill()
        end
        self.AimControl:SetResetPoseTime(2)
    end,

    TractorWatchThread = function(self, target)
        while not target:IsDead() do
            WaitTicks(1)
        end
        KillThread(self.TT1)
        self.TT1 = nil
        if self.Slider then
            self.Slider:Destroy()
            self.Slider = nil
        end
        self.unit:DetachAll(self:GetBlueprint().MuzzleSpecial or 0)
        self:ResetTarget()
        self.AimControl:SetResetPoseTime(2)
    end,
}

MartyrHeavyMicrowaveLaserGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MartyrMicrowaveLaserCollisionBeam01,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,
}

RailLaserGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.RailLaserCollisionBeam01,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,
}

--UEF heavy tank railgun and laser
RailGunWeapon01 = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
        '/mods/MCP/effects/emitters/x_cannon_charge_test_01_emit.bp',
    },
    FxMuzzleFlash = {
        '/mods/MCP/effects/emitters/xcannon_cannon_muzzle_01_emit.bp',
        '/mods/MCP/effects/emitters/x_cannon_fire_test_01_emit.bp',
        '/mods/MCP/effects/emitters/jugg_rail_cannon_muzzle_07_emit.bp',
        '/mods/MCP/effects/emitters/jugg_rail_cannon_muzzle_08_emit.bp',
    },
    FxMuzzleFlashScale = 0.25,
    FxChargeMuzzleFlashScale = 0.25,
}

RailGunWeapon02 = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
        '/mods/MCP/effects/emitters/x_cannon_charge_test_01_emit.bp',
    },
    FxMuzzleFlash = {
        '/mods/MCP/effects/emitters/xcannon_cannon_muzzle_01_emit.bp',
        '/mods/MCP/effects/emitters/x_cannon_fire_test_01_emit.bp',
        '/mods/MCP/effects/emitters/jugg_rail_cannon_muzzle_07_emit.bp',
        '/mods/MCP/effects/emitters/jugg_rail_cannon_muzzle_08_emit.bp',
    },
    FxMuzzleFlashScale = 0.75,
    FxChargeMuzzleFlashScale = 0.75,
}

JuggLaserweapon = Class(DefaultBeamWeapon) {
    BeamType = JuggLaserCollisionBeam,

    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 0.2,

    PlayFxWeaponUnpackSequence = function( self )
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(0.2)
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

XCannonWeapon01 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlashScale = 1.2,
    FxChargeMuzzleFlashScale = 5,
}

HailfireLauncherWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.HailfireLauncherExhaust,
}

ShadowCannonWeapon01 = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_01_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_02_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_05_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_04_emit.bp',
    },
    
    FxMuzzleFlash = {
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_01_emit.bp',
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_02_emit.bp',
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_05_emit.bp',
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_06_emit.bp',
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_07_emit.bp',
        '/mods/MCP/effects/emitters/shadow_cannon_muzzle_08_emit.bp',
        '/mods/MCP/effects/emitters/shadow_hit_10_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_flash_01_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_flash_02_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_flash_03_emit.bp',
    },
    
    FxMuzzleFlashScale = 0.5,
    FxChargeMuzzleFlashScale = 1,
}

BassieCannonWeapon01 = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_01_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_02_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_05_emit.bp',
        '/mods/MCP/effects/emitters/shadow_muzzle_charge_04_emit.bp',
    },
    
    FxMuzzleFlash = {
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_01_emit.bp',
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_02_emit.bp',
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_05_emit.bp',
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_06_emit.bp',
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_07_emit.bp',
        '/mods/MCP/effects/emitters/bassie_cannon_muzzle_08_emit.bp',
        '/mods/MCP/effects/emitters/bassie_hit_10_emit.bp',
        '/mods/MCP/effects/emitters/bassie_muzzle_flash_01_emit.bp',
        '/mods/MCP/effects/emitters/bassie_muzzle_flash_02_emit.bp',
        '/mods/MCP/effects/emitters/bassie_muzzle_flash_03_emit.bp',
    },
    FxMuzzleFlashScale = 0.5,
    FxChargeMuzzleFlashScale = 1,
}

StunZapperWeapon = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.EMCHPRFDisruptorBeam,
    FxMuzzleFlash = {'/effects/emitters/cannon_muzzle_flash_01_emit.bp',},
    FxMuzzleFlashScale = 2,
}

ZCannonWeapon = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = MCPEffectTemplate.ZCannonChargeMuzzleFlash,
    FxMuzzleFlash = MCPEffectTemplate.ZCannonMuzzleFlash,
    FxMuzzleFlashScale = 2.5,
    Version = 1,
    
    PlayFxRackSalvoReloadSequence = function(self)
        for i = 1, 40 do
        local fxname
            if i < 10 then
                fxname = 'AMC' .. self.Cannon .. 'Steam0' .. i
            else
                fxname = 'AMC' .. self.Cannon .. 'Steam' .. i
            end
            for k, v in self.unit.SteamEffects do
                table.insert(self.unit.SteamEffectsBag, CreateAttachedEmitter(self.unit, fxname, self.unit:GetArmy(), v ))
            end
        end
        ZCannonWeapon.PlayFxRackSalvoChargeSequence(self)
    end,
}

YCannonWeapon = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = MCPEffectTemplate.YCannonMuzzleChargeFlash,
    FxMuzzleFlash = MCPEffectTemplate.YCannonMuzzleFlash,
    FxMuzzleFlashScale = 2,
}

ScorpDisintegratorWeapon = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {},
    FxMuzzleFlash = {
        '/effects/emitters/disintegratorhvy_muzzle_flash_01_emit.bp',
        '/effects/emitters/disintegratorhvy_muzzle_flash_02_emit.bp',
        '/effects/emitters/disintegratorhvy_muzzle_flash_03_emit.bp',
        '/effects/emitters/disintegratorhvy_muzzle_flash_04_emit.bp',
        '/effects/emitters/disintegratorhvy_muzzle_flash_05_emit.bp',
    },
    FxMuzzleFlashScale = 0.2,
}

HawkMissileTacticalSerpentineWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = { '/effects/emitters/aeon_missile_launch_02_emit.bp', },
}

LambdaWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SDFExperimentalPhasonProjMuzzleFlash,
    FxChargeMuzzleFlash = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
}

ArtemisWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.ArtemisMuzzleFlash,
    FxChargeMuzzleFlash = MCPEffectTemplate.ArtemisMuzzleChargeFlash,
    FxMuzzleFlashScale = 2,
    FxChargeMuzzleFlashScale = 2,
}

TDFGoliathShoulderBeam = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.TDFGoliathCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

HawkGaussCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TGaussCannonFlash,
}

UEFNavyMineWeapon = Class(KamikazeWeapon){
    FxDeath = MCPEffectTemplate.NavalMineHit01,

    OnFire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end
        KamikazeWeapon.OnFire(self)
    end,
}

UEFNavyMineDeathWeapon = Class(BareBonesWeapon) {
    FxDeath = MCPEffectTemplate.NavalMineHit01,
    
    OnCreate = function(self)
        BareBonesWeapon.OnCreate(self)
        self:SetWeaponEnabled(false)   
    end,

    OnFire = function(self)
    end,
    
    Fire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end
        local myBlueprint = self:GetBlueprint()
        DamageArea(self.unit, self.unit:GetPosition(), myBlueprint.DamageRadius, myBlueprint.Damage, myBlueprint.DamageType or 'Normal', myBlueprint.DamageFriendly or false)
    end,    
}

AeonMineDeathWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {
        '/effects/emitters/default_muzzle_flash_01_emit.bp',
        '/effects/emitters/default_muzzle_flash_02_emit.bp',
        '/effects/emitters/torpedo_underwater_launch_01_emit.bp',
    },
    OnWeaponFired = function(self)
        self.unit:Kill()
    end,
}

SeraNavyMineWeapon = Class(KamikazeWeapon){
    FxDeath = MCPEffectTemplate.SDFExperimentalPhasonProjHit01,

    OnFire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end
        KamikazeWeapon.OnFire(self)
    end,
}

SeraNavyMineDeathWeapon = Class(BareBonesWeapon) {
    FxDeath = MCPEffectTemplate.MineExplosion01,
    
    OnCreate = function(self)
        BareBonesWeapon.OnCreate(self)
        self:SetWeaponEnabled(false)   
    end,
    

    OnFire = function(self)
    end,
    
    Fire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end 
        local myBlueprint = self:GetBlueprint()
        DamageArea(self.unit, self.unit:GetPosition(), myBlueprint.DamageRadius, myBlueprint.Damage, myBlueprint.DamageType or 'Normal', myBlueprint.DamageFriendly or false)
    end,
}

SeraMineDeathExplosion = Class(BareBonesWeapon) {
    FxDeath = MCPEffectTemplate.MineExplosion01,
    
    OnCreate = function(self)
        BareBonesWeapon.OnCreate(self)
        self:SetWeaponEnabled(false)   
    end,
    

    OnFire = function(self)
    end,
    
    Fire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end
        local myBlueprint = self:GetBlueprint()
        DamageArea(self.unit, self.unit:GetPosition(), myBlueprint.DamageRadius, myBlueprint.Damage, myBlueprint.DamageType or 'Normal', myBlueprint.DamageFriendly or false)
    end,    
}

SeraMineExplosion = Class(KamikazeWeapon){
    FxDeath = MCPEffectTemplate.MineExplosion01,

    OnFire = function(self)
        local army = self.unit:GetArmy()
        for k, v in self.FxDeath do
            CreateEmitterAtBone(self.unit,-2,army,v)
        end
        KamikazeWeapon.OnFire(self)
    end,
}

MGAALaserWeapon = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MGAALaserCollisionBeam,
    FxMuzzleFlash = {'/effects/emitters/particle_cannon_muzzle_01_emit.bp'},
}

GoldenLaserGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.GoldenLaserCollisionBeam01,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
}

RedHeavyTurboLaserWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.RedLaserMuzzleFlash01,
}

ArtemisLaserGenerator = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.GoldenLaserCollisionBeam01,
    FxMuzzleFlash = MCPEffectTemplate.ArtemisMuzzleFlash,
    FxMuzzleFlashEffectScale = 0.5,
    FxChargeMuzzleFlash = {},
}

BOHellstormGun = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TIFArtilleryMuzzleFlash,
    FxShellEject  = MCPEffectTemplate.HellStormGunShells,

    PlayFxMuzzleSequence = function(self, muzzle)
        DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
        for k, v in self.FxShellEject do
            CreateAttachedEmitter(self.unit, 'Spew', self.unit:GetArmy(), v)
        end
    end,
}

GoliathTMDGun = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPhalanxGunMuzzleFlash,
    FxShellEject  = EffectTemplate.TPhalanxGunShells,

    PlayFxMuzzleSequence = function(self, muzzle)
        DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
        for k, v in self.FxShellEject do
            CreateAttachedEmitter(self.unit, 'TMD_Barrel', self.unit:GetArmy(), v)
        end
    end,
}

YenzothaExperimentalLaser = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.YenaothaExperimentalLaserCollisionBeam,
    FxUpackingChargeEffects = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

YenzothaExperimentalLaser02 = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.YenaothaExperimentalLaser02CollisionBeam,
    FxUpackingChargeEffects = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
    FxUpackingChargeEffectScale = 0.2,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

ATeleWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TIFArtilleryMuzzleFlash
}

JuggPlasmaGatlingCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.JuggPlasmaGatlingCannonMuzzleFlash,
    FxShellEject  = MCPEffectTemplate.JuggPlasmaGatlingCannonShells,
    FxMuzzleFlashScale = 0.5,

    PlayFxMuzzleSequence = function(self, muzzle)
        DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
        for k, v in self.FxShellEject do
            CreateAttachedEmitter(self.unit, 'Left_Shells', self.unit:GetArmy(), v):ScaleEmitter(0.5)
            CreateAttachedEmitter(self.unit, 'Right_Shells', self.unit:GetArmy(), v):ScaleEmitter(0.5)
        end
    end,
}

CitadelHVMWeapon02 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TAAMissileLaunch,
}

CitadelHVMWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TAAMissileLaunch,
    
    CreateProjectileForWeapon = function(self, bone)
        local f_count = table.getn(self:GetBlueprint().RackBones[1].MuzzleBones)
        if not self.FireCounter or self.FireCounter == f_count then self.FireCounter = 0 end
        if not self.TargetTable then self.TargetTable = {} end
        
        if self.FireCounter == 0 then
            if self:GetCurrentTarget() then
                local PossibleTargetTable
                local aiBrain = self.unit:GetAIBrain()
                
                if self:GetCurrentTarget() then
                    PossibleTargetTable = aiBrain:GetUnitsAroundPoint( categories.AIR , self.unit:GetPosition(), self:GetBlueprint().MaxRadius ,'ENEMY') 
                    self.TargetTable = nil
                end
                
                if not self.TargetTable then self.TargetTable = {} end
                
                local targetcount = table.getn(PossibleTargetTable)
                local tablecounter = 0
                
                if targetcount >= f_count then
                    local max_targets = table.getn(PossibleTargetTable)
                    local ran_values = {}
                    repeat
                        local ra = Random(1, max_targets)
                        repeat
                            if table.find(ran_values, ra) then ra = Random(1, max_targets) end
                        until not table.find(ran_values, ra)
                        
                        table.insert(ran_values, ra)
                    until table.getn(ran_values) >= f_count
                    
                    for k, v in ran_values do
                        table.insert(self.TargetTable, PossibleTargetTable[v])
                        tablecounter = tablecounter + 1
                        if tablecounter >= f_count then
                            break 
                        end
                    end
                    
                else
                    for k, v in PossibleTargetTable do
                        table.insert(self.TargetTable, v)
                        tablecounter = tablecounter + 1
                        if tablecounter >= targetcount then
                            break 
                        end
                    end
                end
            end
        end

        self.FireCounter = self.FireCounter + 1
        local TableSize = table.getn(self.TargetTable)
        local n = self.FireCounter
        if self.TargetTable then
            if TableSize >= 1 then    
                if TableSize == f_count then    
                    local tar = self.TargetTable[n]
                    if not tar:BeenDestroyed() and not tar:IsDead() then
                        self:SetTargetEntity(tar)
                    end
                else 
                    local ran = Random(1, TableSize)
                    local tar = self.TargetTable[ran]
                    if not tar:BeenDestroyed() and not tar:IsDead() then
                        self:SetTargetEntity(tar)
                        if tar.Pointed ~= true then
                            tar.Pointed = true
                            tar:ForkThread(self.PointedThread, self)
                        end
                    end
                end
            end
        end
        CitadelHVMWeapon02.CreateProjectileForWeapon(self, bone)
    end,

    OnWeaponFired = function(self)
        self.FireCounter = 0
        CitadelHVMWeapon02.OnWeaponFired(self)
    end,

    PointedThread = function(tar, self)
        WaitSeconds(5)
        tar.Pointed = false
    end,
}

CitadelPlasmaGatlingCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.JuggPlasmaGatlingCannonMuzzleFlash,
    FxShellEject  = MCPEffectTemplate.JuggPlasmaGatlingCannonShells,
    FxMuzzleFlashScale = 0.5,

    PlayFxMuzzleSequence = function(self, muzzle)
        DefaultProjectileWeapon.PlayFxMuzzleSequence(self, muzzle)
        for k, v in self.FxShellEject do
            CreateAttachedEmitter(self.unit, 'Gat_Shells', self.unit:GetArmy(), v):ScaleEmitter(0.5)
        end
    end,
}

SonicDisruptorWave = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.SonicDisruptorWaveCBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

UEFACUHeavyPlasmaGatlingCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.UEFACUHeavyPlasmaGatlingCannonMuzzleFlash,
	FxMuzzleFlashScale = 0.35,
}

TMAnovacatbluelaserweapon = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.TMNovaCatBlueLaserBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,
}

BalrogMagmaCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.TMagmaCannonMuzzleFlash,
	FxMuzzleFlashScale = 1.25,
}

EXCEMPArrayBeam01 = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.EXCEMPArrayBeam01CollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
}

BPPPlasmaPPCProj = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = MCPEffectTemplate.BPPPlasmaPPCProjMuzzleFlash ,
    FxChargeMuzzleFlash = MCPEffectTemplate.BPPPlasmaPPCProjChargeMuzzleFlash,
}

CybranAriesBeam = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.CybranAriesBeam01,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self:EconomySupportsBeam() then return end
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do 
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)  
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

TMCSpiderLaserweapon = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.TMSpiderBeam,
    FxMuzzleFlash = EffectTemplate.SExperimentalUnstablePhasonLaserMuzzle01,
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 2,
}

TIFArtillery01Weapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaCannonHeavyMuzzleFlash,
}

CDFHeavyMicrowaveLaserGeneratorDefense =  Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.MicrowaveLaserCollisionBeam03,
    FxMuzzleFlash = {'/effects/emitters/laserturret_muzzle_flash_01_emit.bp',},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 0.5,

    PlayFxWeaponUnpackSequence = function( self )
        if not self:EconomySupportsBeam() then return end
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do 
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)  
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

ADFTractorClaw02 = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.TractorClawCollisionBeam02,
    FxMuzzleFlash = {},
   
    PlayFxBeamStart = function(self, muzzle)
        local target = self:GetCurrentTarget()
        if not target or
            EntityCategoryContains(categories.STRUCTURE, target) or
            EntityCategoryContains(categories.COMMAND, target) or
            EntityCategoryContains(categories.EXPERIMENTAL, target) or
            --EntityCategoryContains(categories.NAVAL, target) or
            EntityCategoryContains(categories.SUBCOMMANDER, target) or
            not EntityCategoryContains(categories.ALLUNITS, target) then
            return
        end

        target = self:GetRealTarget(target)
        
        if self:IsTargetAlreadyUsed(target) then 
            return 
        end
        
        ###Create vacuum suck up from ground effects on the unit targetted.
        for k, v in EffectTemplate.ACollossusTractorBeamVacuum01 do
            CreateEmitterAtEntity( target, target:GetArmy(),v ):ScaleEmitter(0.55*target:GetFootPrintSize()/0.55)
        end
        
        DefaultBeamWeapon.PlayFxBeamStart(self, muzzle)

        if not self.TT1 then
            self.TT1 = self:ForkThread(self.TractorThread, target)
            self:ForkThread(self.TractorWatchThread, target)
        end
    end,
    
    # override this function in the unit to check if another weapon already has this
    # unit as a target.  Target argument should not be a recon blip
    IsTargetAlreadyUsed = function(self, target)
        local weap
        for i = 1, self.unit:GetWeaponCount() do
            weap = self.unit:GetWeapon(i)
            if (weap != self) then
                if self:GetRealTarget(weap:GetCurrentTarget()) == target then
                    #LOG("Target already used by ", repr(weap:GetBlueprint().Label))
                    return true
                end
            end
        end
        return false
    end,

    #recon blip check
    GetRealTarget = function(self, target)
        if target and not IsUnit(target) then
            local unitTarget = target:GetSource()
            local unitPos = unitTarget:GetPosition()
            local reconPos = target:GetPosition()
            local dist = VDist2(unitPos[1], unitPos[3], reconPos[1], reconPos[3])
            if dist < 10 then
                return unitTarget
            end
        end
        return target      
    end,

    OnLostTarget = function(self)
        self:AimManipulatorSetEnabled(true)
        DefaultBeamWeapon.OnLostTarget(self)
        ###enabled= false
        ###self.unit:SetEnabled(false)
        DefaultBeamWeapon.PlayFxBeamEnd(self,self.Beams[1].Beam)
    end,

    TractorThread = function(self, target)
        self.unit.Trash:Add(target)
        local beam = self.Beams[1].Beam
        if not beam then return end


        local muzzle = self:GetBlueprint().MuzzleSpecial
        if not muzzle then return end

        target:SetDoNotTarget(true)
        local pos0 = beam:GetPosition(0)
        local pos1 = beam:GetPosition(1)
        local dist = VDist3(pos0, pos1)

        self.Slider = CreateSlider(self.unit, muzzle, 0, 0, dist, -1, true)

        WaitTicks(1)
        WaitFor(self.Slider)

        # just in case attach fails...
        target:SetDoNotTarget(false)
        target:AttachBoneTo(-1, self.unit, muzzle)
        target:SetDoNotTarget(true)
        
        self.AimControl:SetResetPoseTime(10)

        self.Slider:SetSpeed(10)
        self.Slider:SetGoal(0,0,0)
        
        WaitTicks(1)
        WaitFor(self.Slider)

        if not target:IsDead() then
            target.DestructionExplosionWaitDelayMin = 0
            target.DestructionExplosionWaitDelayMax = 0
            
            ##:ScaleEmitter(util.GetRandomFloat(ScaleMin, ScaleMax))
            ###CreateAttachedEmitter( self, bone, self.GetArmy(), blueprint ) 
            for kEffect, vEffect in EffectTemplate.ACollossusTractorBeamCrush01 do
                CreateEmitterAtBone( self.unit, muzzle , self.unit:GetArmy(), vEffect )###:ScaleEmitter(2.65)
            end
            
            target:Kill(self.unit, 'Damage', 100)
        end
        
        self.AimControl:SetResetPoseTime(2)
    end,

    TractorWatchThread = function(self, target)
        while not target:IsDead() do
            WaitTicks(1)
        end
        KillThread(self.TT1)
        self.TT1 = nil
        if self.Slider then
            self.Slider:Destroy()
            self.Slider = nil
        end
        self.unit:DetachAll(self:GetBlueprint().MuzzleSpecial or 0)
        self:ResetTarget()
        self.AimControl:SetResetPoseTime(2)
    end,
}

SDFHeavyQuarnon01Cannon = Class(DefaultProjectileWeapon) {
	FxMuzzleFlash = EffectTemplate.SHeavyQuarnonCannonMuzzleFlash,
}

SDFUltraChromaticBeamGenerator = Class( DefaultBeamWeapon ) {
    BeamType = CollisionBeamFile.UnstablePhasonLaserCollisionBeam,
	FxBeamTypeScale = 0.1,
    FxMuzzleFlash = {},
	FxMuzzleFlashScale = 0.1,
    FxChargeMuzzleFlash = {},
	FxChargeMuzzleFlashScale = 0.1,
    FxUpackingChargeEffects = EffectTemplate.SChargeUltraChromaticBeamGenerator,
    FxUpackingChargeEffectScale = 0.1,
    FxChargeMuzzleFlashScale = 0.1,
	ChargeEffectMuzzlesScale = 0.1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter( self.unit, ev, army, v ):ScaleEmitter( self.FxUpackingChargeEffectScale )
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence( self )
        end
    end,
}

TMAmizurabluelaserweapon = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.TMMizuraBlueLaserBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 1,
}

ADFCannonOblivionWeapon = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
		'/effects/emitters/oblivion_cannon_flash_01_emit.bp',
        '/effects/emitters/oblivion_cannon_flash_02_emit.bp',
        '/effects/emitters/oblivion_cannon_flash_03_emit.bp',
    },
}

ADFCannonOblivionWeapon02 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.AOblivionCannonMuzzleFlash02,
    FxChargeMuzzleFlash = EffectTemplate.AOblivionCannonChargeMuzzleFlash02,
}

AANDepthChargeBombWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp',},

    CreateProjectileForWeapon = function(self, bone)
        local proj = self:CreateProjectile(bone)
        local damageTable = self:GetDamageTable()
        local blueprint = self:GetBlueprint()
        local data = {
                Army = self.unit:GetArmy(),
                Instigator = self.unit,
                StartRadius = blueprint.DOTStartRadius,
                EndRadius = blueprint.DOTEndRadius,
                DOTtype = blueprint.DOTtype,
                Damage = blueprint.DoTDamage,
                Duration = blueprint.DoTDuration,
                Frequency = blueprint.DoTFrequency,
                Type = 'Normal',
            }

        if proj and not proj:BeenDestroyed() then
            proj:PassDamageData(damageTable)
            proj:PassData(data)
        end
        return proj
    end,
}

ADFQuantumAutogunWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.Aeon_DualQuantumAutoGunMuzzleFlash,
}

SDFSinnuntheWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SDFSinnutheWeaponMuzzleFlash,
    FxChargeMuzzleFlash = EffectTemplate.SDFSinnutheWeaponChargeMuzzleFlash
}

SAALosaareAutoCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SLosaareAutoCannonMuzzleFlash,
}
SAALosaareAutoCannonWeaponAirUnit = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SLosaareAutoCannonMuzzleFlashAirUnit,
}
SAALosaareAutoCannonWeaponSeaUnit = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SLosaareAutoCannonMuzzleFlashSeaUnit,
}

SDFExperimentalPhasonProj = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.SDFExperimentalPhasonProjMuzzleFlash,
    FxChargeMuzzleFlash = EffectTemplate.SDFExperimentalPhasonProjChargeMuzzleFlash,
}

CDFHeavyElectronBolter01Weapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.CElectronBolterMuzzleFlash02,
}

ExWifeMaincannonWeapon01 = Class(DefaultProjectileWeapon) {
    FxChargeMuzzleFlash = {
		'/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_charge_01_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_charge_02_emit.bp',
        '/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_charge_05_emit.bp',
    },
    FxMuzzleFlash = {
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_01_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_02_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_03_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_04_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_05_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_06_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_07_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_cannon_muzzle_08_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_hit_10_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_flash_01_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_flash_02_emit.bp',
		'/mods/MCP/effects/emitters/ExWifeMaincannon_muzzle_flash_03_emit.bp',
	},
	FxMuzzleFlashScale = 3,
	FxChargeMuzzleFlashScale = 5,
}

BasiliskAAMissile01 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {
        '/effects/emitters/cannon_muzzle_flash_04_emit.bp',
        '/effects/emitters/cannon_muzzle_smoke_11_emit.bp',
    },
    
    CreateProjectileForWeapon = function(self, bone)
            local f_count = table.getn(self:GetBlueprint().RackBones[1].MuzzleBones)
            if not self.FireCounter or self.FireCounter == f_count then self.FireCounter = 0 end
            if not self.TargetTable then self.TargetTable = {} end
            
            if self.FireCounter == 0 then
                if self:GetCurrentTarget() then
                    local PossibleTargetTable
                    local aiBrain = self.unit:GetAIBrain()
                    
                    if self:GetCurrentTarget() then
                        PossibleTargetTable = aiBrain:GetUnitsAroundPoint( categories.AIR , self.unit:GetPosition(), self:GetBlueprint().MaxRadius ,'ENEMY') 
                        self.TargetTable = nil
                    end
                    
                    if not self.TargetTable then self.TargetTable = {} end
                    
                    local targetcount = table.getn(PossibleTargetTable)
                    local tablecounter = 0
                    
                    if targetcount >= f_count then
                        local max_targets = table.getn(PossibleTargetTable)
                        local ran_values = {}
                        repeat
                            local ra = Random(1, max_targets)
                            repeat
                                if table.find(ran_values, ra) then ra = Random(1, max_targets) end
                            until not table.find(ran_values, ra)
                            
                            table.insert(ran_values, ra)
                        until table.getn(ran_values) >= f_count
                        
                        for k, v in ran_values do
                            table.insert(self.TargetTable, PossibleTargetTable[v])
                            tablecounter = tablecounter + 1
                            if tablecounter >= f_count then 
                                break 
                            end
                        end
                        
                    else
                        for k, v in PossibleTargetTable do
                            table.insert(self.TargetTable, v)
                            tablecounter = tablecounter + 1
                            if tablecounter >= targetcount then 
                                break 
                            end
                        end
                    end
                end
            end

            self.FireCounter = self.FireCounter + 1
            local TableSize = table.getn(self.TargetTable)
            local n = self.FireCounter
            if self.TargetTable then
                if TableSize >= 1 then    
                    if TableSize == f_count then    
                        local tar = self.TargetTable[n]
                        if not tar:BeenDestroyed() and not tar:IsDead() then
                            self:SetTargetEntity(tar)
                        end
                    else 
                        local ran = Random(1, TableSize)
                        local tar = self.TargetTable[ran]
                        if not tar:BeenDestroyed() and not tar:IsDead() then
                            self:SetTargetEntity(tar)
                            if tar.Pointed ~= true then
                                tar.Pointed = true
                                tar:ForkThread(self.PointedThread, self)
                            end
                        end
                    end
                end
            end
        BasiliskAAMissile02.CreateProjectileForWeapon(self, bone)
    end,

    OnWeaponFired = function(self)
        self.FireCounter = 0
        BasiliskAAMissile02.OnWeaponFired(self)
    end,
    
    PointedThread = function(tar, self)
        WaitSeconds(5)
        tar.Pointed = false
    end,
}

AIFMissileArrowWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = { '/effects/emitters/aeon_missile_launch_02_emit.bp', },
}

ALaserPhalanxWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {
        '/effects/emitters/flash_04_emit.bp',
    },
}

ColossusLaser = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.ColossusLaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 2,

    PlayFxWeaponUnpackSequence = function(self)
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(2)

                end
				
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

DreadnoughtLaser = Class(DefaultBeamWeapon) {
    BeamType = MCPCollisionBeamFile.DreadnoughtLaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = EffectTemplate.CMicrowaveLaserCharge01,
    FxUpackingChargeEffectScale = 0.0025,

    PlayFxWeaponUnpackSequence = function(self)
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale):ScaleEmitter(0.0025)

                end
				
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}