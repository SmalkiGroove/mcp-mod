EmtBpPath = '/effects/emitters/'
EmtBpPathAlt = '/mods/MCP/effects/emitters/'
TableCat = import('/lua/utilities.lua').TableCat

WeaponSteam02 = {
    EmtBpPathAlt .. 'weapon_mist_02_emit.bp',
}

UnitHitShrapnel01 = {EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',}

AColossusLaserImpact01 = {
    EmtBpPathAlt .. 'phason_laser_end_01_emit.bp',
    EmtBpPathAlt .. 'phason_laser_end_02_emit.bp', 
    EmtBpPathAlt .. 'Nuclear_Laser_ring_02_emit.bp',
}

AColossusLaserMuzzle01 = {
    EmtBpPathAlt .. 'phason_laser_muzzle_01_emit.bp',
    EmtBpPathAlt .. 'phason_laser_muzzle_02_emit.bp',
    EmtBpPathAlt .. 'microwave_laser_charge_02_emit.bp',    
}

Aeon_MirvHit = {
    EmtBpPathAlt .. 'aeon_mirv_hit_03_emit.bp', -- fast ring
    EmtBpPathAlt .. 'aeon_mirv_hit_04_emit.bp', -- plasma
    EmtBpPathAlt .. 'aeon_mirv_hit_05_emit.bp', -- flash lines
    EmtBpPathAlt .. 'aeon_mirv_hit_06_emit.bp', -- darkening molecular
    EmtBpPathAlt .. 'aeon_mirv_hit_07_emit.bp', -- little dot glows
    EmtBpPathAlt .. 'aeon_mirv_hit_08_emit.bp', -- slow ring
    EmtBpPathAlt .. 'aeon_mirv_hit_09_emit.bp', -- darkening
    EmtBpPathAlt .. 'aeon_mirv_hit_10_emit.bp', -- radial rays
    EmtBpPathAlt .. 'aeon_mirv_cloud_01_emit.bp',
}

XCannonPolyTrail = EmtBpPathAlt .. 'xcannon_polytrail_01_emit.bp'
XCannonFXTrail01 = {EmtBpPathAlt .. 'xcannon_fxtrail_01_emit.bp'}

XCannonHitUnit = {
    EmtBpPathAlt .. 'xcannon_hitunit_01_emit.bp',
    EmtBpPathAlt .. 'xcannon_hit_02_emit.bp', 
    EmtBpPathAlt .. 'xcannon_hit_03_emit.bp',  
    EmtBpPathAlt .. 'xcannon_hitunit_04_emit.bp', -- shock effect
    EmtBpPathAlt .. 'xcannon_hitunit_05_emit.bp', -- shock effect
    EmtBpPathAlt .. 'xcannon_hitunit_06_emit.bp', 
    EmtBpPathAlt .. 'xcannon_hitunit_07_emit.bp',
    EmtBpPathAlt .. 'xcannon_hit_08_emit.bp',
    EmtBpPathAlt .. 'xcannon_hit_09_emit.bp',
    EmtBpPathAlt .. 'xcannon_hit_10_emit.bp',
    EmtBpPathAlt .. 'xcannon_hit_distort_emit.bp',
}

ZCannonPolytrail01 = {
    EmtBpPath .. 'default_polytrail_01_emit.bp',
}

ZCannonFxtrail01 = {
     EmtBpPathAlt .. 'ZCannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_02_emit.bp',
}

ZCannonPolytrail02 = { 
    EmtBpPathAlt .. 'ZCannon_polytrail_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_polytrail_02_emit.bp',
    EmtBpPath .. 'default_polytrail_01_emit.bp',
}

ZCannonFxtrail02 = {
     EmtBpPathAlt .. 'ZCannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_04_emit.bp',
     EmtBpPathAlt .. 'ZCannon_projectile_fxtrail_05_emit.bp',
}

ZCannonMuzzleFlash = {
    EmtBpPath .. 'cannon_muzzle_fire_01_emit.bp',
    EmtBpPath .. 'cannon_artillery_muzzle_flash_01_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_07_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_10_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_03_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_06_emit.bp',    
    EmtBpPath .. 'cannon_muzzle_flash_07_emit.bp', 
}

ZCannonHit02 = {
    EmtBpPathAlt .. 'ZCannon_hit_12_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_13_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_14_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_15_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_16_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_03_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_04_emit.bp',
}

ZCannonHit03 = {
    EmtBpPathAlt .. 'ZCannon_hit_01_emit.bp', -- glow    
    EmtBpPathAlt .. 'ZCannon_hit_02_emit.bp', -- flash         
    EmtBpPathAlt .. 'ZCannon_hit_03_emit.bp', -- sparks
    EmtBpPathAlt .. 'ZCannon_hit_04_emit.bp', -- plume fire
    EmtBpPathAlt .. 'ZCannon_hit_05_emit.bp', -- plume dark 
    EmtBpPathAlt .. 'ZCannon_hit_06_emit.bp', -- base fire
    EmtBpPathAlt .. 'ZCannon_hit_07_emit.bp', -- base dark 
    EmtBpPathAlt .. 'ZCannon_hit_08_emit.bp', -- plume smoke
    EmtBpPathAlt .. 'ZCannon_hit_09_emit.bp', -- base smoke
    EmtBpPathAlt .. 'ZCannon_hit_10_emit.bp', -- plume highlights
    EmtBpPathAlt .. 'ZCannon_hit_11_emit.bp', -- base highlights
    EmtBpPathAlt .. 'ZCannon_ring_01_emit.bp', -- ring14
    EmtBpPathAlt .. 'ZCannon_ring_02_emit.bp', -- ring11         
}

ZCannonHit01 = {
    EmtBpPathAlt .. 'ZCannon_hit_01_emit.bp', -- glow    
    EmtBpPathAlt .. 'ZCannon_hit_02_emit.bp', -- flash         
    EmtBpPathAlt .. 'ZCannon_hit_03_emit.bp', -- sparks
    EmtBpPathAlt .. 'ZCannon_hit_04_emit.bp', -- plume fire
    EmtBpPathAlt .. 'ZCannon_hit_05_emit.bp', -- plume dark 
    EmtBpPathAlt .. 'ZCannon_hit_06_emit.bp', -- base fire
    EmtBpPathAlt .. 'ZCannon_hit_07_emit.bp', -- base dark 
    EmtBpPathAlt .. 'ZCannon_hit_08_emit.bp', -- plume smoke
    EmtBpPathAlt .. 'ZCannon_hit_09_emit.bp', -- base smoke
    EmtBpPathAlt .. 'ZCannon_hit_10_emit.bp', -- plume highlights
    EmtBpPathAlt .. 'ZCannon_hit_11_emit.bp', -- base highlights
    EmtBpPathAlt .. 'ZCannon_ring_01_emit.bp', -- ring14
    EmtBpPathAlt .. 'ZCannon_ring_02_emit.bp', -- ring11   
    EmtBpPathAlt .. 'ZCannon_hit_12_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_13_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_14_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_15_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_16_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_03_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_04_emit.bp',      
}

ZCannonChargeMuzzleFlash = { 
    EmtBpPathAlt .. 'ZCannon_flash_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_flash_02_emit.bp', 
    EmtBpPathAlt .. 'ZCannon_flash_03_emit.bp', 
    EmtBpPathAlt .. 'ZCannon_flash_04_emit.bp',
    EmtBpPathAlt .. 'ZCannon_flash_05_emit.bp',
}

WaveCannonFxtrail01 = {
     EmtBpPath .. 'seraphim_chronotron_cannon_projectile_fxtrail_03_emit.bp',
}

WaveCannonPolytrail01 = {}

SDFExperimentalPhasonProjHit01 = {
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_01_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_02_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_03_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_04_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_05_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_06_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_07_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_08_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_09_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_10_emit.bp',
}

SDFExperimentalPhasonProjHit02 = {
    EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_01_emit.bp',
    EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_08_emit.bp',
}

SDFExperimentalPhasonProjHitUnit = {
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_01_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_02_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_03_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_04_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_05_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_06_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_07_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_08_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_09_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_hit_10_emit.bp',
    EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_01_emit.bp',
    EmtBpPath .. 'seraphim_experimental_phasonproj_hitunit_08_emit.bp',
    EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',
}

ShadowCannonPolyTrail = { 
    EmtBpPath .. 'electron_bolter_trail_01_emit.bp',
    EmtBpPathAlt .. 'shadowcannon_polytrail_01_emit.bp'
}

ShadowCannonFXTrail01 = {
     EmtBpPathAlt .. 'shadowcannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'shadow_bolter_munition_01_emit.bp',
     
    EmtBpPathAlt .. 'mgqai_cannon_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'mgqai_cannon_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'mgqai_cannon_fxtrail_03_emit.bp',
}
    
ShadowCannonFXTrail02 = {
     EmtBpPathAlt .. 'shadow_bolter_munition_01_emit.bp',
}

BassieCannonPolyTrail = EmtBpPathAlt .. 'bassie_cannon_polytrail_01_emit.bp'

BassieCannonFxTrail = {
     EmtBpPathAlt .. 'bassie_cannon_munition_01_emit.bp',
}

BassieCannonHit01 = {
    EmtBpPath .. 'hvyproton_cannon_hit_01_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_05_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
}

BassieCannonHit02 = {
    EmtBpPath .. 'hvyproton_cannon_hit_06_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',
}

BassieCannonHitLand = {
    EmtBpPath .. 'hvyproton_cannon_hit_01_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_05_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_06_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
}

BassieCannonHitUnit01 = {
    EmtBpPath .. 'hvyproton_cannon_hitunit_01_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',  
    EmtBpPath .. 'hvyproton_cannon_hitunit_04_emit.bp', 
    EmtBpPathAlt .. 'bassie_cannon_hitunit_05_emit.bp',  
    EmtBpPath .. 'hvyproton_cannon_hitunit_06_emit.bp', 
    EmtBpPath .. 'hvyproton_cannon_hitunit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
}

BassieCannonHitUnit = {
    EmtBpPath .. 'hvyproton_cannon_hitunit_01_emit.bp',
    EmtBpPathAlt .. 'bassie_cannon_hit_02_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',  
    EmtBpPath .. 'hvyproton_cannon_hitunit_04_emit.bp', 
    EmtBpPathAlt .. 'bassie_cannon_hitunit_05_emit.bp',  
    EmtBpPath .. 'hvyproton_cannon_hitunit_06_emit.bp', 
    EmtBpPath .. 'hvyproton_cannon_hitunit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_08_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
    EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',
}

ACUShadowCannonHit01 = {
    EmtBpPath .. 'proton_bomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_light_artillery_hit_02_emit.bp',
}

WraithPolytrail01 = EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'

WraithMunition01 = { 
    EmtBpPath .. 'disruptor_cannon_munition_01_emit.bp',
    EmtBpPath .. 'disruptor_cannon_munition_02_emit.bp',
    EmtBpPath .. 'disruptor_cannon_munition_03_emit.bp',
    EmtBpPath .. 'disruptor_cannon_munition_04_emit.bp',
}

WraithCannonHit01 = {
    EmtBpPath .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_08_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_09_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_02_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_04_emit.bp',
}

HGaussCannonPolyTrail =  {
    EmtBpPath .. 'gauss_cannon_polytrail_01_emit.bp',
    EmtBpPath .. 'gauss_cannon_polytrail_02_emit.bp',    
}

DamageFire01 = {
    EmtBpPath .. 'destruction_damaged_fire_01_emit.bp',
    EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}

GoldAAFxTrails = {
    EmtBpPathAlt .. 'gold_aa_fxtrail_01_emit.bp',
}

GoldAAPolyTrail = EmtBpPathAlt .. 'gold_aa_polytrail_01_emit.bp'

-- Omega OverCharge projectiles and impacts
OmegaOverChargeProjectileTrails = {
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_02_emit.bp',
}

OmegaOverChargeProjectileFxTrails = {
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_01_emit.bp',
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_02_emit.bp',
    EmtBpPathAlt .. 'omega_overcharge_projectile_fxtrail_03_emit.bp',
}

OmegaOverChargeLandHit = {
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_03_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_06_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_01_emit.bp',                  
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_03_emit.bp',
}

OmegaOverChargeUnitHit = {
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_overcharge_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_01_emit.bp',                  
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_chronotron_cannon_blast_projectile_hit_03_emit.bp',
}

-- MGQAI stuff
MGHeadshotFxtrail01 = {}
MGHeadshotPolytrail01 = {}

MGHeadshotHit01 = {}

MissileHit01 = {
    EmtBpPathAlt .. 'cybran_corsair_missile_hit_01_emit.bp',
}

MissileLandHit01 = {
    EmtBpPathAlt .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPathAlt .. 'quark_bomb_explosion_08_emit.bp',

    EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp',
}

MissileUnitHit01 = {
   EmtBpPathAlt .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPathAlt .. 'quark_bomb_explosion_08_emit.bp',

    EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp',
}

MGQAIPlasmaArtyPolytrail01 = EmtBpPath .. 'aeon_quantic_cluster_polytrail_01_emit.bp'

MGQAIPlasmaArtyFxtrail01 = {
    EmtBpPathAlt .. 'plasma_arty_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrail_03_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrail_06_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrail_08_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_fxtrail_09_emit.bp',
}

MGQAIPlasmaArtyChildFxtrail01 = {
    EmtBpPathAlt .. 'plasma_arty_child_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'plasma_arty_child_fxtrails_02_emit.bp',
}

MGQAIPlasmaArtyHitLand01 = {
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
    EmtBpPath .. 'napalm_hvy_thin_smoke_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_01_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_02_emit.bp',
    EmtBpPathAlt .. 'blue_napalm_hvy_03_emit.bp',
}

MGQAICannonHitUnit = {
    EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp',
    EmtBpPath .. 'cybran_light_artillery_hit_02_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_01_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_03_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_04_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_05_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_06_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_07_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_08_emit.bp',
    EmtBpPath .. 'cybran_kamibomb_hit_09_emit.bp',
}

THeavyFragmentationShell01 = {
    EmtBpPath .. 'fragmentation_shell_phosphor_01_emit.bp',
    EmtBpPath .. 'fragmentation_shell_hit_flash_01_emit.bp',
    EmtBpPath .. 'fragmentation_shell_shrapnel_01_emit.bp',
    EmtBpPathAlt .. 'heavy_fragmentation_shell_smoke_01_emit.bp',
    EmtBpPathAlt .. 'heavy_fragmentation_shell_smoke_02_emit.bp',
}

FlameThrowerHitLand01 = {
    EmtBpPathAlt .. 'exflamer_flash_emit.bp',
    EmtBpPathAlt .. 'exflamer_thick_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_thin_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_01_emit.bp',
    EmtBpPathAlt .. 'exflamer_02_emit.bp',
    EmtBpPathAlt .. 'exflamer_03_emit.bp',
}

FlameThrowerHitWater01 = {
    EmtBpPathAlt .. 'exflamer_waterflash_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_smoke_emit.bp',
    EmtBpPathAlt .. 'exflamer_oilslick_emit.bp',
    EmtBpPathAlt .. 'exflamer_lines_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_ripples_emit.bp',
    EmtBpPathAlt .. 'exflamer_water_dots_emit.bp',    
}

ADisk01 = {
    EmtBpPath .. 'quark_bomb_01_emit.bp',
    EmtBpPath .. 'quark_bomb_02_emit.bp',
    EmtBpPath .. 'sparks_06_emit.bp',
}

-- UEF ACU Anti Matter Cannon
ACUAntiMatterPoly = {
    EmtBpPathAlt .. 'examc_polytrail_01_emit.bp',
}

ACUAntiMatterFx = {
    EmtBpPathAlt .. 'examc_fxtrail_01_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_02_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_03_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_04_emit.bp',
    EmtBpPathAlt .. 'examc_fxtrail_05_emit.bp',
}

ACUAntiMatterMuzzle = {
    EmtBpPathAlt .. 'examc_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_06_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_07_emit.bp',
}

ACUAntiMatter01 = {
    EmtBpPathAlt .. 'examc_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_hit_01_emit.bp',
    EmtBpPathAlt .. 'examc_hit_02_emit.bp',
    EmtBpPathAlt .. 'examc_hit_03_emit.bp',
    EmtBpPathAlt .. 'examc_hit_04_emit.bp',
    EmtBpPathAlt .. 'examc_hit_05_emit.bp',
    EmtBpPathAlt .. 'examc_hit_07_emit.bp',
    EmtBpPathAlt .. 'examc_hit_08_emit.bp',
    EmtBpPathAlt .. 'examc_ring_01_emit.bp',
    EmtBpPathAlt .. 'examc_ring_02_emit.bp',
    EmtBpPathAlt .. 'examc_ring_03_emit.bp',
    EmtBpPathAlt .. 'examc_ring_04_emit.bp',
    EmtBpPathAlt .. 'examc_shoackwave_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_02_emit.bp',      
    EmtBpPathAlt .. 'ZCannon_hit_03_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_06_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_07_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_09_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_11_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_01_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_02_emit.bp',    
    EmtBpPathAlt .. 'ZCannon_hit_12_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_13_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_14_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_15_emit.bp',
    EmtBpPathAlt .. 'ZCannon_hit_16_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_03_emit.bp',
    EmtBpPathAlt .. 'ZCannon_ring_04_emit.bp',
}

YCannonMuzzleFlash = {
    EmtBpPathAlt .. 'examc_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_06_emit.bp',
    EmtBpPathAlt .. 'examc_muzzle_flash_07_emit.bp',
}

YCannonMuzzleChargeFlash =  {
    EmtBpPathAlt .. 'ycannon_charge_04_emit.bp',
    EmtBpPathAlt .. 'ycannon_charge_14_emit.bp',
}

GLaserMuzzle01 = { 
    EmtBpPathAlt .. 'g_laser_flash_01_emit.bp',
    EmtBpPathAlt .. 'g_laser_muzzle_01_emit.bp',
}

GLaserEndPoint01 = {
    EmtBpPathAlt .. 'g_laser_end_01_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_02_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_03_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_04_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_05_emit.bp',
    EmtBpPathAlt .. 'g_laser_end_06_emit.bp',
}

-- Nova weapon
NovaCannonHitUnit = {
    EmtBpPathAlt .. 'nova_bomb_hit_02_emit.bp',
    EmtBpPathAlt .. 'nova_light_artillery_hit_02_emit.bp',
}

-- SERAPHIM OHWALLI BOMB EMITTERS
GoldLaserBombDetonate01 = {
    EmtBpPathAlt .. 'gold_laser_bomb_explode_01_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_explode_02_emit.bp',  
    EmtBpPathAlt .. 'gold_laser_bomb_explode_03_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_explode_04_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_explode_05_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_concussion_01_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_concussion_02_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_hit_03_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_hit_14_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_hit_13_emit.bp',
}

GoldLaserBombHitRingProjectileFxTrails03 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01a_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01b_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_01c_emit.bp',
}

