local SSubUnit = import('/lua/seraphimunits.lua').SSubUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SDFUltraChromaticBeamGenerator = SeraphimWeapons.SDFUltraChromaticBeamGenerator02
local SANAnaitTorpedo = SeraphimWeapons.SANAnaitTorpedo

MCPS2NXD = Class(SSubUnit) {

    BackWakeEffect = {},
    Weapons = {
        Turret_01 = Class(SDFUltraChromaticBeamGenerator) {},
        Turret_02 = Class(SDFUltraChromaticBeamGenerator) {},
        Turret_03 = Class(SDFUltraChromaticBeamGenerator) {},
        Turret_04 = Class(SDFUltraChromaticBeamGenerator) {},
        Torpedo1 = Class(SANAnaitTorpedo) {},
    },

    OnKilled = function(self, instigator, type, overkillRatio)
        local wep1 = self:GetWeaponByLabel('Turret_01')
        local bp1 = wep1:GetBlueprint()
        if bp1.Audio.BeamStop then
            wep1:PlaySound(bp1.Audio.BeamStop)
        end
        if bp1.Audio.BeamLoop and wep1.Beams[1].Beam then
            wep1.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep1.Beams do
            v.Beam:Disable()
        end

        local wep2 = self:GetWeaponByLabel('Turret_02')
        local bp2 = wep2:GetBlueprint()
        if bp2.Audio.BeamStop then
            wep2:PlaySound(bp2.Audio.BeamStop)
        end
        if bp2.Audio.BeamLoop and wep2.Beams[1].Beam then
            wep2.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep2.Beams do
            v.Beam:Disable()
        end
		
        local wep3 = self:GetWeaponByLabel('Turret_03')
        local bp3 = wep3:GetBlueprint()
        if bp3.Audio.BeamStop then
            wep3:PlaySound(bp3.Audio.BeamStop)
        end
        if bp3.Audio.BeamLoop and wep3.Beams[1].Beam then
            wep3.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep3.Beams do
            v.Beam:Disable()
        end

        local wep4 = self:GetWeaponByLabel('Turret_04')
        local bp4 = wep4:GetBlueprint()
        if bp4.Audio.BeamStop then
            wep4:PlaySound(bp4.Audio.BeamStop)
        end
        if bp4.Audio.BeamLoop and wep4.Beams[1].Beam then
            wep4.Beams[1].Beam:SetAmbientSound(nil, nil)
        end
        for k, v in wep4.Beams do
            v.Beam:Disable()
        end

        SSubUnit.OnKilled(self, instigator, type, overkillRatio)
    end,

    OnMotionVertEventChange = function(self, new, old)
        SSubUnit.OnMotionVertEventChange(self, new, old)
        if new == 'Top' then
            self:SetWeaponEnabledByLabel('Turret_01', true)
            self:SetWeaponEnabledByLabel('Turret_02', true)
            self:SetWeaponEnabledByLabel('Turret_03', true)
            self:SetWeaponEnabledByLabel('Turret_04', true)
        elseif new == 'Down' then
            self:SetWeaponEnabledByLabel('Turret_01', false)
            self:SetWeaponEnabledByLabel('Turret_02', false)
            self:SetWeaponEnabledByLabel('Turret_03', false)
            self:SetWeaponEnabledByLabel('Turret_04', false)
        end
    end,

    OnStopBeingBuilt = function(self, builer, layer)
        SSubUnit.OnStopBeingBuilt(self, builer, layer)

        --- Unless we're gifted, we should have an original builder.
        --- Remains to be seen if this property is actually copied during gift
        if self.originalBuilder then
            IssueDive({self})
        end
    end
}

TypeClass = MCPS2NXD