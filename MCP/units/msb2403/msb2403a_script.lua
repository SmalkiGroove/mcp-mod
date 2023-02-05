local SShieldLandUnit = import('/lua/seraphimunits.lua').SShieldLandUnit
local SeraLambdaFieldDestroyer = import('/mods/MCP/lua/MCPDefaultAntiProjectile.lua').SeraLambdaFieldDestroyer

MSB2403A = Class(SShieldLandUnit) {
    -- Sets up parent call backs between drone and parent
    Parent = nil,

    SetParent = function(self, parent, droneName)
        self.Parent = parent
        self.Drone = droneName
    end,

    ShieldEffects = {
        '/effects/emitters/seraphim_shield_generator_t3_03_emit.bp',
        '/effects/emitters/seraphim_shield_generator_t2_03_emit.bp',
    },

    OnCreate = function(self, builder, layer)
        SShieldLandUnit.OnCreate(self, builder, layer)
        self.ShieldEffectsBag = {}
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
            self.ShieldEffectsBag = {}
        end

        for k, v in self.ShieldEffects do
            table.insert(self.ShieldEffectsBag, CreateAttachedEmitter(self, 0, self:GetArmy(), v):ScaleEmitter(1))
        end

        local bp = self:GetBlueprint().Defense.LambdaField
        local field = SeraLambdaFieldDestroyer {
            Owner = self,
            Radius = bp.Radius,
            AttachBone = bp.AttachBone,
            Probability = bp.Probability
        }

        self.Trash:Add(field)
        self.UnitComplete = true
    end,

    -- Make this unit invulnerable
    OnDamage = function()
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        if self.ShieldEffctsBag then
            for k,v in self.ShieldEffectsBag do
                v:Destroy()
            end
        end
        SShieldLandUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    DeathThread = function(self)
        self:Destroy()
    end,
}

TypeClass = MSB2403A