GoldLaserBombHitRingProjectileFxTrails04 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02a_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02b_emit.bp',  
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_02c_emit.bp', 
}

GoldLaserBombHitRingProjectileFxTrails05 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03a_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03b_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_03c_emit.bp',
}

GoldLaserBombHitRingProjectileFxTrails06 = {
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_04_emit.bp',   
    EmtBpPathAlt .. 'gold_laser_bomb_ring_fxtrails_06_emit.bp',
}

GoldLaserBombPlumeFxTrails01 = {
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'gold_laser_bomb_plume_fxtrails_03_emit.bp',    
}

-- Lambda Effects
LambdaRedirector = {
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_01.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_02.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_02.bp',
    EmtBpPathAlt .. 'lambda_redirect_bright_03.bp',
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
}

LambdaDestroyer = {
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_02.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_03b.bp',
    EmtBpPathAlt .. 'lambda_destroy_dark_04.bp',
    EmtBpPathAlt .. 'lambda_destroy_bright_01.bp',
    EmtBpPathAlt .. 'lambda_destroy_bright_01.bp',
    EmtBpPathAlt .. 'lambda_distortion_01.bp',
}

-- Garg Weapons
RedTurboLaser01 = {
    EmtBpPathAlt .. 'Turboredbeam_polytrail_04_emit.bp',
}

