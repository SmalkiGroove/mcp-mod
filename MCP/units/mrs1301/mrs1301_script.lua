local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CANNaniteTorpedoWeapon = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local BPPPlasmaPPCProj = import('/mods/MCP/lua/MCPWeapons.lua').BPPPlasmaPPCProj
local CAAMissileNaniteWeapon = CybranWeaponsFile.CAAMissileNaniteWeapon

MRS1301 = Class(CSeaUnit) {
    Weapons = {
		ShadowTurret = Class(BPPPlasmaPPCProj) {},
        MicrowaveTurret001 = Class(CDFElectronBolterWeapon) {},
		MicrowaveTurret002 = Class(CDFElectronBolterWeapon) {},
        LeftMiniTurret001 = Class(CDFProtonCannonWeapon) {},
		LeftMiniTurret002 = Class(CDFProtonCannonWeapon) {},
		RightMiniTurret001 = Class(CDFProtonCannonWeapon) {},
		RightMiniTurret002 = Class(CDFProtonCannonWeapon) {},
        Torpedo01 = Class(CANNaniteTorpedoWeapon) {},
        AAGun01 = Class(CAAMissileNaniteWeapon) {},
        AAGun02 = Class(CAAMissileNaniteWeapon) {},
    },
}
TypeClass = MRS1301