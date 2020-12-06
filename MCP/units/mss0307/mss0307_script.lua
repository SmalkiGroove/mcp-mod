local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SWeapon = import('/lua/seraphimweapons.lua')
local SDFUnstablePhasonBeam = import('/lua/kirvesweapons.lua').SDFUnstablePhasonBeam
local EffectTemplate = import('/lua/kirveseffects.lua')
local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon

MSS0307 = Class(SSeaUnit) {
    Weapons = {
        MainGun01 = Class(SWeapon.SDFShriekerCannon){},
        MainGun02 = Class(SWeapon.SDFShriekerCannon){},
        MainGun03 = Class(SWeapon.SDFShriekerCannon){},
        LazorTurret01 = Class(SWeapon.SDFUltraChromaticBeamGenerator) {},
        LazorTurret02 = Class(SWeapon.SDFUltraChromaticBeamGenerator) {},
        BombardTurret = Class(SIFSuthanusArtilleryCannon) {},
        FrontAAGun = Class(SWeapon.SAALosaareAutoCannonWeapon) {},
        BackAAGun = Class(SWeapon.SAALosaareAutoCannonWeapon) {},
        PhasonBeam1 = Class(SDFUnstablePhasonBeam) {
        FxMuzzleFlash = {'/mods/MCP/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp','/Effects/Emitters/seraphim_electricity_emit.bp'},
        },
        
        PhasonBeam2 = Class(SDFUnstablePhasonBeam) {
        FxMuzzleFlash = {'/mods/MCP/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp','/Effects/Emitters/seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp','/Effects/Emitters/seraphim_electricity_emit.bp'},
        },
    },
    
    AmbientEffects = 'OrbGlowEffect',
    
    OnStopBeingBuilt = function(self,builder,layer)
        SSeaUnit.OnStopBeingBuilt(self,builder,layer)
        IssueDive({self})
        self:HideBone('Orb', true)
        self.Trash:Add(CreateRotator(self, 'Orb_Spinner', 'y', nil, 90, 0, 0))
        local army =  self:GetArmy()
        if self.AmbientEffects then
            for k, v in EffectTemplate[self.AmbientEffects] do
                CreateAttachedEmitter(self, 'Orb', army, v):ScaleEmitter(1.8)
            end
        end
    end,
    
    OnKilled = function(self, inst, type, okr)
        self.Trash:Destroy()
        self.Trash = TrashBag()
    SSeaUnit.OnKilled(self, inst, type, okr)
    end,
}
TypeClass = MSS0307