RedTurboLaser02 = {
    EmtBpPathAlt .. 'Turboredbeam_polytrail_04_emit.bp',
}

RedLaserMuzzleFlash01 = {
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'red_terran_gatling_plasma_cannon_muzzle_flash_06_emit.bp',
}

GargWarheadHitUnit = {

    EmtBpPathAlt .. 'garg_warhead_hit_01_emit.bp',
    EmtBpPathAlt .. 'garg_warhead_hit_02_emit.bp',

}

-- EMP effects
EMPEffect = {
    EmtBpPathAlt .. 'emp_effect_01_emit.bp',
    EmtBpPathAlt .. 'emp_effect_02_emit.bp',    
}

-- Cybran Hailfire Projectiles
CybranHailfire01Hit01 = {
    EmtBpPath .. 'neutron_cluster_bomb_hit_01_emit.bp',
    EmtBpPath .. 'neutron_cluster_bomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_01_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_03_emit.bp',    
}

CybranHailfire01FXTrails = {
    EmtBpPathAlt .. 'exhailfire_exhaust_02_emit.bp',
}

CybranHailfire02FXTrails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
}

CybranHailfire03FXTrails = {
    EmtBpPathAlt .. 'exhailfire_exhaust_01_emit.bp',
}

CybranHailfire01HitUnit01 = CybranHailfire01Hit01
CybranHailfire01HitLand01 = CybranHailfire01Hit01
CybranHailfire01HitWater01 = CybranHailfire01Hit01

HailfireLauncherExhaust = {
    EmtBpPath .. 'cannon_muzzle_flash_04_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_11_emit.bp',
    EmtBpPathAlt .. 'terran_sam_launch_smoke2_emit.bp',
}

HellStormGunShells = {
    EmtBpPathAlt .. 'hellstorm_shells_01_emit.bp',
}

MineExplosion01 = {
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_03_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_03_flat_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_05_emit.bp',
    EmtBpPath .. 'seraphim_tau_cannon_projectile_hit_06_emit.bp',
    EmtBpPath .. 'seraphim_rifter_mobileartillery_hit_05_emit.bp',
}

ArchAngelMissileHit = {
    EmtBpPath ..'aeon_mercy_missile_hit_01_emit.bp',
    EmtBpPathAlt .. 'aeon_mirv_cloud_01_emit.bp',
}

SerMineRiftIn_Small = {
    EmtBpPath .. 'seraphim_rift_in_small_01_emit.bp', 
    EmtBpPath .. 'seraphim_rift_in_small_02_emit.bp', 
    EmtBpPath .. 'seraphim_rift_in_small_03_emit.bp', 
    EmtBpPath .. 'seraphim_rift_in_small_04_emit.bp', 
}

SExperimentalChargePhasonLaserBeam = {
    EmtBpPathAlt .. 'seraphim_expirimental_laser_charge_beam_emit.bp',
}

SExperimentalDronePhasonLaserBeam = {
    EmtBpPathAlt .. 'seraphim_expirimental_laser_drone_beam_emit.bp',
}

GoliathTMD01 = {
    EmtBpPathAlt .. 'goliath_tmd_polytrail_01_emit.bp',
}

JuggPlasmaGatlingCannonMuzzleFlash = {
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_05_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_06_emit.bp',
}

JuggPlasmaGatlingCannonShells = {
    EmtBpPathAlt .. 'jugg_gattler_shells_01_emit.bp',
}

DamageBlueFire = {
    EmtBpPathAlt .. 'destruction_damaged_blue_fire_01_emit.bp',
    EmtBpPathAlt .. 'destruction_damaged_blue_fire_02_emit.bp',
    EmtBpPath .. 'destruction_damaged_fire_distort_01_emit.bp',
}

RailGunCannonHit01 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_05_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_02_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_03_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_04_emit.bp',
}

RailGunCannonHit02 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_02_emit.bp',
}

RailGunCannonHit03 = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_06_emit.bp',
}

RailGunCannonUnitHit = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_05_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_02_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_03_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hitunit_06_emit.bp',
    EmtBpPath .. 'destruction_unit_hit_shrapnel_01_emit.bp',
}
RailGunCannonHit = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_03_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_05_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_hit_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_02_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_03_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_hit_04_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_land_hit_02_emit.bp',
}

RailGunFxTrails = {
   EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_01_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_02_emit.bp',
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_fxtrail_03_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_trail_01_emit.bp',
    EmtBpPath .. 'terran_commander_overcharge_trail_02_emit.bp',
    EmtBpPath .. 'terran_commander_cannon_fxtrail_01_emit.bp',
}

