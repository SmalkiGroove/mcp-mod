
local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SDFPhasicAutoGunWeapon = SeraphimWeapons.SDFPhasicAutoGunWeapon
local SANHeavyCavitationTorpedo = SeraphimWeapons.SANHeavyCavitationTorpedo

tcas0201 = Class(SAirUnit) {
    Weapons = {
        Missile = Class(SDFPhasicAutoGunWeapon) {},
        AAMissile = Class(SDFPhasicAutoGunWeapon) {},
        Torpedo = Class(SANHeavyCavitationTorpedo) {},
        },

    ### Setsup parent call backs between drone and parent
    Parent = false,

    SetParent = function(self, parent, droneName)
        self.Parent = parent
        self.Drone = droneName
    end,

##########################################################################

    OnCreate = function(self, builder, layer)
    SAirUnit.OnCreate(self,builder,layer)
        ### Are we dead?
        if not self:IsDead() then
 
            ### Start of launch special effects
            self:ForkThread(self.LaunchEffects)

            ### Global Varibles###
            self.DroneMaxSpeed = 22
            self.DistanceToTarget = nil
            self.MyTarget = {}
        end
    end,

    LaunchEffects = function(self)
        ### Are we dead?
        if not self:IsDead() then
            ### Duration of launch
            WaitSeconds(2)
            if not self:IsDead() then

                ### Heartbeat event to monitor the drones distance from the carrier, if the drone gets too far away it is recalled to the carrier
                self:HeartBeatDistanceCheck()
            end
        end
    end,

    HeartBeatDistanceCheck = function(self)
        ### Global variable setup
        self.AwayFromCarrier = false

        while self and not self:IsDead() and not self.Parent:IsDead() do
            WaitSeconds(2)
            if not self:IsDead() and not self.Parent:IsDead() then
                local dronePos = self:GetPosition()
                local parentPos = self.Parent:GetPosition()
                local distance = VDist2(dronePos[1], dronePos[3], parentPos[1], parentPos[3])
                if distance > 160 and self.AwayFromCarrier == false then
                    ### Disables weapons and returns drone to carrier if the drone is past a range of **128***
                        IssueStop({self})
                        IssueClearCommands({self})
                    self.AwayFromCarrier = true
                    self:ForkThread(self.GuardCarrier)

                elseif distance <= 128 and self.AwayFromCarrier == true then
                    ### Enables weapons if the drone is in range of the carrier, allowing drone to engage a targets of opportunity
                    self.AwayFromCarrier = false
				end
			end
		end
	end,

    OnMotionHorzEventChange = function(self, new, old)
        ### Should the drone stop flying it will automaticly be re-assigned to guard the carrier
        if not self:IsDead() and new == 'Stopped' and not self.Parent:IsDead() then
            ### Clears the current drone commands if any and forces the drone to guard the carrier         
            self:ForkThread(self.GuardCarrier)

        elseif not self:IsDead() and new == 'Stopping' and not self.Parent:IsDead() then
            ### Clears the current drone commands if any and forces the drone to guard the carrier           
            self:ForkThread(self.GuardCarrier)    
        SAirUnit.OnMotionHorzEventChange(self, new, old)
		end
    end,

    GuardCarrier = function(self)
        if not self:IsDead() and not self.Parent:IsDead() then
            ### Tells the drone to guard the carrier
            IssueClearCommands(self)
            IssueGuard({self}, self.Parent)
        end
    end,

    OnDamage = function(self, instigator, amount, vector, damagetype)
        SAirUnit.OnDamage(self, instigator, amount, vector, damagetype)
        if self:IsDead() == false and instigator and IsUnit(instigator) then
            IssueAttack({self}, instigator)
        end
    end,

    OnKilled = function(self, instigator, type, overkillRatio)
        ### Disables weapons
        self:SetWeaponEnabledByLabel('Missile', false)

        ### Clears the current drone commands if any
        IssueClearCommands(self)

        ### Notifies parent of drone death and clears the offending drone from the parents table
        if not self.Parent:IsDead() then
            self.Parent:NotifyOfDroneDeath(self.Drone)
            table.removeByValue(self.Parent.DroneTable, self)
            self.Parent = nil
        end

        ### Final command to finish off the drones death event
        SAirUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
}

TypeClass = tcas0201