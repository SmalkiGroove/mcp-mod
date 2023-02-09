local EffectTemplate = import('/lua/EffectTemplates.lua')
local TDFRiotWeapon = import('/lua/terranweapons.lua').TDFRiotWeapon
local TAirUnit = import('/lua/terranunits.lua').TAirUnit

MEA0105 = Class(TAirUnit) {

    Weapons = {
        Turret01 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank,
            FxMuzzleFlashScale = 0.75,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.EngineManipulators = {'Jet_Front', 'Jet_Back'}
        for i, bone in self.EngineManipulators do                                                        --XMAX, XMIN, YMAX,YMIN, ZMAX,ZMIN, TURNMULT, TURNSPEED
            self.EngineManipulators[i] = CreateThrustController(self, "thruster", bone):SetThrustingParam( -0.0, 0.0, -0.25, 0.25, -0.1, 0.1, 1.0, 0.25 )
        end
    end,

    DestroyedOnTransport = function(self)
        if self.AttachedUnits then
            for k,v in self.AttachedUnits do
                v:Destroy()
            end
        end
    end,
}

TypeClass = MEA0105