RailGunPolyTrails = {
    EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_polytrail_01_emit.bp',
}

-- UEF Hyper Velocity Missile
CitadelHVM01Trails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    EmtBpPath .. 'missile_munition_trail_02_emit.bp',
}

UEFACUHeavyPlasmaGatlingCannonMuzzleFlash = {
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_05_emit.bp',
    EmtBpPath .. 'heavy_plasma_gatling_cannon_laser_muzzle_flash_06_emit.bp',
}

UEFHVM01Trails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
}

UEFCruiseMissile01Trails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
}

CybranHailfire01Hit01 = {
    EmtBpPath .. 'neutron_cluster_bomb_hit_01_emit.bp',
    EmtBpPath .. 'neutron_cluster_bomb_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_01_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_02_emit.bp',
    EmtBpPath .. 'cybran_empgrenade_hit_03_emit.bp',    
}
CybranHailfire01FXTrails = {
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
    EmtBpPathAlt .. 'exhailfire_exhaust_01_emit.bp',
    EmtBpPathAlt .. 'exhailfire_exhaust_02_emit.bp',
}
CybranHailfire02FXTrails = {
    EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_sam_munition_trail_01_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_04_emit.bp',
    #EmtBpPath .. 'nuke_munition_launch_trail_06_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_01_emit.bp',
    #EmtBpPath .. 'missile_munition_trail_02_emit.bp',
    #EmtBpPath .. 'missile_smoke_exhaust_02_emit.bp',
}
CybranHailfire01HitUnit01 = CybranHailfire01Hit01
CybranHailfire01HitLand01 = CybranHailfire01Hit01
CybranHailfire01HitWater01 = CybranHailfire01Hit01
HailfireLauncherExhaust = {
    #EmtBpPath .. 'terran_cruise_missile_launch_01_emit.bp',
    #EmtBpPathAlt .. 'terran_cruise_missile_launch_02_emit.bp',
    EmtBpPath .. 'cannon_muzzle_flash_04_emit.bp',
    EmtBpPath .. 'cannon_muzzle_smoke_11_emit.bp',
    #EmtBpPath .. 'terran_sam_launch_smoke_emit.bp',
    EmtBpPathAlt .. 'terran_sam_launch_smoke2_emit.bp',
}

HadesHit01 = {
    EmtBpPathAlt .. 'aeon_hadeshit01.bp',
    EmtBpPathAlt .. 'aeon_hadeshit02.bp',
    EmtBpPathAlt .. 'aeon_hadeshit03.bp',
    EmtBpPathAlt .. 'aeon_hadeshit04.bp',
    EmtBpPathAlt .. 'aeon_hadeshit04a.bp',
    EmtBpPathAlt .. 'aeon_hadeshit05.bp',
    EmtBpPathAlt .. 'aeon_hadeshit06.bp',
    EmtBpPathAlt .. 'aeon_hadeshit07.bp',
    EmtBpPathAlt .. 'aeon_hadeshit09.bp',
    EmtBpPathAlt .. 'aeon_hadeshit08.bp',
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
	EmtBpPathAlt .. 'Hades_smoke_emit.bp',
}

AvalancheRocketHit = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'comedred_darkfire_emit.bp',	##	
    EmtBpPathAlt .. 'comedred_fire_emit.bp',	##
    EmtBpPathAlt .. 'comedred_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'madcatdeathring.bp',	##
    EmtBpPathAlt .. 'madcatredglow_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
}

CybProtonCannonFXTrail01 =  { EmtBpPathAlt .. 'proton_cannon_fxtrail_01_emit.bp' }
CybProtonCannonFXTrail01MT =  { EmtBpPathAlt .. 'proton_cannon_fxtrailmt_01_emit.bp' }
CybProtonCannonFXTrail02 =  { EmtBpPathAlt .. 'proton_cannon_fxtrail_02_emit.bp' }
CybProtonCannonPolyTrail =  EmtBpPathAlt .. 'proton_cannon_polytrail_01_emit.bp'
CybProtonCannonPolyTrail02 =  EmtBpPathAlt .. 'proton_cannon_polytrail_02_emit.bp'

BRNT2EXLMPoly = {
    EmtBpPath .. 'seraphim_rifter_mobileartillery_polytrail_01_emit.bp',
    EmtBpPath .. 'plasma_cannon_polytrail_01_emit.bp',
    EmtBpPath .. 'plasma_cannon_polytrail_02_emit.bp',
    EmtBpPath .. 'plasma_cannon_polytrail_03_emit.bp',
}

BRNT1ADVBOTFXTrails01 = {
	EmtBpPathAlt .. 'uef_sinnuthe_fxtrails_01_emit.bp',
	EmtBpPathAlt .. 'uef_sinnuthe_fxtrails_02_emit.bp',
	EmtBpPathAlt .. 'uef_sinnuthe_fxtrails_03_emit.bp',
}

BROST2ADVBATTLESHIPTRAILS = {
    EmtBpPathAlt .. 'aeont2battleship_01_emit.bp',
    EmtBpPathAlt .. 'aeont2battleship_02_emit.bp',
}

BROST2ADVBATTLESHIPHIT = {
    EmtBpPathAlt .. 'aeont2advbattleship_hit_01.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
    EmtBpPathAlt .. 'mayhemmk4blueglow2_emit.bp',	##	
}

BRNST2ADVBATTLESHIPHIT = {
    EmtBpPathAlt .. 'aeont2advbattleship_hit_01.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
    EmtBpPathAlt .. 'mayhemmk4blueglow2_emit.bp',	##	
}

SerT3SHBMHit01 = {
    EmtBpPathAlt .. 'seramegabot_01_emit.bp',
    EmtBpPathAlt .. 'seramegabot_02_emit.bp',
    EmtBpPathAlt .. 'seramegabot_03_emit.bp',
    EmtBpPathAlt .. 'seramegabot_04_emit.bp',
    EmtBpPathAlt .. 'seramegabot_05_emit.bp',
    EmtBpPathAlt .. 'seramegabot_06_emit.bp',
    EmtBpPathAlt .. 'seramegabot_07_emit.bp',
    EmtBpPathAlt .. 'seramegabot_08_emit.bp',
    EmtBpPathAlt .. 'seramegabot_09_emit.bp',
    EmtBpPathAlt .. 'seramegabot_10_emit.bp',
}

UEFT1ADVBOThit1 = {
    EmtBpPathAlt .. 'seramegabot_01b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_02b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_03b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_04b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_05b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_06b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_09b_emit.bp',
    EmtBpPathAlt .. 'seramegabot_10b_emit.bp',
}

SerT3SHBMDeath = {
    EmtBpPathAlt .. 'seramegabot_01a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_02a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_03a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_04a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_05a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_06a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_07a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_08a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_09a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_10a_emit.bp',
    EmtBpPathAlt .. 'seramegabot_11a_emit.bp',
}

SerT1AdvancedTankHit01 = {
	EmtBpPathAlt .. 'seraphimt1advtank_hit_01_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_03_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_04_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_05_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_06_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_07_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_08_emit.bp',
	EmtBpPathAlt .. 'seraphimt1advtank_hit_09_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit04_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit05_emit.bp',
}

BRNT2EXLMmuzzle = {
    '/effects/emitters/plasma_cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/plasma_cannon_muzzle_flash_02_emit.bp',
    '/effects/emitters/cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/heavy_plasma_cannon_hitunit_05_emit.bp',
	EmtBpPath .. 'seraphim_cleo_cannon_muzzle_flash_01_emit.bp',
	EmtBpPath .. 'seraphim_cleo_cannon_muzzle_flash_02_emit.bp',
	EmtBpPath .. 'seraphim_cleo_cannon_muzzle_flash_03_emit.bp',
}

BRNT2EXLMHit1 = {
	EmtBpPathAlt .. 'ueft2exlmbiggun_01_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_02_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_03_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_04_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_05_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_06_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_07_emit.bp',
	EmtBpPathAlt .. 'ueft2exlmbiggun_08_emit.bp',
}

AeonBattleShipHit01 = {
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_14_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon01_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon02_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon03_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon04_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon05_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon06_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon07_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon08_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon09_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon10_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon11_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon12_emit.bp',
}

AeonUnitDeathRing01 = {
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_14_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon01_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon11_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon12_emit.bp',
}

