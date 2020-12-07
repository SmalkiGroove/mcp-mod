local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local SIFSuthanusArtilleryCannon = import('/lua/seraphimweapons.lua').SIFSuthanusMobileArtilleryCannon

MSL0204 = Class(SHoverLandUnit) {
    Weapons = {
        TauCannon01 = Class(SIFSuthanusArtilleryCannon){
            FxMuzzleFlashScale = 1.5,
        },
    },
}
TypeClass = MSL0204