local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local WeaponFile = import('/lua/terranweapons.lua')
local TAALinkedRailgun = WeaponFile.TAALinkedRailgun
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon
local TANTorpedoAngler = WeaponFile.TANTorpedoAngler
local TIFSmartCharge = WeaponFile.TIFSmartCharge

MES1101 = Class(TSeaUnit) {
    DestructionTicks = 200,

    Weapons = {
        FrontTurret01 = Class(TDFGaussCannonWeapon) {},
        FrontTurret01a = Class(TDFGaussCannonWeapon) {},
        FrontTurret01b = Class(TDFGaussCannonWeapon) {},
        FrontTurret01c = Class(TDFGaussCannonWeapon) {},
        sidec01 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec02 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec03 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec04 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec05 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec06 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec07 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        sidec08 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.5,
	},
        BackTurret01 = Class(TDFGaussCannonWeapon) {},
        FrontTurret02 = Class(TAALinkedRailgun) {},
        FrontTurret02a = Class(TAALinkedRailgun) {},
        FrontTurret02b = Class(TAALinkedRailgun) {},
        Torpedo01 = Class(TANTorpedoAngler) {},
        AntiTorpedo = Class(TIFSmartCharge) {},
    },
    OnStopBeingBuilt = function(self,builder,layer)
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner02', 'y', nil, 90, 0, 0))

        TSeaUnit.OnStopBeingBuilt(self,builder,layer)  
    end,
}

TypeClass = MES1101