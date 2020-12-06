local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local explosion = import('/lua/defaultexplosions.lua')
local util = import('/lua/utilities.lua')
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAAShleoCannonWeapon = SeraphimWeapons.SAAShleoCannonWeapon
local SDFHeavyPhasicAutoGunWeapon = SeraphimWeapons.SDFHeavyPhasicAutoGunWeapon

MSA1201= Class(SAirUnit) {

    AirDestructionEffectBones = { 'XSAEW0002','Left_Attachpoint08','Right_Attachpoint02'},

    Weapons = {
        AutoGun = Class(SDFHeavyPhasicAutoGunWeapon) {},
        AALeft = Class(SAAShleoCannonWeapon) {},
        AARight = Class(SAAShleoCannonWeapon) {},
    },

    OnStopBeingBuilt = function(self,builder,layer)
        SAirUnit.OnStopBeingBuilt(self, builder, layer)
        self:AddCommandCap('RULEUCC_Teleport')
    end,

    CreateUnitAirDestructionEffects = function( self, scale )
        self:ForkThread(self.AirDestructionEffectsThread, self )
    end,

    AirDestructionEffectsThread = function( self )
        local numExplosions = math.floor( table.getn( self.AirDestructionEffectBones ) * 0.5 )
        for i = 0, numExplosions do
            explosion.CreateDefaultHitExplosionAtBone( self, self.AirDestructionEffectBones[util.GetRandomInt( 1, numExplosions )], 0.5 )
            WaitSeconds( util.GetRandomFloat( 0.2, 0.9 ))
        end
    end,
}

TypeClass = MSA1201