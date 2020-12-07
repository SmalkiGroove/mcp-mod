local AConstructionUnit = import(import( '/lua/game.lua' ).Path() .. '/units/mal0310/mal0310_script.lua').MAL0310

MAL0110 = Class(AConstructionUnit) { 
    OnCreate = function( self ) 
        AConstructionUnit.OnCreate(self)
        self:HideBone('Tube002', true)
        self:HideBone('Tube003', true)
    end,
}

TypeClass = MAL0110
