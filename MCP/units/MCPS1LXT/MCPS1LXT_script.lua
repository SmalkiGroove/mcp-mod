local SWalkingLandUnit = import('/lua/seraphimunits.lua').SWalkingLandUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SDFHeavyQuarnonCannon = SeraphimWeapons.SDFHeavyQuarnonCannon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MCPS1LXT = Class(SWalkingLandUnit) {
    
    Weapons = {
        BackTurret = Class(SDFHeavyQuarnonCannon) {
            FxMuzzleFlashScale = 2.0,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        SWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self:CreatTheEffects()
        self.Trash:Add(CreateRotator(self, 'Object05', 'y', nil, 350, 0, 0))
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        SWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
    end,

    CreatTheEffects = function(self)
        local army =  self:GetArmy()
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'rl01', army, v):ScaleEmitter(0.8))
        end
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'rl01', army, v):ScaleEmitter(0.8))
        end
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'rl01', army, v):ScaleEmitter(0.8))
        end
        for k, v in EffectTemplate['UpgradeUnitAmbient'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'rl01', army, v):ScaleEmitter(0.5))
        end
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'rl01', army, v):ScaleEmitter(1.3))
        end
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'Turret_Barrel_Muzzle01', army, v):ScaleEmitter(1.6))
        end
        for k, v in EffectTemplate['SeraphimAirStagePlat01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'Turret_Barrel_Muzzle', army, v):ScaleEmitter(1.6))
        end
    end,

    OnKilled = function(self, instigator, damagetype, overkillRatio)
        SWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()
    end,

    CreatTheEffectsDeath = function(self)
        local army =  self:GetArmy()
        for k, v in MCPEffectTemplate['SerT1AdvancedTankHit01'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'BRPT1EXTANK2', army, v):ScaleEmitter(2.7))
        end
    end,
    
}

TypeClass = MCPS1LXT