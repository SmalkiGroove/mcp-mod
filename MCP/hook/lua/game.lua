
do
        
    --------------------------------------------------------------------------------
    -- Adapted from Manimal's mod locator script.
    -- Because I'm sick of people moaning when they put it in the wrong hole.
    -- Note to self: UID also in blueprints.lua and mod_info.lua
    --------------------------------------------------------------------------------
    Path = function()
        for i, mod in __active_mods do
            if mod.uid == "b117ef40-2b6b-4596-96c5-0e8887ac0807" then
                return mod.location
            end
        end 
    end   
end
