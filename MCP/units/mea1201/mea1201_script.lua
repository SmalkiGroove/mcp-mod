local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TWeapons = import('/lua/terranweapons.lua')
local TIFFragLauncherWeapon = TWeapons.TDFFragmentationGrenadeLauncherWeapon
local TDFHeavyPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFHeavyPlasmaGatlingCannonWeapon
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher
local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler
local TDFGaussCannonWeapon = WeaponsFile.TDFLandGaussCannonWeapon

local EffectTemplate = import('/lua/EffectTemplates.lua')
local EffectUtils = import('/lua/effectutilities.lua')
local Effects = import('/lua/effecttemplates.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')

MEA1201 = Class(TAirUnit) {
    EngineRotateBones = {'Jet_Front', 'Jet_Back',},
	
Weapons = {
        MissileRack01 = Class(TSAMLauncher) {},
        
        MainGun = Class(TDFHeavyPlasmaCannonWeapon) {},
		
        RightTurret01 = Class(TDFGaussCannonWeapon) {},
        LeftTurret01 = Class(TDFGaussCannonWeapon) {},
		
        Grenade = Class(TIFFragLauncherWeapon) {},
        Grenade2 = Class(TIFFragLauncherWeapon) {},
		
        Torpedo = Class(TANTorpedoAngler) {},
	
	},
	

    BeamExhaustIdle = '/mods/MCP/effects/emitters/gunship_thruster_beam_03_emit.bp',
	BeamExhaustCruise = '/mods/MCP/effects/emitters/gunship_thruster_beam_03_emit.bp',

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.EngineManipulators = {}

        # create the engine thrust manipulators
        for key, value in self.EngineRotateBones do
            table.insert(self.EngineManipulators, CreateThrustController(self, "thruster", value))
        end

        # set up the thursting arcs for the engines
        for key,value in self.EngineManipulators do
            #                          XMAX, XMIN, YMAX,YMIN, ZMAX,ZMIN, TURNMULT, TURNSPEED
            value:SetThrustingParam( -0.0, 0.0, -0.25, 0.25, -0.1, 0.1, 1.0,      0.25 )
        end
        
        for k, v in self.EngineManipulators do
            self.Trash:Add(v)
        end

    end,

    FxDamageScale = 2.5,
}

TypeClass = MEA1201