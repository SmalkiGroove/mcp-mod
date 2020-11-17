local SSubUnit = import('/lua/seraphimunits.lua').SSubUnit
local SWeapons = import('/lua/seraphimweapons.lua')
local SANUallCavitationTorpedo = SWeapons.SANUallCavitationTorpedo

MCPS2NSS = Class(SSubUnit) {
    DeathThreadDestructionWaitTime = 0,
    Weapons = {
        Torpedo01 = Class(SANUallCavitationTorpedo) {
          OnWeaponFired = function(self)
              if not self.unit.WaitingForCloak then
                  self.unit:RevealUnit()
                  self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
              end
          end,
        },
		    Torpedo02 = Class(SANUallCavitationTorpedo) {
          OnWeaponFired = function(self)
              if not self.unit.WaitingForCloak then
                  self.unit:RevealUnit()
                  self.unit.CloakThread = self.unit:ForkThread(self.unit.HideUnit)
              end
          end,
      },
    },

    -- Toggle disabled
    OnScriptBitSet = function(self, bit)
      if bit == 8 then
          self.Sync.LowPriority = false
          self:RevealUnit()
      else
          SSubUnit.OnScriptBitSet(self, bit)
      end
    end,

    -- Toggle enabled
    OnScriptBitClear = function(self, bit)
      if bit == 8 then
          self.Sync.LowPriority = true
          -- Only actually hides if stationary and doesn't have an attack order
          self.CloakThread = self:ForkThread(self.HideUnit)
      else
          SSubUnit.OnScriptBitClear(self, bit)
      end
    end,

    RevealUnit = function(self)
      if self.CloakThread then
          KillThread(self.CloakThread)
          self.CloakThread = nil
      end

      -- Ensure weapon state
      self:SetWeaponEnabledByLabel('Torpedo01', true)
      self:SetWeaponEnabledByLabel('Torpedo02', true)

      -- Toggle stealth off
      self:SetMaintenanceConsumptionInactive()
      self:DisableUnitIntel('ToggleBit5', 'RadarStealth')
      self:DisableUnitIntel('ToggleBit8', 'Cloak')
    end,

    HideUnit = function(self)
      if not self.Dead and self:GetFractionComplete() == 1 and self.Sync.LowPriority then
        self.WaitingForCloak = true
        WaitSeconds(self:GetBlueprint().Intel.StealthWaitTime)
        if self:IsUnitState("Attacking") then
            self.WaitingForCloak = false
            return
        end

        -- Ensure weapon state
        self:SetWeaponEnabledByLabel('Torpedo01', false)
        self:SetWeaponEnabledByLabel('Torpedo02', false)

        -- Toggle stealth on
        self:SetMaintenanceConsumptionActive()
        self:EnableUnitIntel('ToggleBit5', 'RadarStealth')
        self:EnableUnitIntel('ToggleBit8', 'Cloak')
        self.WaitingForCloak = false
      end
      self.CloakThread = nil
    end,

    -- Turn off the cloak to begin with
    OnStopBeingBuilt = function(self, builder, layer)
      SSubUnit.OnStopBeingBuilt(self, builder, layer)
      self:SetScriptBit('RULEUTC_CloakToggle', true)
      self.WaitingForCloak = false
      self:ForkThread(self.HideUnit)
    end,

    OnCreate = function(self)
		SSubUnit.OnCreate(self)

    end,
	
	
}

TypeClass = MCPS2NSS
