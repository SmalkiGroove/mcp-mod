local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CAANanoDartWeapon = CybranWeaponsFile.CAANanoDartWeapon
local CAMZapperWeapon02 = CybranWeaponsFile.CAMZapperWeapon02
local TargetingLaser = import('/lua/kirvesweapons.lua').TargetingLaserInvisible
local CIFMissileLoaWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaWeapon


MRS1201 = Class(CSeaUnit) {
    Weapons = {
	
        TargetPainter = Class(TargetingLaser) {
            -- Unit in range. Cease ground fire and turn on AA
            OnWeaponFired = function(self)
                if not self.AA then
                    self.unit:SetWeaponEnabledByLabel('GroundGun', false)
                    self.unit:SetWeaponEnabledByLabel('AAGun', true)
                    self.unit:GetWeaponManipulatorByLabel('AAGun'):SetHeadingPitch(self.unit:GetWeaponManipulatorByLabel('GroundGun'):GetHeadingPitch())
                    self.unit:SetWeaponEnabledByLabel('GroundGun2', false)
                    self.unit:SetWeaponEnabledByLabel('AAGun2', true)
                    self.unit:GetWeaponManipulatorByLabel('AAGun2'):SetHeadingPitch(self.unit:GetWeaponManipulatorByLabel('GroundGun'):GetHeadingPitch())
                    self.AA = true
                end
                TargetingLaser.OnWeaponFired(self)
            end,

            IdleState = State(TargetingLaser.IdleState) {
                -- Start with the AA gun off to reduce twitching of ground fire
                Main = function(self)
                    self.unit:SetWeaponEnabledByLabel('GroundGun', true)
                    self.unit:SetWeaponEnabledByLabel('AAGun', false)
                    self.unit:GetWeaponManipulatorByLabel('GroundGun'):SetHeadingPitch(self.unit:GetWeaponManipulatorByLabel('AAGun'):GetHeadingPitch())
                    self.unit:SetWeaponEnabledByLabel('GroundGun2', true)
                    self.unit:SetWeaponEnabledByLabel('AAGun2', false)
                    self.unit:GetWeaponManipulatorByLabel('GroundGun2'):SetHeadingPitch(self.unit:GetWeaponManipulatorByLabel('AAGun'):GetHeadingPitch())
                    self.AA = false
                    TargetingLaser.IdleState.Main(self)
                end,
            },
        },
		
        ParticleGun = Class(CDFProtonCannonWeapon) {},
        ParticleGun2 = Class(CDFProtonCannonWeapon) {},
        AAGun = Class(CAANanoDartWeapon) {},
        GroundGun = Class(CAANanoDartWeapon) {},
        AAGun2 = Class(CAANanoDartWeapon) {},
        GroundGun2 = Class(CAANanoDartWeapon) {},
        Zapper = Class(CAMZapperWeapon02) {},
        Zapper2 = Class(CAMZapperWeapon02) {},
        CruiseMissile = Class(CIFMissileLoaWeapon) {},
    },
	
    OnStopBeingBuilt = function(self,builder,layer)
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Radar', 'y', nil, 90, 0, 0))
    end,
}

TypeClass = MRS1201