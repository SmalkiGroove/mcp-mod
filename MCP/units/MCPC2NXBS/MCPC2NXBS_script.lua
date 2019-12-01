local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CANNaniteTorpedoWeapon = CybranWeaponsFile.CANNaniteTorpedoWeapon
local CDFElectronBolterWeapon = CybranWeaponsFile.CDFElectronBolterWeapon
local BPPPlasmaPPCProj = import('/mods/MCP/lua/MCPWeapons.lua').BPPPlasmaPPCProj
local CAAMissileNaniteWeapon = CybranWeaponsFile.CAAMissileNaniteWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

MCPC2NXBS = Class(CSeaUnit) {
    Weapons = {
		ShadowTurret = Class(BPPPlasmaPPCProj) {
			FxMuzzleFlash = EffectTemplate.CLaserMuzzleFlash03,
			FxMuzzleScale = 6.25,},
        MicrowaveTurret001 = Class(CDFElectronBolterWeapon) {
			FxMuzzleFlash = EffectTemplate.CMolecularRipperFlash01,
			FxMuzzleScale = 1.5,},
		MicrowaveTurret002 = Class(CDFElectronBolterWeapon) {
			FxMuzzleFlash = EffectTemplate.CMolecularRipperFlash01,
			FxMuzzleScale = 1.5,},
        LeftMiniTurret001 = Class(CDFProtonCannonWeapon) {FxMuzzleScale = 1.5,},
		LeftMiniTurret002 = Class(CDFProtonCannonWeapon) {FxMuzzleScale = 1.5,},
		RightMiniTurret001 = Class(CDFProtonCannonWeapon) {FxMuzzleScale = 1.5,},
		RightMiniTurret002 = Class(CDFProtonCannonWeapon) {FxMuzzleScale = 1.5,},
        Torpedo01 = Class(CANNaniteTorpedoWeapon) {FxMuzzleScale = 2.25,},
        AAGun01 = Class(CAAMissileNaniteWeapon) {FxMuzzleScale = 1.25,},
        AAGun02 = Class(CAAMissileNaniteWeapon) {FxMuzzleScale = 1.25,},
    },
}
TypeClass = MCPC2NXBS