AeonUnitDeathRing02 = {
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_14_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_04_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_05_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_06_emit.bp',
}

AeonUnitDeathRing03 = {
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_05_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_06_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
}

AeonExpT1ArtilleryHit = {
	EmtBpPathAlt .. 'ueft2experimental_missile_14_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon01_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon11_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon12_emit.bp',
}

CybranT2BeetleHit01 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emita.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emitaa.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'co_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'co_darkfire_emit.bp',	##
}

AvalancheRocketHit = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'comedred_darkfire_emit.bp',	##	
    EmtBpPathAlt .. 'comedred_fire_emit.bp',	##
    EmtBpPathAlt .. 'comedred_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'madcatdeathring.bp',	##
    EmtBpPathAlt .. 'madcatredglow_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
}

UEFDeath01 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emita.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emitaa.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'co_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'co_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'co_fire_emit.bp',	##	
}

UEFDeath02 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emita.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emitaa.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'co_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'co_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'co_fire_emit.bp',	##	
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11
}

UEFDeath02a = {
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
}

UEFDeath02b = {
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
}

UEFDeath03 = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
}

UEFDeath04 = {
    EmtBpPathAlt .. 'bm2rockethit_01_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_03_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
}

UEFDeathSML01 = {
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'cosml_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'cosml_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'cosml_fire_emit.bp',	##	
	EmtBpPathAlt .. 'bm2rockethit_09_emit.bp', ## Red glow explosion with smoke
}

GreenGatlingCannonPolyTrails = {
    EmtBpPathAlt .. 'green_gatling_plasma_cannon_polytrail_01_emit.bp',
    EmtBpPathAlt .. 'green_gatling_plasma_cannon_polytrail_02_emit.bp',
    EmtBpPathAlt .. 'green_gatling_plasma_cannon_polytrail_03_emit.bp',
}

YellowLaserPolyTrails = {
    EmtBpPathAlt .. 'yellowlaser_polytrail_01_emit.bp',
}

LightLaserPolyTrail = {
    EmtBpPathAlt .. 'LightLaserPolyTrail_polytrail_01_emit.bp',
}

HeavyLaserPolyTrail = {
    EmtBpPathAlt .. 'HeavyLaserPolyTrail_polytrail_01_emit.bp',
}

UEFHEAVYMISSILE01 = {
	EmtBpPathAlt .. 'ueft2experimental_missile_01_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_02_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_03_emit.bp',

	EmtBpPathAlt .. 'ueft2experimental_missile_05_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_06_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_14_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_15_emit.bp',
}

UEFT2EXARTHit02 = {
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon08_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon09_emit.bp',
	EmtBpPathAlt .. 'aeon_battleshipcannon10_emit.bp',
    EmtBpPath .. 'antimatter_hit_04_emit.bp',	##	plume fire
	EmtBpPathAlt .. 'ueft2experimental_missile_06_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
    EmtBpPath .. 'antimatter_hit_11_emit.bp',	##	base highlights
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11	
    EmtBpPathAlt .. 'quantum_hit_flash_02_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_03_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_09_emit.bp',
	EmtBpPathAlt .. 'bm2rockethit_09_emit.bp', ## Red glow explosion with smoke
    EmtBpPathAlt .. 'bm2rockethit_11a_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPath .. 'antimatter_hit_09_emit.bp',	##	base smoke
    EmtBpPath .. 'antimatter_hit_06_emit.bp',	##	base fire
    EmtBpPath .. 'antimatter_hit_07_emit.bp',	##	base dark
}

UefMobileFortressGunhit = {
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
    EmtBpPath .. 'antimatter_hit_01_emit.bp',	##	glow	
    EmtBpPath .. 'antimatter_hit_02_emit.bp',	##	flash	     
    EmtBpPath .. 'antimatter_hit_03_emit.bp', 	##	sparks
    EmtBpPath .. 'antimatter_hit_04_emit.bp',	##	plume fire
    EmtBpPath .. 'antimatter_hit_05_emit.bp',	##	plume dark 
    EmtBpPath .. 'antimatter_hit_06_emit.bp',	##	base fire
    EmtBpPath .. 'antimatter_hit_07_emit.bp',	##	base dark 
    EmtBpPath .. 'antimatter_hit_08_emit.bp',	##	plume smoke
    EmtBpPath .. 'antimatter_hit_09_emit.bp',	##	base smoke
    EmtBpPath .. 'antimatter_hit_10_emit.bp',	##	plume highlights
    EmtBpPath .. 'antimatter_hit_11_emit.bp',	##	base highlights
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11	
    EmtBpPath .. 'seraphim_inaino_hit_03_emit.bp',			## long glow
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_06_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_08_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_09_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_10_emit.bp',
    EmtBpPath .. 'seraphim_khamaseen_bomb_hit_11_emit.bp',
    EmtBpPath .. 'shockwave_01_emit.bp', 
}

CYBRANHEAVYPROTONARTILLERYHIT01 = {
	EmtBpPath .. 'hvyproton_cannon_hit_01_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_02_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_05_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
    EmtBpPath .. 'dust_cloud_06_emit.bp',
    EmtBpPath .. 'dirtchunks_01_emit.bp',
    EmtBpPath .. 'molecular_resonance_cannon_ring_02_emit.bp',
}

UEFHEAVYROCKET = {
    EmtBpPath .. 'flash_01_emit.bp',
	EmtBpPath .. 'quark_bomb_explosion_06_emit.bp',	    
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11	 
	EmtBpPath .. 'antimatter_hit_12_emit.bp',	
	EmtBpPath .. 'antimatter_hit_13_emit.bp',	     
	EmtBpPath .. 'antimatter_hit_14_emit.bp',   
	EmtBpPath .. 'antimatter_hit_15_emit.bp',  
	EmtBpPath .. 'antimatter_hit_16_emit.bp',
}

UEFHEAVYROCKET02 = {
    EmtBpPathAlt .. 'quantum_hit_flash_01_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_02_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_03_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_09_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_08_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_02b_emit.bp',
}

CybranT1BattleTankHit = {
	EmtBpPath .. 'hvyproton_cannon_hit_01_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_02_emit.bp',
	EmtBpPath .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_05_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_07_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant1battletank_emit.bp',
    EmtBpPathAlt .. 'tmcybrant1battletank3_emit.bp',
    EmtBpPathAlt .. 'tmcybrant1battletank2_emit.bp',
}

BattleMech2RocketHit = {
    EmtBpPathAlt .. 'bm2rockethit_01_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_03_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_04_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_05_emit.bp',
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tmcybrant2battletankhit_07_emit.bp', ## black dots on ground
	EmtBpPathAlt .. 'bm2rockethit_06_emit.bp', ## ring
	EmtBpPathAlt .. 'hvyproton_cannon_hit_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_10_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
	EmtBpPathAlt .. 'bm2rockethit_07_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
	EmtBpPathAlt .. 'bm2rockethit_09_emit.bp', ## Red glow explosion with smoke
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
}

CybranHeavyProtonGunHit = {
	EmtBpPathAlt .. 'tm_kamibomb_hit_01_emit.bp', ## Flames rising
	EmtBpPathAlt .. 'tm_kamibomb_hit_04_emit.bp', ## 
	EmtBpPathAlt .. 'tm_kamibomb_hit_03_emit.bp', ## Exploding flames
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tm_kamibomb_hit_06_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_07_emit.bp', ## Sparks flying out
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'tm_kamibomb_hit_09_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant3battletank3_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank2_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
}

Beetleprojectilehit01 = {
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tm_kamibomb_hit_06_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_07_emit.bp', ## Sparks flying out
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'tm_kamibomb_hit_09_emit.bp', ## Yellow Afterglow
	EmtBpPathAlt .. 'tmredglowbig_emit.bp',
	EmtBpPathAlt .. 'bm2rockethit_07_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
}

CybranHeavyProtonRocketHit = {
	EmtBpPathAlt .. 'tm_kamibomb_hit_01_emit.bp', ## glow
	EmtBpPathAlt .. 'tm_kamibomb_hit_03_emit.bp', ## Exploding flames
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tm_kamibomb_hit_06_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_07_emit.bp', ## Sparks flying out
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'tm_kamibomb_hit_09_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant3battletank3_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank2_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhitunit_emit.bp',
}

