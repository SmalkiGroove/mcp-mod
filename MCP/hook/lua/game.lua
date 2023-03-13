
do
    local OldGetConstructEconomyModel = GetConstructEconomyModel

    function GetConstructEconomyModel(builder, targetData, ...)
        local builder_bp = builder:GetBlueprint()

        if builder_bp.BlueprintId == targetData.HalfPriceUpgradeFromID
        or builder_bp.General.UpgradesTo == targetData.HalfPriceUpgradeFromID
        or builder_bp.Economy.BuilderDiscountMult
        then
            local build, energy, mass = OldGetConstructEconomyModel(builder, targetData, unpack(arg))
            local discount = targetData.UpgradeFromCostDiscount or builder_bp.Economy.BuilderDiscountMult or 0.5

            return build, energy * discount, mass * discount
        else
            return OldGetConstructEconomyModel(builder, targetData, unpack(arg))
        end
    end
end
