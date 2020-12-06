local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon

MAA0105 = Class(AAirUnit) {
    Weapons = {
        Turret = Class(ADFLaserLightWeapon) {
            FxMuzzleFlashScale = 0.75,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.EngineManipulators = {'Left_Manip','Right_Manip'}
        for i, bone in self.EngineManipulators do                                                        --XMAX, XMIN, YMAX,YMIN, ZMAX,ZMIN, TURNMULT, TURNSPEED
            self.EngineManipulators[i] = CreateThrustController(self, "thruster", bone):SetThrustingParam( -0.05, 0.0, -0.25, 0.25, -0.1, 0.1, 1.0, 0.25 )
        end
    end,
}

TypeClass = MAA0105
