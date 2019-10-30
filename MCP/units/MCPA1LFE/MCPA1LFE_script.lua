local AConstructionUnit = import(import( '/lua/game.lua' ).Path() .. '/units/mcpa3lfe/mcpa3lfe_script.lua').MCPA3LFE

MCPA1LFE = Class(AConstructionUnit) { 
    OnCreate = function( self ) 
        AConstructionUnit.OnCreate(self)
        self:HideBone('Tube002', true)
        self:HideBone('Tube003', true)
    end,
}

TypeClass = MCPA1LFE
