local UefBRNAT2FIGHTERproj = import('/mods/MCP/lua/MCPProjectiles.lua').UefBRNAT2FIGHTERproj
BRNAT2FIGHTERproj = Class(UefBRNAT2FIGHTERproj) {

    OnCreate = function(self)
        UefBRNAT2FIGHTERproj.OnCreate(self)
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
        UefBRNAT2FIGHTERproj.OnImpact(self, TargetType, TargetEntity)
    end,
}

TypeClass = BRNAT2FIGHTERproj

