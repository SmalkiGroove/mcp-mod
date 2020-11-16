

function RegularAIEngineer(SuperClass)
    return Class(SuperClass) {
        OnCreate = function(self)
            SuperClass.OnCreate(self)
            if self:GetAIBrain().BrainType == 'Human' then
                self:AddBuildRestriction(categories.BUILTBYTIER3FIELD)
                if categories.BUILTBYFIELD then
                    self:AddBuildRestriction(categories.BUILTBYFIELD)
                end
            end
        end,
    }
end