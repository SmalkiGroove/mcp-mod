local AConstructionUnit = import('/mods/MCP/units/mal0310/mal0310_script.lua').MAL0310

MAL0210 = Class(AConstructionUnit) { 
    OnCreate = function( self ) 
        AConstructionUnit.OnCreate(self)
        self:HideBone('Tube003', true)
    end,
}

TypeClass = MAL0210

