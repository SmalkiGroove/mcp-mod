local AConstructionUnit = import(import( '/lua/game.lua' ).Path() .. '/units/mcpa3lfe/mcpa3lfe_script.lua').MCPA3LFE

MAL0210 = Class(AConstructionUnit) { 
    OnCreate = function( self ) 
        AConstructionUnit.OnCreate(self)
        self:HideBone('Tube003', true)
    end,
}

TypeClass = MAL0210

