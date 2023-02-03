local _UefAAMissile = import('/mods/MCP/lua/MCPProjectiles.lua').UefAAMissile
UefAAMissile = Class(_UefAAMissile) {

    OnCreate = function(self)
        _UefAAMissile.OnCreate(self)
        self:ForkThread(self.UpdateThread)
    end,

    UpdateThread = function(self)
        WaitSeconds(1.5)
        self:SetMaxSpeed(70)
        self:SetAcceleration(10 + Random() * 8)
        self:ChangeMaxZigZag(0.5)
        self:ChangeZigZagFrequency(2)
    end,

    OnImpact = function(self, TargetType, TargetEntity)
        _UefAAMissile.OnImpact(self, TargetType, TargetEntity)
    end,
}

TypeClass = UefAAMissile

