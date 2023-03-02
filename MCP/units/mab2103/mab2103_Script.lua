local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local MCPWeaponsFile = import('/mods/MCP/lua/MCPWeapons.lua')
local TMAmizurabluelaserweapon = MCPWeaponsFile.TMAmizurabluelaserweapon
local MCPEffectTemplate = import('/mods/MCP/lua/MCPEffectTemplates.lua')

MAB2103 = Class(TStructureUnit) {
        Weapons = {
                laserblue = Class(TMAmizurabluelaserweapon) {

                },
                laserblue2 = Class(TMAmizurabluelaserweapon) {

                },
                laserblue3 = Class(TMAmizurabluelaserweapon) {

                },
                laserblue4 = Class(TMAmizurabluelaserweapon) {

                },
        },
        OnKilled = function(self, instigator, damagetype, overkillRatio)
                TStructureUnit.OnKilled(self, instigator, damagetype, overkillRatio)
                self:CreatTheEffectsDeath()  
        end,

        CreatTheEffectsDeath = function(self)
                local army =  self:GetArmy()
                for k, v in MCPEffectTemplate['AeonUnitDeathRing03'] do
                        self.Trash:Add(CreateAttachedEmitter(self, 'BROT1EXPD', army, v):ScaleEmitter(0.85))
                end
        end,
}

TypeClass = MAB2103