AeonClawHit01 = {
    EmtBpPath .. 'oblivion_cannon_hit_05_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_06_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_07_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_08_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_09_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_10_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_11_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_12_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_13_emit.bp',
    EmtBpPath .. 'cybran_corsair_missile_hit_ring.bp',
}

AeonT1EXM1MainHit01 = {
    EmtBpPath .. 'oblivion_cannon_hit_02_emit.bp',
    -- EmtBpPath .. 'disintegratorhvy_hit_sparks_01_emit.bp',
    EmtBpPath .. 'aeon_mortar02_shell_01_emit.bp',
    EmtBpPath .. 'aeon_mortar02_shell_02_emit.bp',
    EmtBpPath .. 'aeon_mortar02_shell_03_emit.bp',
    EmtBpPath .. 'aeon_mortar02_shell_04_emit.bp',
    EmtBpPath .. 'cybran_corsair_missile_hit_ring.bp',
}

AeonHvyClawHit01 = {
    EmtBpPath .. 'oblivion_cannon_hit_05_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_06_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_07_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_08_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_09_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_10_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_11_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_12_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_13_emit.bp',
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11	
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
    EmtBpPath .. 'napalm_hvy_thick_smoke_emit.bp',
    #EmtBpPath .. 'napalm_hvy_fire_emit.bp',
    EmtBpPath .. 'napalm_hvy_thin_smoke_emit.bp',
    EmtBpPath .. 'napalm_hvy_01_emit.bp',
    EmtBpPath .. 'napalm_hvy_02_emit.bp',
    EmtBpPath .. 'napalm_hvy_03_emit.bp',
}

UefT2EPDPlasmaHit01 = {
	EmtBpPathAlt .. 'uefepd_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_05_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_06_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_07_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_08_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_09_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_10_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_11_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_12_emit.bp',
}

UefT3SHPDGaussHit01 = {
	EmtBpPathAlt .. 'tm_kamibomb_hit_06_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'uefepd_cannon_hit_01b_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'shpd_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'shpd_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'shpd_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'shpd_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_10_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_11_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_12_emit.bp',
}

AeonT3HeavyRocketHit01 = {
    EmtBpPath .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_08_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_09_emit.bp',
    EmtBpPath .. 'antimatter_ring_02_emit.bp',	##	ring11
    EmtBpPath .. 'antimatter_hit_01_emit.bp',	##	glow	
    EmtBpPath .. 'antimatter_hit_02_emit.bp',	##	flash	     
    EmtBpPath .. 'antimatter_hit_03_emit.bp', 	##	sparks
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
    EmtBpPath .. 'napalm_hvy_thick_smoke_emit.bp',
    #EmtBpPath .. 'napalm_hvy_fire_emit.bp',
    EmtBpPath .. 'napalm_hvy_thin_smoke_emit.bp',
    EmtBpPath .. 'napalm_hvy_01_emit.bp',
    EmtBpPath .. 'napalm_hvy_02_emit.bp',
    EmtBpPath .. 'napalm_hvy_03_emit.bp',
}

AeonT3RocketHit01 = { 
    EmtBpPath .. 'antimatter_hit_03_emit.bp', 	##	sparks
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_01_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_02_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_03_emit.bp',
    EmtBpPath .. 'aeon_sonance_hit_04_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_08_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_03_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_06_emit.bp',
}

CybranT1BattleTankDeath = {
    EmtBpPath .. 'disintegratorhvy_hit_flash_flat_02_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_flat_03_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_04_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_05_emit.bp',
    EmtBpPath .. 'electron_bolter_hit_02_emit.bp',
    EmtBpPath .. 'electron_bolter_hit_03_emit.bp',
    EmtBpPath .. 'molecular_resonance_cannon_ring_02_emit.bp',
}

UEFHighExplosiveShellHit01 = {
	EmtBpPathAlt .. 'uefexmgauss_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'uefexmgauss_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'uefexmgauss_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'uefexmgauss_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'uefexmgauss_cannon_hit_05_emit.bp',
	EmtBpPathAlt .. 'uefexm_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'uefexm_cannon_hit_02_emit.bp',
}

UEFHighExplosiveShellHit02 = {
	EmtBpPathAlt .. 'uefepd_cannon_hit_01a_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_01_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_02_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_03_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_10_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_11_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_06_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_07_emit.bp',
	#EmtBpPath .. 'shipgauss_cannon_hit_08_emit.bp',
	EmtBpPath .. 'shipgauss_cannon_hit_09_emit.bp',
    EmtBpPath .. 'hvyproton_cannon_hit_distort_emit.bp',
    EmtBpPath .. 'antimatter_hit_02_emit.bp',	##	flash	     
    EmtBpPath .. 'antimatter_hit_03_emit.bp', 	##	sparks
    EmtBpPath .. 'antimatter_hit_04_emit.bp',	##	plume fire
    EmtBpPath .. 'antimatter_hit_05_emit.bp',	##	plume dark 
    EmtBpPath .. 'antimatter_hit_06_emit.bp',	##	base fire
    EmtBpPath .. 'antimatter_hit_07_emit.bp',	##	base dark 
    EmtBpPath .. 'antimatter_hit_08_emit.bp',	##	plume smoke
    EmtBpPath .. 'antimatter_hit_09_emit.bp',	##	base smoke
    EmtBpPath .. 'antimatter_hit_10_emit.bp',	##	plume highlights
    EmtBpPath .. 'antimatter_hit_11_emit.bp',	##	base highlights
    EmtBpPath .. 'seraphim_inaino_hit_03_emit.bp',			## long glow
}

AeonQuantumChargeHit01 = {
    EmtBpPath .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_08_emit.bp',
    EmtBpPath .. 'antimatter_hit_02_emit.bp',	##	flash	     
    EmtBpPath .. 'antimatter_hit_03_emit.bp', 	##	sparks
    EmtBpPath .. 'quantum_hit_flash_09_emit.bp',
    EmtBpPath .. 'aeon_commander_disruptor_hit_01_emit.bp', 
    EmtBpPath .. 'aeon_commander_disruptor_hit_02_emit.bp', 
    EmtBpPath .. 'aeon_commander_disruptor_hit_03_emit.bp',  
    EmtBpPath .. 'quark_bomb_explosion_03_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_04_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_05_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_08_emit.bp',
    EmtBpPath .. 'molecular_resonance_cannon_ring_02_emit.bp',
    EmtBpPath .. 'napalm_hvy_flash_emit.bp',
}

AeonEnforcerMainGuns = {
    EmtBpPath .. 'aeon_bomber_hit_01_emit.bp',
    EmtBpPath .. 'aeon_bomber_hit_02_emit.bp',
    EmtBpPath .. 'aeon_bomber_hit_03_emit.bp',
    EmtBpPath .. 'aeon_bomber_hit_04_emit.bp',
    EmtBpPath .. 'phalanx_muzzle_glow_01_emit.bp',
}

AeonQuantumChargeMuzzle01 = {
    EmtBpPath .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_07_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_08_emit.bp',
    EmtBpPath .. 'quantum_hit_flash_09_emit.bp',
    EmtBpPath .. 'aeon_commander_disruptor_hit_01_emit.bp', 
    EmtBpPath .. 'aeon_commander_disruptor_hit_02_emit.bp', 
    EmtBpPath .. 'aeon_commander_disruptor_hit_03_emit.bp',  
    EmtBpPath .. 'quark_bomb_explosion_03_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_04_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_05_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_07_emit.bp',
    EmtBpPath .. 'quark_bomb_explosion_08_emit.bp',
}

AeonT3EMPburst = {
    EmtBpPath .. 'shockwave_01_emit.bp',  
    EmtBpPath .. 'proton_bomb_hit_02_emit.bp',
}

CybranT3BattleBotDeath = {
    EmtBpPath .. 'molecular_resonance_cannon_ring_02_emit.bp',
    EmtBpPath .. 'phalanx_muzzle_glow_01_emit.bp',
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
    EmtBpPath .. 'cybran_corsair_missile_hit_ring.bp',
}

UefT2BattleTankHit = {
	EmtBpPathAlt .. 'landgauss_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_05a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02b_emit.bp',
}

UefT2BattleTankHit2 = {

	EmtBpPathAlt .. 'landgauss_cannon_hit_02c_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03b_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04b_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_05b_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_01fa_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02f_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02fa_emit.bp',
}

