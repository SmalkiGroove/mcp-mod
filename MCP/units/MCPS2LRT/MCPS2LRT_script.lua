local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon

MCPS2LRT = Class(SHoverLandUnit) {
    Weapons = {
        TauCannon01 = Class(SIFSuthanusArtilleryCannon){
            FxMuzzleFlashScale = 1.5,
        },
    },
}
TypeClass = MCPS2LRT