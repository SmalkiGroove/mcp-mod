local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local WeaponsFile = import ('/lua/seraphimweapons.lua')
local WeaponsFile2 = import ('/mods/MCP/lua/MCPWeapons.lua')
local YenzothaExperimentalLaser = WeaponsFile2.YenzothaExperimentalLaser
local SAAOlarisCannonWeapon = WeaponsFile.SAAOlarisCannonWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')
local explosion = import('/lua/defaultexplosions.lua')
local BaseTransport = import('/lua/defaultunits.lua').BaseTransport

MCPS4LHT = Class(BaseTransport, SHoverLandUnit) {
    SpawnEffects = {
        '/effects/emitters/seraphim_othuy_spawn_01_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_02_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_03_emit.bp',
        '/effects/emitters/seraphim_othuy_spawn_04_emit.bp',
    },
    
    ChargeEffects01 = {
        '/effects/emitters/seraphim_expirimental_laser_muzzle_01_emit.bp',
        '/effects/emitters/seraphim_expirimental_laser_muzzle_02_emit.bp',
        '/effects/emitters/seraphim_expirimental_laser_muzzle_03_emit.bp',
        '/effects/emitters/seraphim_expirimental_laser_muzzle_04_emit.bp',
    },
    
    Weapons = {
        EyeWeapon01 = Class(YenzothaExperimentalLaser) {
            OnWeaponFired = function(self)
                YenzothaExperimentalLaser.OnWeaponFired(self)
                if self.unit.ChargeEffects01Bag then
                    for k, v in self.unit.ChargeEffects01Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects01Bag = {}
                end
                if self.unit.BeamChargeEffects1 then
                    for k, v in self.unit.BeamChargeEffects1 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects1 = {}
                end
                table.insert(self.unit.BeamChargeEffects1, AttachBeamEntityToEntity(self.unit, 'Focus_Beam01_Emitter01', self.unit, 'Focus_Beam01_Emitter02', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects01Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam01_Emitter01', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects1, AttachBeamEntityToEntity(self.unit, 'Focus_Beam01_Emitter02', self.unit, 'Focus_Beam01_Emitter03', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects01Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam01_Emitter02', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects1, AttachBeamEntityToEntity(self.unit, 'Focus_Beam01_Emitter03', self.unit, 'Beam_Point_Focus01', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects01Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam01_Emitter03', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                    table.insert(self.unit.ChargeEffects01Bag, CreateAttachedEmitter(self.unit, 'Beam_Point_Focus01', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
            end,
            
            PlayFxWeaponPackSequence = function(self)
                if self.unit.BeamChargeEffects1 then
                    for k, v in self.unit.BeamChargeEffects1 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects1 = {}
                end
                if self.unit.ChargeEffects01Bag then
                    for k, v in self.unit.ChargeEffects01Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects01Bag = {}
                end
                YenzothaExperimentalLaser.PlayFxWeaponPackSequence(self)
            end,
        },
        
        EyeWeapon02 = Class(YenzothaExperimentalLaser) {
            OnWeaponFired = function(self)
                YenzothaExperimentalLaser.OnWeaponFired(self)
                if self.unit.ChargeEffects02Bag then        
                    for k, v in self.unit.ChargeEffects02Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects02Bag = {}
                end
                if self.unit.BeamChargeEffects2 then
                    for k, v in self.unit.BeamChargeEffects2 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects2 = {}
                end
                table.insert(self.unit.BeamChargeEffects2, AttachBeamEntityToEntity(self.unit, 'Focus_Beam02_Emitter01', self.unit, 'Focus_Beam02_Emitter02', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects02Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam02_Emitter01', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects2, AttachBeamEntityToEntity(self.unit, 'Focus_Beam02_Emitter02', self.unit, 'Focus_Beam02_Emitter03', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects02Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam02_Emitter02', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects2, AttachBeamEntityToEntity(self.unit, 'Focus_Beam02_Emitter03', self.unit, 'Beam_Point_Focus02', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects02Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam02_Emitter03', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                    table.insert(self.unit.ChargeEffects02Bag, CreateAttachedEmitter(self.unit, 'Beam_Point_Focus02', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
            end,
            
            PlayFxWeaponPackSequence = function(self)
                if self.unit.BeamChargeEffects2 then
                    for k, v in self.unit.BeamChargeEffects2 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects2 = {}
                end
                if self.unit.ChargeEffects02Bag then
                    for k, v in self.unit.ChargeEffects02Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects02Bag = {}
                end
                YenzothaExperimentalLaser.PlayFxWeaponPackSequence(self)
            end,
        },
        
        EyeWeapon03 = Class(YenzothaExperimentalLaser) {
            OnWeaponFired = function(self)
                YenzothaExperimentalLaser.OnWeaponFired(self)
                if self.unit.ChargeEffects03Bag then        
                    for k, v in self.unit.ChargeEffects03Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects03Bag = {}
                end
                if self.unit.BeamChargeEffects3 then
                    for k, v in self.unit.BeamChargeEffects3 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects3 = {}
                end
                table.insert(self.unit.BeamChargeEffects3, AttachBeamEntityToEntity(self.unit, 'Focus_Beam03_Emitter01', self.unit, 'Focus_Beam03_Emitter02', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects03Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam03_Emitter01', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects3, AttachBeamEntityToEntity(self.unit, 'Focus_Beam03_Emitter02', self.unit, 'Focus_Beam03_Emitter03', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects03Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam03_Emitter02', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
                table.insert(self.unit.BeamChargeEffects3, AttachBeamEntityToEntity(self.unit, 'Focus_Beam03_Emitter03', self.unit, 'Beam_Point_Focus03', self.unit:GetArmy(), '/mods/MCP/effects/emitters/seraphim_expirimental_laser_charge_beam_emit.bp'))
                for k, v in self.unit.ChargeEffects01 do
                    table.insert(self.unit.ChargeEffects03Bag, CreateAttachedEmitter(self.unit, 'Focus_Beam03_Emitter03', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                    table.insert(self.unit.ChargeEffects03Bag, CreateAttachedEmitter(self.unit, 'Beam_Point_Focus03', self.unit:GetArmy(), v):ScaleEmitter(0.5))
                end
            end,
            
            PlayFxWeaponPackSequence = function(self)
                if self.unit.BeamChargeEffects3 then
                    for k, v in self.unit.BeamChargeEffects3 do
                        v:Destroy()
                    end
                    self.unit.BeamChargeEffects3 = {}
                end
                if self.unit.ChargeEffects03Bag then
                    for k, v in self.unit.ChargeEffects03Bag do
                        v:Destroy()
                    end
                    self.unit.ChargeEffects03Bag = {}
                end
                YenzothaExperimentalLaser.PlayFxWeaponPackSequence(self)
            end,
        },
        LeftAA = Class(SAAOlarisCannonWeapon) {},
        RightAA = Class(SAAOlarisCannonWeapon) {},
    },
    
    StartBeingBuiltEffects = function(self, builder, layer)
        SHoverLandUnit.StartBeingBuiltEffects(self, builder, layer)
        self:ForkThread(EffectUtil.CreateSeraphimExperimentalBuildBaseThread, builder, self.OnBeingBuiltEffectsBag)
    end,
        
    OnStopBeingBuilt = function(self,builder,layer)
        self.slots = {}
        self.transData = {}
        SHoverLandUnit.OnStopBeingBuilt(self,builder,layer)        
        self.BeamChargeEffects1 = {}
        self.ChargeEffects01Bag = {}
        self.BeamChargeEffects2 = {}
        self.ChargeEffects02Bag = {}
        self.BeamChargeEffects3 = {}
        self.ChargeEffects03Bag = {}
        
        -- Button status toggles
        self.DroneMaintenance = true
        self.DroneAssist = true
        
        -- Assist management globals
        self.MyAttacker = nil
        self.MyTarget = nil

        -- Drone construction/repair buildrate
        self.BuildRate = self:GetBlueprint().Economy.BuildRate or 30

        -- Drone setup (load globals/tables & create drones)
        self:DroneSetup()
    end,
    
    -- Places the Goliath's first drone-targetable attacker into a global
    OnDamage = function(self, instigator, amount, vector, damagetype)
        if not self:IsDead()
        and self.MyAttacker == nil
        and self:IsValidDroneTarget(instigator) then
            self.MyAttacker = instigator
        end
        SHoverLandUnit.OnDamage(self, instigator, amount, vector, damagetype)
    end,
    
    -- Drone control buttons
    OnScriptBitSet = function(self, bit)
        -- Drone assist toggle, on
        if bit == 1 then
            self.DroneAssist = false
        -- Drone recall button
        elseif bit == 7 then
            self:RecallDrones()
            -- Pop button back up, as it's not actually a toggle
            self:SetScriptBit('RULEUTC_SpecialToggle', false)
        else
            SHoverLandUnit.OnScriptBitSet(self, bit)
        end
    end,    
    OnScriptBitClear = function(self, bit)
        -- Drone assist toggle, off
        if bit == 1 then
            self.DroneAssist = true
        -- Recall button reset, do nothing
        elseif bit == 7 then
            return
        else
            SHoverLandUnit.OnScriptBitClear(self, bit)
        end
    end,
    
    -- Handles drone docking
    OnTransportAttach = function(self, attachBone, unit)
        self.DroneData[unit.Name].Docked = attachBone
        unit:SetDoNotTarget(true)
        BaseTransport.OnTransportAttach(self, attachBone, unit)
    end,
    
    -- Handles drone undocking, also called when docked drones die
    OnTransportDetach = function(self, attachBone, unit)
        self.DroneData[unit.Name].Docked = false
        unit:SetDoNotTarget(false)
        if unit.Name == self.BuildingDrone then
            self:CleanupDroneMaintenance(self.BuildingDrone)
        end
        BaseTransport.OnTransportDetach(self, attachBone, unit)
    end,

    -- Cleans up threads and drones on death
    OnKilled = function(self, instigator, damageType, overkillRatio)
        -- Kill our heartbeat thread
        KillThread(self.HeartBeatThread)
        -- Clean up any in-progress construction
        ChangeState(self, self.DeadState)
        -- Immediately kill existing drones
        if type (self.DroneTable) == "table" then
            if next(self.DroneTable) then
                for name, drone in self.DroneTable do
                    IssueClearCommands({drone})
                    IssueKillSelf({drone})
                end
            end
        end
        SHoverLandUnit.OnKilled(self, instigator, damageType, overkillRatio)
    end,
    
    -- Initial drone setup - loads globals, DroneData table, and creates drones
    DroneSetup = function(self)
        -- Drone handle table, used to issue orders to all drones at once
        self.DroneTable = {}
        
        -- Drone construction globals
        self.BuildingDrone = false
        
        -- Drone control parameters (inherited by drones in SetParent)
        self.ControlRange = self:GetBlueprint().AI.DroneControlRange or 70
        self.ReturnRange = self:GetBlueprint().AI.DroneReturnRange or (ControlRange / 2)
        self.AssistRange = self.ControlRange + 10
        self.AirMonitorRange = self:GetBlueprint().AI.AirMonitorRange or (self.AssistRange / 2)
        self.HeartBeatInterval = self:GetBlueprint().AI.AssistHeartbeatInterval or 1

        -- Load DroneData table from Goliath BP (name, attachpoint, unitid)
        -- Only drones with entries in this table (including unique key names and the other two required values) will be spawned!
        self.DroneData = table.deepcopy(self:GetBlueprint().DroneData)
        
        -- Load other data from drone BP and spawn drones
        for droneName, droneData in self.DroneData do
            -- Set drone name variable
            if not droneData.Name then
                droneData.Name = droneName
            end
            droneData.Blueprint = table.deepcopy(GetUnitBlueprintByName(droneData.UnitID))
            droneData.Economy = droneData.Blueprint.Economy
            droneData.BuildProgress = 1

            -- Create this drone
            self:ForkThread(self.CreateDrone, droneName)
        end
            
        -- Assist/monitor heartbeat thread
        self.HeartBeatThread = self:ForkThread(self.AssistHeartBeat)
        
        -- Begin drone maintenance monitoring
        ChangeState(self, self.DroneMaintenanceState)
    end,
    
    -- Creates specified drone from its entry in DroneData and creates handles
    CreateDrone = function(self, droneName)
        if not self:IsDead() and not self.DroneTable[droneName] and not self.DroneData[droneName].Active then
            if not self:IsValidBone(self.DroneData[droneName].Attachpoint) then
                error("*ERROR: Attachpoint '" .. self.DroneData[droneName].Attachpoint .. "' not a valid bone!", 2)
                return
            end
            local location = self:GetPosition(self.DroneData[droneName].Attachpoint)
            local newdrone = CreateUnitHPR(self.DroneData[droneName].UnitID, self:GetArmy(), location[1], location[2], location[3], 0, 0, 0)
            newdrone:SetParent(self, self.DroneData[droneName].Name)
            newdrone:SetCreator(self)
            self.DroneTable[droneName] = newdrone
            self.DroneData[droneName].Active = newdrone
            self.DroneData[droneName].Docked = false
            self.DroneData[droneName].Damaged = false
            self.DroneData[droneName].BuildProgress = 1
            self.Trash:Add(newdrone)
            self:RequestRefreshUI()
        end
    end,
    
    -- Clears all handles and active DroneData variables for the calling drone.
    NotifyOfDroneDeath = function(self,droneName)
        self.DroneTable[droneName] = nil
        self.DroneData[droneName].Active = false
        self.DroneData[droneName].Docked = false
        self.DroneData[droneName].Damaged = false
        self.DroneData[droneName].BuildProgress = 0
    end,

    DroneMaintenanceState = State {
        Main = function(self)
            self.DroneMaintenance = true            
            -- Resume any interrupted drone rebuilds
            if self.BuildingDrone then
                ChangeState(self, self.DroneRebuildingState)
            end            
            -- Check for dead or damaged drones
            while self and not self:IsDead() and not self.BuildingDrone do
                for droneName, droneData in self.DroneData do
                    if not droneData.Active or (droneData.Active and droneData.Damaged and droneData.Docked) then
                        self.BuildingDrone = droneName
                        ChangeState(self, self.DroneRebuildingState)
                    end
                end
                WaitTicks(2)
            end
        end,

        OnPaused = function(self)
            ChangeState(self, self.PausedState)
        end,
    },
    
    -- Active construction/repair state - consumes resources and advances progress
    DroneRebuildingState = State {
        Main = function(self)
            -- Flag as repair if drone is alive and damaged
            local isRepair = self.DroneData[self.BuildingDrone].Active and self.DroneData[self.BuildingDrone].Damaged
            -- Calculate build time from buildrate
            local buildTimeSeconds = self.DroneData[self.BuildingDrone].Economy.BuildTime / self.BuildRate
            -- Enable econ consumption
            self:EnableResourceConsumption(self.DroneData[self.BuildingDrone].Economy)
            
            -- Begin or resume construction if not repair
            if not isRepair then
                -- Set progress bar/variable to 0 for fresh drone construction
                if not self.DroneData[self.BuildingDrone].BuildProgress then
                    self:SetWorkProgress(0.01)
                end
                -- Construction runs until buildprogress >= 1
                while self and not self:IsDead()
                and self.DroneData[self.BuildingDrone].BuildProgress < 1 do
                    WaitTicks(1)
                    local tickprogress = (self:GetResourceConsumed() * 0.1) / buildTimeSeconds
                    self.DroneData[self.BuildingDrone].BuildProgress = self.DroneData[self.BuildingDrone].BuildProgress + tickprogress
                    self:SetWorkProgress(self.DroneData[self.BuildingDrone].BuildProgress)
                end
                self:CreateDrone(self.BuildingDrone)
            -- Otherwise begin repair
            elseif isRepair then
                local repairingDrone = self.DroneData[self.BuildingDrone].Active
                local maxhealth = repairingDrone:GetMaxHealth()
                -- Repair runs while drone is alive, damaged, and docked
                while self and not self:IsDead()
                and self.DroneData[self.BuildingDrone].Damaged
                and self.DroneData[self.BuildingDrone].Docked
                and repairingDrone and not repairingDrone:IsDead() do
                    WaitTicks(1)
                    local restorehealth = ((self:GetResourceConsumed() * 0.1) / buildTimeSeconds) * maxhealth
                    repairingDrone:AdjustHealth(self, restorehealth)
                    -- Repair progress = drone health percent, and the progressbar reflects this
                    local totalprogress = repairingDrone:GetHealth() / maxhealth
                    self:SetWorkProgress(totalprogress)
                    if self.DroneData[self.BuildingDrone] and totalprogress >= 1 then
                        self.DroneData[self.BuildingDrone].Damaged = false
                    end
                end
            end
            -- Return to Maintenance State to check/wait for other jobs
            self:CleanupDroneMaintenance(self.BuildingDrone)
            ChangeState(self, self.DroneMaintenanceState)
        end,
        
        OnPaused = function(self)
            ChangeState(self, self.PausedState)
        end,
    },
    
    -- Paused state, econ and construction progress halted
    PausedState = State {
        Main = function(self)
            self:DisableResourceConsumption()
            self.DroneMaintenance = false
        end,

        OnUnpaused = function(self)
            ChangeState(self, self.DroneMaintenanceState)
        end,        
    },
    
    -- Set on unit death, ends production and consumption immediately
    DeadState = State {
        Main = function(self)
            self:CleanupDroneMaintenance(nil, true)
        end,        
    },
    
    
    -- Enables economy drain
    EnableResourceConsumption = function(self, econdata)
        local energy_rate = econdata.BuildCostEnergy / (econdata.BuildTime / self.BuildRate)
        local mass_rate = econdata.BuildCostMass / (econdata.BuildTime / self.BuildRate)
        self:SetConsumptionPerSecondEnergy(energy_rate)
        self:SetConsumptionPerSecondMass(mass_rate)
        self:SetConsumptionActive(true)
    end,

    -- Disables economy drain
    DisableResourceConsumption = function(self)
        self:SetConsumptionPerSecondEnergy(0)
        self:SetConsumptionPerSecondMass(0)
        self:SetConsumptionActive(false)
    end,
    
    -- Resets resume/progress data, clears effects
    -- Used to clean up finished construction and repair, and to interrupt repairs when undocking
    CleanupDroneMaintenance = function(self, droneName, deadState)
        if deadState or (droneName and droneName == self.BuildingDrone) then
            self:SetWorkProgress(0)
            self.BuildingDrone = false
            self:DisableResourceConsumption()
        end
    end,
    
    -- Manages drone assistance and firestate propagation
    AssistHeartBeat = function(self)
        local SuspendAssist = 0
        local LastFireState
        local LastDroneTarget
        -- The Goliath's current weapon target is now used for better, earlier drone deployment
        -- Best results achieved so far have been with the missile launcher, due to range
        local TargetWeapon = self:GetWeaponByLabel('EyeWeapon01')
        
        while not self:IsDead() do
            -- Refresh current firestate and check for holdfire
            local MyFireState = self:GetFireState()
            local HoldFire = MyFireState == 1
            -- De-blip our weapon target, nil MyTarget if none
            local TargetBlip = TargetWeapon:GetCurrentTarget()
            if TargetBlip ~= nil then
                self.MyTarget = self:GetRealTarget(TargetBlip)
            else
                self.MyTarget = nil
            end
            
            -- Propagate the Goliath's fire state to the drones, to keep them from retaliating when the Goliath is on hold-fire
            -- This also allows you to set both drones to target-ground, although I'm not sure how that'd be useful
            if LastFireState ~= MyFireState then
                LastFireState = MyFireState
                self:SetDroneFirestate(MyFireState)
            end
            
            -- Drone Assist management
            -- New target priority:
            -- 1. Nearby gunships - these can attack both drones and Goliath, otherwise often killing drones while they're elsewise occupied
            -- 2. Goliath's current target - whatever the missile launcher is shooting at; this also responds to force-attack calls
            -- 3. Goliath's last drone-targetable attacker - this is only used when something is hitting the Goliath out of launcher range
            --
            -- Drones are not re-assigned to a new target unless their old target is dead, or a higher-priority class of target is found.
            -- The exception is newly-constructed drones, which are dispatched to the current drone target on the next heartbeat.
            -- Acquisition of a gunship target suspends further assist management for 7 heartbeats - with the new logic this is somewhat
            -- vestigial, but it does insure that the drones aren't jerked around between gunship targets if one of them strays slightly
            -- outside the air monitor range.
            --
            -- Existing target validity and distance is checked every heartbeat, so we don't get stuck trying to send drones after a
            -- submerged, recently taken-off highaltair, or out-of-range target.  Likewise, when the Goliath submerges, the drones will
            -- continue engaging only until the last assigned target is destroyed, at which point they will dock with the underwater Goliath.
            if self.DroneAssist and not HoldFire and SuspendAssist <= 0 then
                local NewDroneTarget
                
                local GunshipTarget = self:SearchForGunshipTarget(self.AirMonitorRange)
                if GunshipTarget and not GunshipTarget:IsDead() then
                    if GunshipTarget ~= LastDroneTarget then
                        NewDroneTarget = GunshipTarget
                    end
                elseif self.MyTarget ~= nil and not self.MyTarget:IsDead() then
                    if self.MyTarget ~= LastDroneTarget then
                        NewDroneTarget = self.MyTarget
                    end
                elseif self.MyAttacker ~= nil and not self.MyAttacker:IsDead() and self:IsTargetInRange(self.MyAttacker) then
                    if self.MyAttacker ~= LastDroneTarget then
                        NewDroneTarget = self.MyAttacker
                    end
                -- If our previous attacker is no longer valid, clear MyAttacker to re-enable the OnDamage check
                elseif self.MyAttacker ~= nil then
                    self.MyAttacker = nil
                end
                
                -- Assign chosen target, if valid
                if NewDroneTarget and self:IsValidDroneTarget(NewDroneTarget) then
                    if NewDroneTarget == GunshipTarget then
                        -- Suspend the assist targeting for 7 heartbeats if we have a gunship target, to keep them at top priority
                        SuspendAssist = 7
                    end
                    LastDroneTarget = NewDroneTarget
                    self:AssignDroneTarget(NewDroneTarget)
                -- Otherwise re-check our existing target:
                else
                    if LastDroneTarget and self:IsValidDroneTarget(LastDroneTarget)
                    and self:IsTargetInRange(LastDroneTarget) then
                        -- Dispatch any docked (usually newly-built) drones, if it's still valid
                        if self:GetDronesDocked() then
                            self:AssignDroneTarget(LastDroneTarget)
                        end
                    else
                        -- Clear last target if no longer valid, forcing re-acquisition on the next beat
                        LastDroneTarget = nil
                    end
                end
                
            -- Otherwise, tick down the assistance suspension timer (if set)
            elseif SuspendAssist > 0 then
                SuspendAssist = SuspendAssist - 1
            end
            
            WaitSeconds(self.HeartBeatInterval)
        end
    end,
            
    -- Recalls all drones to the carrier at 2x speed under temp command lockdown
    RecallDrones = function(self)
        if next(self.DroneTable) then
            for id, drone in self.DroneTable do
                drone:DroneRecall()
            end
        end        
    end,
    
    -- Issues an attack order for all drones
    AssignDroneTarget = function(self, dronetarget)
        if next(self.DroneTable) then
            for id, drone in self.DroneTable do
                if drone.AwayFromCarrier == false then
                    local targetblip = dronetarget:GetBlip(self:GetArmy())
                    if targetblip ~= nil then
                        IssueClearCommands({drone})
                        IssueAttack({drone}, targetblip)
                    end
                end
            end
        end
    end,
    
    -- Sets a firestate for all drones
    SetDroneFirestate = function(self, firestate)
        if next(self.DroneTable) then
            for id, drone in self.DroneTable do
                if drone and not drone:IsDead() then
                    drone:SetFireState(firestate)
                end
            end
        end
    end,
    
    -- Checks whether any drones are docked.  Used by AssistHeartBeat.
    -- Returns a table of dronenames that are currently docked, or false if none
    GetDronesDocked = function(self)
        local docked = {}
        if next(self.DroneTable) then
            for id, drone in self.DroneTable do
                if drone and not drone:IsDead() and self.DroneData[id].Docked then
                    table.insert(docked, id)
                end
            end
        end
        if next(docked) then
            return docked
        else
            return false
        end
    end,

    -- Returns a hostile gunship/transport in range for drone targeting, or nil if none
    SearchForGunshipTarget = function(self, radius)
        local targetindex, target
        local units = self:GetAIBrain():GetUnitsAroundPoint(categories.AIR - (categories.HIGHALTAIR + categories.UNTARGETABLE), self:GetPosition(), radius, 'Enemy')
        if next(units) then
            targetindex, target = next(units)
        end
        return target
    end,
    
    -- De-blip a weapon target - stolen from the GC tractorclaw script
    GetRealTarget = function(self, target)
        if target and not IsUnit(target) then
            local unitTarget = target:GetSource()
            local unitPos = unitTarget:GetPosition()
            local reconPos = target:GetPosition()
            local dist = VDist2(unitPos[1], unitPos[3], reconPos[1], reconPos[3])
            if dist < 5 then
                return unitTarget
            end
        end
        return target      
    end,
    
    -- Runs a potential target through filters to insure that drones can attack it; checks are as simple and efficient as possible
    IsValidDroneTarget = function(self, target)
        local ivdt
        if target ~= nil
        and target.Dead ~= nil
        and not target:IsDead()
        and IsEnemy(self:GetArmy(), target:GetArmy())
        and not EntityCategoryContains(categories.HIGHALTAIR + categories.UNTARGETABLE, target)
        and target:GetCurrentLayer() ~= 'Sub'
        and target:GetBlip(self:GetArmy()) ~= nil then
            ivdt = true
        end
        return ivdt
    end,
    
    -- Insures that potential retaliation targets are within drone control range
    IsTargetInRange = function(self, target)
        local tpos = target:GetPosition()
        local mpos = self:GetPosition()
        local dist = VDist2(mpos[1], mpos[3], tpos[1], tpos[3])
        local itir
        if dist <= self.AssistRange then
            itir = true
        end
        return itir
    end,
    
    DeathThread = function(self, overkillRatio , instigator)
        local bigExplosionBones = {'BSL0401', 'Beam_Muzzle01'}
        local explosionBones = {'Focus_Beam02_Emitter03', 'Left_AA_Barrel',
                                'Focus_Beam01_Emitter01', 'Right_AA_Turret', 'Beam_Point_Focus03'}
                                        
        explosion.CreateDefaultHitExplosionAtBone(self, bigExplosionBones[Random(1,3)], 4.0)
        explosion.CreateDebrisProjectiles(self, explosion.GetAverageBoundingXYZRadius(self), {self:GetUnitSizes()})           
        WaitSeconds(0.2)
        
        local RandBoneIter = RandomIter(explosionBones)
        for i=1,Random(4,6) do
            local bone = RandBoneIter()
            explosion.CreateDefaultHitExplosionAtBone(self, bone, 1.0)
            WaitTicks(Random(0.1,1))
        end
        
        local bp = self:GetBlueprint()
        for i, numWeapons in bp.Weapon do
            if(bp.Weapon[i].Label == 'CollossusDeath') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        WaitSeconds(0.5)
        explosion.CreateDefaultHitExplosionAtBone(self, 'BSL0401', 5.0)        

        if self.DeathAnimManip then
            WaitFor(self.DeathAnimManip)
        end

    
        self:DestroyAllDamageEffects()
        self:CreateWreckage(overkillRatio)

        -- CURRENTLY DISABLED UNTIL DESTRUCTION
        -- Create destruction debris out of the mesh, currently these projectiles look like crap,
        -- since projectile rotation and terrain collision doesn't work that great. These are left in
        -- hopes that this will look better in the future.. =)
        if(self.ShowUnitDestructionDebris and overkillRatio) then
            if overkillRatio <= 1 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 2 then
                self.CreateUnitDestructionDebris(self, true, true, false)
            elseif overkillRatio <= 3 then
                self.CreateUnitDestructionDebris(self, true, true, true)
            else
                self.CreateUnitDestructionDebris(self, true, true, true)
            end
        end
        
        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,
    
    OnDestroy = function(self)
        SHoverLandUnit.OnDestroy(self)

        -- Don't make the energy being if not built
        if self:GetFractionComplete() ~= 1 then return end
        
        -- Spawn the Energy Being
        local position = self:GetPosition()
        local spiritUnit = CreateUnitHPR('XSL0402', self:GetArmy(), position[1], position[2], position[3], 0, 0, 0)

        -- Create effects for spawning of energy being
        for k, v in self.SpawnEffects do
            CreateAttachedEmitter(spiritUnit, -1, self:GetArmy(), v)
        end
    end,
}

TypeClass = MCPS4LHT