UefT3BattletankHit = {
	EmtBpPathAlt .. 'gauss_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02b_emit.bp',
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
	EmtBpPathAlt .. 'landgauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04a_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_01_emit.bp',
}

UefT3BattletankRocketHit = {
	EmtBpPathAlt .. 'gauss_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02b_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04a_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_01_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_02_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_03_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_04_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_05_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_06_emit.bp',
}

UEFHighExplosiveRocketHit = {
	EmtBpPathAlt .. 'gauss_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02b_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_02a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03a_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04a_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_01_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_02_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_03_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_04_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_05_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_06a_emit.bp',
	EmtBpPathAlt .. 'ueft3rocket_01a_emit.bp',
}

AeonT3BattleBotHit01 = {
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_01_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_02_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_03_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_04_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_05_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_06_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_07_emit.bp',
	EmtBpPathAlt .. 'aeont3armoredbattlebot_hit_08_emit.bp',
}

AeonT1ExperimentalLaserHit = {
	EmtBpPathAlt .. 'aeont1exlaser_hit_01_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_02_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_03_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_04_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_05_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_06_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_07_emit.bp',
	EmtBpPathAlt .. 'aeont1exlaser_hit_08_emit.bp',
}

AeonMainBattleTankHit01 = {
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit01.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit02.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit03.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit04.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit05.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit06.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit08.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit09.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit10.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit11.bp',
	EmtBpPathAlt .. 'aeonMainbattletank_hit_emit12.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_01b_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_02_emit.bp',
}

AeonNovaCatBlueLaserHit = {
    EmtBpPath .. 'oblivion_cannon_hit_05_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_06_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_07_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_08_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_09_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_10_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_11_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_12_emit.bp',
    EmtBpPath .. 'oblivion_cannon_hit_13_emit.bp',
    EmtBpPath .. 'cybran_corsair_missile_hit_ring.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_01_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_02_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_03_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_04_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_05_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_06_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_07_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_08_emit.bp',
    EmtBpPath .. 'seraphim_khu_anti_nuke_hit_09_emit.bp',
	EmtBpPath .. 'seraphim_heavyquarnon_cannon_frontal_glow_01_emit.bp',
}

TMagmaCannonMuzzleFlash = {
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'balrog_magma_cannon_muzzle_flash_01_emit.bp',
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'balrog_magma_cannon_muzzle_flash_02_emit.bp',
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_03_emit.bp',
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_04_emit.bp',
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_05_emit.bp',
    -- EmtBpPath .. 'ionized_plasma_gatling_cannon_laser_muzzle_flash_06_emit.bp',
	-- EmtBpPath .. 'fire_emit.bp',
}

BPPPlasmaPPCProjMuzzleFlash = {
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_02_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_03_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_04_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_05_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_flash_06_emit.bp',
    EmtBpPathAlt .. 'PPC_charge_test_01_emit.bp',
}

BPPPlasmaPPCProjChargeMuzzleFlash = {
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_charge_01_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_charge_02_emit.bp',
    EmtBpPathAlt .. 'seraphim_experimental_phasonproj_muzzle_charge_03_emit.bp',
}

ValiantHit = {
    EmtBpPathAlt .. 'aeon_valianthit_01.bp',
    EmtBpPathAlt .. 'aeon_valianthit_02.bp',
    EmtBpPathAlt .. 'aeon_valianthit_03.bp',
    EmtBpPathAlt .. 'aeon_valianthit_04.bp',
    EmtBpPathAlt .. 'aeon_valianthit_05.bp',
    EmtBpPathAlt .. 'aeon_valianthit_06.bp',
    EmtBpPathAlt .. 'aeon_valianthit_07.bp',
    EmtBpPathAlt .. 'aeon_valianthit_08.bp',
    EmtBpPathAlt .. 'aeon_valianthit_09.bp',
    EmtBpPathAlt .. 'aeon_valianthit_10.bp',
    EmtBpPathAlt .. 'aeon_valianthit_11.bp',
    EmtBpPathAlt .. 'aeon_valianthit_12.bp',
    EmtBpPathAlt .. 'aeon_valianthit_13.bp',
}

UEFArmoredBattleBotTrails = {
	EmtBpPath .. 'seraphim_tau_cannon_projectile_01_emit.bp',
	EmtBpPath .. 'seraphim_tau_cannon_projectile_02_emit.bp',	
}

UEFArmoredBattleBotPolyTrails = {
	EmtBpPath .. 'seraphim_tau_cannon_projectile_polytrail_01_emit.bp',
    EmtBpPath .. 'seraphim_heavyquarnon_cannon_projectile_trail_02_emit.bp',
}

UefT1BattleTankHit = {
	EmtBpPathAlt .. 'landgauss_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_05_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_02_emit.bp',
}

UEFmayhemRocketHit = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
}

UEFmayhemRocketHit2 = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'cosml_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'cosml_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'cosml_fire_emit.bp',	##	
}

UEFMayhemMK4hit1 = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'mayhemmk4blue_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'mayhemmk4blue_02_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'co_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'darkfireblue_emit.bp',	##
    EmtBpPathAlt .. 'fireblue_emit.bp',	##	
    EmtBpPath .. 'antimatter_ring_01_emit.bp',	##	ring14
    EmtBpPathAlt .. 'mayhemmk4blueglow_emit.bp',	##	
    EmtBpPathAlt .. 'mayhemmk4blueglowlong_emit.bp',	##	
}

UEFmayhemRocketHitA = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comed_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'comed_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'comed_fire_emit.bp',	##	
	EmtBpPathAlt .. 'ueft2experimental_missile_07_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_08_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_09_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_10_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_13_emit.bp',
    EmtBpPathAlt .. 'mayhemmk4blueglow2_emit.bp',	##	
}

UEFmayhemRocketHit2A = {
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'cosml_smoke_emit.bp',	##	
    EmtBpPathAlt .. 'cosml_darkfire_emit.bp',	##
    EmtBpPathAlt .. 'cosml_fire_emit.bp',	##	
    EmtBpPathAlt .. 'mayhemmk4blueglow2_emit.bp',	##	
}

AeonT2ExperimentalTankHunterHit01 = {
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_01_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_02_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_03_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_04_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_05_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_06_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_07_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_08_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_09_emit.bp',
	EmtBpPathAlt .. 'AeonT2TankHunter_hit_10_emit.bp',
}

CLaserBotHit01 = {
    EmtBpPath .. 'disintegratorhvy_hit_flash_flat_02_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_flat_03_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_04_emit.bp',
    EmtBpPath .. 'disintegratorhvy_hit_flash_05_emit.bp',
    EmtBpPath .. 'electron_bolter_hit_02_emit.bp',
    EmtBpPath .. 'electron_bolter_hit_03_emit.bp',
    EmtBpPath .. 'molecular_resonance_cannon_ring_02_emit.bp',
}

BRMT1EXTANKTRAILS = {
    EmtBpPathAlt .. 'cybran_advancedt1tank_polytrail_01_emit.bp',
}

BRMT1EXTANKHIT = {
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit01_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit01b_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit02_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit03_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit04_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit05_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit06_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit07_emit.bp',
	EmtBpPathAlt .. 'cybran_advancedt1tank_hit06b_emit.bp',
}

TMagmaCannonHit01 = { 
    EmtBpPath .. 'napalm_hvy_thick_smoke_emit.bp',
    EmtBpPath .. 'napalm_hvy_01_emit.bp',
    EmtBpPathAlt .. 'balrog_proton_bomb_hit_01_emit.bp',
    EmtBpPathAlt .. 'balrog_antimatter_hit_01_emit.bp',
    EmtBpPath .. 'antimatter_hit_02_emit.bp',
    EmtBpPathAlt .. 'balrog_antimatter_hit_06_emit.bp',
    EmtBpPath .. 'antimatter_hit_07_emit.bp',
    EmtBpPath .. 'antimatter_hit_09_emit.bp',
    EmtBpPath .. 'antimatter_hit_11_emit.bp',
	EmtBpPath .. 'antimatter_ring_04_emit.bp',
}

TMagmaCannonHit02 = {
    EmtBpPath .. 'antimatter_hit_09_emit.bp',
}

TMagmaCannonHit03 = {
    EmtBpPath .. 'antimatter_hit_03_emit.bp',
    EmtBpPath .. 'explosion_fire_sparks_01_emit.bp',
    EmtBpPath .. 'flash_01_emit.bp',
}

