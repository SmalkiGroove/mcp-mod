local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local WeaponsFile = import('/lua/cybranweapons.lua')
local WeaponsFile2 = import('/lua/terranweapons.lua')
local CCannonMolecularWeapon = WeaponsFile.CCannonMolecularWeapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')
local CDFProtonCannonWeapon = WeaponsFile.CDFProtonCannonWeapon
local TDFGaussCannonWeapon = WeaponsFile2.TDFLandGaussCannonWeapon
local CDFParticleCannonWeapon = WeaponsFile.CDFParticleCannonWeapon


MRL1202 = Class(CWalkingLandUnit) {

    Weapons = {
        MainGun = Class(CDFParticleCannonWeapon) {},
        ParticleGun1 = Class(CDFProtonCannonWeapon) {},
        ParticleGun2 = Class(CDFProtonCannonWeapon) {},
        lefthandweapon = Class(CCannonMolecularWeapon) {
            FxMuzzleFlashScale = 1.4,
        },
        righthandweapon = Class(CCannonMolecularWeapon) {
            FxMuzzleFlashScale = 1.4,
        },
        rocket1 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.7,
        },
        robottalk = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0,
        },
        rocket2 = Class(TDFGaussCannonWeapon) {
            FxMuzzleFlashScale = 0.7,
        },
    },
    
    OnStopBeingBuilt = function(self,builder,layer)
        CWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Object14', 'z', nil, 690, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Object13', 'z', nil, -690, 0, 0))
        self:CreatTheEffects()
    end,

    OnDetachedFromTransport = function(self, transport, bone)
        CWalkingLandUnit.OnDetachedFromTransport(self, transport, bone)
    end,


    OnKilled = function(self, instigator, damagetype, overkillRatio)
        CWalkingLandUnit.OnKilled(self, instigator, damagetype, overkillRatio)
        self:CreatTheEffectsDeath()
    end,

    CreatTheEffects = function(self)
        local army =  self:GetArmy()
        for k, v in MCPEffectTemplate['BRMT3EXBMPOWEREFFECT'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'eff01', army, v):ScaleEmitter(3.10))
        end
    end,

    CreatTheEffectsDeath = function(self)
        local army =  self:GetArmy()
        for k, v in MCPEffectTemplate['UEFDeath02'] do
            self.Trash:Add(CreateAttachedEmitter(self, 'Turret', army, v):ScaleEmitter(0.8))
        end
    end,
    
}

TypeClass = MRL1202