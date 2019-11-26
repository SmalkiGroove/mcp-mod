local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SLaanseMissileWeapon = SeraphimWeapons.SLaanseMissileWeapon
local SANHeavyCavitationTorpedo = SeraphimWeapons.SANHeavyCavitationTorpedo

MCPS1NXDC = Class(SSeaUnit) {
    Weapons = {
        AAMissile = Class(SLaanseMissileWeapon) {},
        Torpedo = Class(SANHeavyCavitationTorpedo) {},
        Missile = Class(SLaanseMissileWeapon) {},
        },
		
OnStopBeingBuilt = function(self,builder,layer)
    SSeaUnit.OnStopBeingBuilt(self,builder,layer)

    ### Initializes Drone spawn sequence and radar jammer energy useage
    self:ForkThread(self.InitialDroneSpawn)
    self:SetScriptBit('RULEUTC_ProductionToggle', false)
    self:RequestRefreshUI()
    self.UnitComplete = true
    self.Army = self:GetArmy()

    ### Global Varibles###
    self.HitsTaken = 0
    self.DmgTotal = 0
    self.Side = 0
    self.DroneTable = {}

end,

InitialDroneSpawn = function(self)
    ### spawning a number of drones times equal to the number preset by numcreate
    local numcreate = 8

    self.Side = 1

    ### Short delay after the carrier has been built
    WaitSeconds(2)

    ### Are we dead yet, if not spawn drones
    if not self:IsDead() then
        for i = 0, (numcreate -1) do
            if not self:IsDead() then 
                self:ForkThread(self.SpawnDrone) 
                ### Short delay between spawns to spread them out
                WaitSeconds(1)
            end
        end
    end
end,

SpawnDrone = function(self)
    ### Small respawn delay so the drones are not instantly respawned after death
#    LOG('*RESPAWNING LOST DRONES')
    WaitSeconds(1)

    ### Only respawns the drones if the parent unit is not dead
    if not self:IsDead() then 

        ### Sets up local Variables used and spawns a drone at the parents location 
        local myOrientation = self:GetOrientation()
      
        if self.Side == 1 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone07')

            ### Creates our drone in the left launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)  

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the left to the right self.Side after a drone has been spawned
            self.Side = 2

            ###Drone clean up scripts
            self.Trash:Add(drone)

        elseif self.Side == 2 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone08')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 3

            ###Drone clean up scripts
            self.Trash:Add(drone)
            
        elseif self.Side == 3 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone01')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 4

            ###Drone clean up scripts
            self.Trash:Add(drone)
            
        elseif self.Side == 4 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone06')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 5

            ###Drone clean up scripts
            self.Trash:Add(drone)
			
        elseif self.Side == 5 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone02')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 6

            ###Drone clean up scripts
            self.Trash:Add(drone)

			elseif self.Side == 6 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone04')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 7

            ###Drone clean up scripts
            self.Trash:Add(drone)
			
			elseif self.Side == 7 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone03')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 8

            ###Drone clean up scripts
            self.Trash:Add(drone)

			elseif self.Side == 8 then
            ### Gets the current position of the carrier launch bay in the game world
            local location = self:GetPosition('Drone05')

            ### Creates our drone in the right launch bay and directs the unit to face the same direction as its parent unit
            local drone = CreateUnit('tcas0201', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air') 

            ### Adds the newly created drone to the parent carriers drone table
            table.insert (self.DroneTable, drone)

            ### Sets the Carrier unit as the drones parent
            drone:SetParent(self, 'MCPS1NXDC')
            drone:SetCreator(self)

            ### Issues the guard command
            IssueClearCommands({drone})
            IssueGuard({drone}, self)

            ### Flips from the right to the left self.Side after a drone has been spawned
            self.Side = 1

            ###Drone clean up scripts
            self.Trash:Add(drone)
        end
    end
end,

NotifyOfDroneDeath = function(self) 
    ### Only respawns the drones if the parent unit is not dead 
    if not self:IsDead() then
        local mass = self:GetAIBrain():GetEconomyStored('Mass')
        local energy = self:GetAIBrain():GetEconomyStored('Energy')

        ### Check to see if the player has enough mass / energy
        ### And that the production is enabled.
        if self:GetScriptBit('RULEUTC_ProductionToggle') == false and mass >= 250 and energy >= 5000 then 

            ###Remove the resources and spawn a single drone
            self:GetAIBrain():TakeResource('Mass',550) 
            self:GetAIBrain():TakeResource('Energy',11000)
            self:ForkThread(self.SpawnDrone) 

        else
            ### If the above conditions are not met the carrier will wait a short time and try again
            self:ForkThread(self.EconomyWait)
        end
    end    
end,

EconomyWait = function(self)
    if not self:IsDead() then
    WaitSeconds(3)
        if not self:IsDead() then
            self:ForkThread(self.NotifyOfDroneDeath)
        end
    end
end,

OnDamage = function(self, instigator, amount, vector, damagetype) 
    ### Check to make sure that the carrier isnt already dead and what just damaged it is a unit we can attack
    if self:IsDead() == false and IsUnit(instigator) then 

        ### Update of global Variables 

        self.HitsTaken = self.HitsTaken + 1 
        self.DmgTotal = self.DmgTotal + amount 

        ### Attack trigger command 
        if self.DmgTotal >= 1000 or self.HitsTaken >= 10 then
 
            ###Issues the retaliation command to each of the drones on the carriers table 
            if table.getn({self.DroneTable}) > 0 then
                for k, v in self.DroneTable do 
                    IssueClearCommands({self.DroneTable[k]})
                    IssueAttack({self.DroneTable[k]}, instigator)
                end 
            end 

            ### Reset of global Variables 
            self.HitsTaken = 0 
            self.DmgTotal = 0 

        end
    end 
SSeaUnit.OnDamage(self, instigator, amount, vector, damagetype) 
end,

OnKilled = function(self, instigator, type, overkillRatio)
    ### Small bit of table manipulation to sort thru all of the avalible drones and remove them after the carrier is dead
    if table.getn({self.DroneTable}) > 0 then
        for k, v in self.DroneTable do 
            IssueClearCommands({self.DroneTable[k]}) 
            IssueKillSelf({self.DroneTable[k]})
        end 
    end
 
    ### Final command to finish off the carriers death event
    SSeaUnit.OnKilled(self, instigator, type, overkillRatio)
end,
}

TypeClass = MCPS1NXDC