TMagmaCannonUnitHit = TableCat( TMagmaCannonHit01, TMagmaCannonHit03, UnitHitShrapnel01 )

TMagmaCannonHit = TableCat( TMagmaCannonHit01, TMagmaCannonHit02 )

TMagmaCannonMuzzleFlash = {
    EmtBpPathAlt .. 'balrog_magma_cannon_muzzle_flash_01_emit.bp',
    EmtBpPathAlt .. 'balrog_magma_cannon_muzzle_flash_02_emit.bp',
}

TMagmaCannonFxTrails = {
    EmtBpPathAlt .. 'balrog_magma_projectile_fxtrail_01_emit.bp',
}

TMagmaCannonPolyTrails = {
    EmtBpPathAlt .. 'balrog_missile_smoke_polytrail_01_emit.bp',
    EmtBpPathAlt .. 'balrog_missile_smoke_polytrail_02_emit.bp',
}

BRMT3EXBMPOWEREFFECT = {
    EmtBpPath .. 'economy_electricity_01_emit.bp',
}

CybranT3BattleTankHit = {
	EmtBpPathAlt .. 'hvyproton_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'hvyproton_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_05_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_07_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_09_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank3_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank2_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank_emit.bp',
	EmtBpPathAlt .. 'tm_kamibomb_hit_09a_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant3battletankhitunit_emit.bp',
	EmtBpPathAlt .. 'tmcybrant2battletankhit_08_emit.bp', ## white exploding glow in middle
	EmtBpPathAlt .. 'tmcybrant2battletankhit_09_emit.bp', ## black exploding dots in middle
    EmtBpPathAlt .. 'battletankt3flames_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
}

CybranT3BattleTankRocketHit = {
	EmtBpPathAlt .. 'hvyproton_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'hvyproton_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'hvyproton_cannon_hit_03_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_04_emit.bp',
    EmtBpPathAlt .. 'hvyproton_cannon_hit_10_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank3_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletank_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhitunit_02_emit.bp',
    EmtBpPathAlt .. 'tmcybrant3battletankhitunit_01_emit.bp',
}

AEONT2HEAVYHOVERTANKHIT = {
	EmtBpPathAlt .. 'aeont2hovertankhit_01_emit.bp', ## sparks
	EmtBpPathAlt .. 'aeont2hovertankhit_02_emit.bp', ## black smoke
	EmtBpPathAlt .. 'aeont2hovertankhit_03_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_04_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_05_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_06_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_07_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_08_emit.bp', ##
	EmtBpPathAlt .. 'aeont2hovertankhit_09_emit.bp', ##
}

UEFHeavyMechHit01 = {
	EmtBpPathAlt .. 'uefepd_cannon_hit_01a_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_02_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_05_emit.bp',

	EmtBpPathAlt .. 'uefepd_cannon_hit_07_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_08_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_09_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_10_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_11_emit.bp',
	EmtBpPathAlt .. 'uefepd_cannon_hit_12_emit.bp',
	EmtBpPath .. 'seraphim_expnuke_prelaunch_09_emit.bp',	## blueish glow
}

UefT1MedTankHit = {
	EmtBpPathAlt .. 'landgauss_cannon_hit_01_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_03_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_04_emit.bp',
	EmtBpPathAlt .. 'landgauss_cannon_hit_05_emit.bp',
	EmtBpPathAlt .. 'gauss_cannon_hit_01_emit.bp',
}

CybranT2BattleTankHit = {
    EmtBpPathAlt .. 'tmcybrant2battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
	EmtBpPathAlt .. 'tmcybrant2battletankhit_02_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tmcybrant2battletankhit_03_emit.bp', ## white sparks flying opposite direction of impact
	EmtBpPathAlt .. 'tmcybrant2battletankhit_04_emit.bp', ## dirt flying
	EmtBpPathAlt .. 'tmcybrant2battletankhit_05_emit.bp', ## ring
	EmtBpPathAlt .. 'tmcybrant2battletankhit_06_emit.bp', ## white glow in middle
	EmtBpPathAlt .. 'tmcybrant2battletankhit_07_emit.bp', ## black dots on ground
	EmtBpPathAlt .. 'tmcybrant2battletankhit_08_emit.bp', ## white exploding glow in middle
	EmtBpPathAlt .. 'tmcybrant2battletankhit_09_emit.bp', ## black exploding dots in middle
}

AeonGraniteHit01 = {
    EmtBpPathAlt .. 'aeongranite_01_emit.bp',
    EmtBpPathAlt .. 'aeongranite_02_emit.bp',
    EmtBpPathAlt .. 'aeongranite_03_emit.bp',
    EmtBpPathAlt .. 'aeongranite_04_emit.bp',
    EmtBpPathAlt .. 'aeongranite_05_emit.bp',
    EmtBpPathAlt .. 'aeongranite_06_emit.bp',
    EmtBpPathAlt .. 'aeongranite_07_emit.bp',
    EmtBpPathAlt .. 'aeongranite_08_emit.bp',
}

THeavyFragmentationGrenadeHitMK = {
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_01_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_02_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_03_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_04_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_05_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_06_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_07_emit.bp',
    EmtBpPathAlt .. 'terran_fragmentation_grenade_hit_MK_08_emit.bp',
}

DefaultProjectileWaterImpact = {
    EmtBpPathAlt .. 'destruction_water_splash_wash_01_emit.bp',
    EmtBpPathAlt .. 'destruction_water_splash_ripples_01_emit.bp',
    EmtBpPathAlt .. 'destruction_water_splash_plume_01_emit.bp',
}

CybranT3AdvancedBattleBotHit01 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_01_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_03_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_04_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_05_emit.bp',
	EmtBpPathAlt .. 'tm_kamibomb_hit_05_emit.bp', ## Red glow
	EmtBpPathAlt .. 'tmcybrant2battletankhit_07_emit.bp', ## black dots on ground
	EmtBpPathAlt .. 'bm2rockethit_06_emit.bp', ## ring
	EmtBpPathAlt .. 'hvyproton_cannon_hit_02_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_10_emit.bp', ## Exploding flames
    EmtBpPathAlt .. 'tmcybrant3battletankhit_distort_emit.bp',
	EmtBpPathAlt .. 'bm2rockethit_07_emit.bp', ## Ring effect
	EmtBpPathAlt .. 'tm_kamibomb_hit_08_emit.bp', ## White inner ring
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
	EmtBpPathAlt .. 'bm2rockethit_09_emit.bp', ## Red glow explosion with smoke
    EmtBpPathAlt .. 'bm2rockethit_11_emit.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
    EmtBpPathAlt .. 'tmcybrant2battletankhit_distort_emit.bp',
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emit.bp', ## Exploding flames
    EmtBpPath .. 'antimatter_hit_07_emit.bp',	##	base dark 
}

CybranT3AdvancedBattleBotDeath01 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_03_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_04_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_05_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_06_emit.bp',
    EmtBpPathAlt .. 'quantum_hit_flash_07_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_11_emit.bp',
	EmtBpPathAlt .. 'ueft2experimental_missile_12_emit.bp',
    EmtBpPath .. 'antimatter_hit_09_emit.bp',	##	base smoke
    EmtBpPath .. 'antimatter_hit_07_emit.bp',	##	base dark 
}

MadCatDeath01 = {
	EmtBpPathAlt .. 'cybran_t2beetle_01_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_02_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_03_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_04_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_05_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_06_emit.bp',
	EmtBpPathAlt .. 'cybran_t2beetle_07_emit.bp',
    EmtBpPathAlt .. 'bigdistort_emit.bp',
    EmtBpPathAlt .. 'bm2rockethit_12_emit.bp', ## white glow
	EmtBpPathAlt .. 'bm2rockethit_08_emit.bp', ## Yellow Afterglow
    EmtBpPathAlt .. 'tmcybrant2battletankhit_01_emita.bp', ## Exploding flames
    EmtBpPathAlt .. 'bm2rockethit_11_emitaa.bp', ## Cool exploding flames!!!
    EmtBpPathAlt .. 'comedred_darkfire_emit.bp',	##	
    EmtBpPathAlt .. 'comedred_fire_emit.bp',	##
    EmtBpPathAlt .. 'comedred_smoke_emit.bp',	##	
}
