local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CIFArtilleryWeapon = CybranWeaponsFile.CIFArtilleryWeapon
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon

MCPC1NXAS = Class(CSeaUnit) {
    DestructionTicks = 200,

	SwitchAnims = true,
    Walking = false,
    IsWaiting = false,
	
    Weapons = {
        MainGun = Class(CIFArtilleryWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/cybran_artillery_muzzle_flash_01_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_flash_02_emit.bp',
                '/effects/emitters/cybran_artillery_muzzle_smoke_01_emit.bp',
            },
		},	
		Upgrade01AAGun = Class(CAAAutocannon) {},
		Upgrade02AAGun = Class(CAAAutocannon) {},
		ProtonCannonUpgrade01 = Class(CDFProtonCannonWeapon) {},
		ProtonCannonUpgrade02 = Class(CDFProtonCannonWeapon) {},
		Upgrade03AAGun = Class(CAAAutocannon) {},
		Upgrade04AAGun = Class(CAAAutocannon) {},		
    },


    OnCreate = function(self)
        CSeaUnit.OnCreate(self)

    end,	
	
    OnStopBeingBuilt = function(self,builder,layer)
        CSeaUnit.OnStopBeingBuilt(self,builder,layer)
		if(self:GetCurrentLayer() == 'Land') then
            self.AT1 = self:ForkThread(self.TransformThread, true)
        end
        self.Trash:Add(CreateRotator(self, 'Cybran_Radar', 'y', nil, 90, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Back_Radar', 'y', nil, -360, 0, 0))
        self.Trash:Add(CreateRotator(self, 'Front_Radar', 'y', nil, -180, 0, 0))
    end,
	
	OnMotionHorzEventChange = function(self, new, old)
        CSeaUnit.OnMotionHorzEventChange(self, new, old)
        if self:IsDead() then return end
        if( not self.IsWaiting ) then
            if( self.Walking ) then
                if( old == 'Stopped' ) then
                    if( self.SwitchAnims ) then
                        self.SwitchAnims = false
                        self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationWalk, true):SetRate(self:GetBlueprint().Display.AnimationWalkRate or 1.3)
                    else
                        self.AnimManip:SetRate(1.3)
                    end
                elseif( new == 'Stopped' ) then
                    self.AnimManip:SetRate(0)
                end
            end
        end
    end,
	
	
    OnLayerChange = function(self, new, old)
        CSeaUnit.OnLayerChange(self, new, old)
        if( old != 'None' ) then
            if( self.AT1 ) then
                self.AT1:Destroy()
                self.AT1 = nil
            end
            local myBlueprint = self:GetBlueprint()
            if( new == 'Land' ) then
                self.AT1 = self:ForkThread(self.TransformThread, true)
            elseif( new == 'Water' ) then
                self.AT1 = self:ForkThread(self.TransformThread, false)
            end
        end
    end,

    TransformThread = function(self, land)
        if( not self.AnimManip ) then
            self.AnimManip = CreateAnimator(self)
        end
        local bp = self:GetBlueprint()
        local scale = bp.Display.UniformScale or 1

        if( land ) then
            # Change movement speed to the multiplier in blueprint
            self:SetSpeedMult(bp.Physics.LandSpeedMultiplier)
            self:SetImmobile(true)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetRate(2)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
            --self:SetCollisionShape( 'Box', bp.CollisionOffsetX or 0,(bp.CollisionOffsetY + (bp.SizeY*0.0)) or 0,bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale )
            self.IsWaiting = false
            self:SetImmobile(false)
            self.SwitchAnims = true
            self.Walking = true
            self.Trash:Add(self.AnimManip)
        else
            self:SetImmobile(true)
            # Revert speed to maximum speed
            self:SetSpeedMult(1)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetAnimationFraction(1)
            self.AnimManip:SetRate(-2)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
            --self:SetCollisionShape( 'Box', bp.CollisionOffsetX or 0,(bp.CollisionOffsetY + (bp.SizeY * 0.5)) or 0,bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale )
            self.IsWaiting = false
            self.AnimManip:Destroy()
            self.AnimManip = nil
            self:SetImmobile(false)
            self.Walking = false
        end
    end,	
	
		
	OnKilled = function(self, instigator, type, overkillRatio)
        self.Trash:Destroy()
        self.Trash = TrashBag()
        if(self:GetCurrentLayer() != 'Water') then
            self:GetBlueprint().Display.AnimationDeath = self:GetBlueprint().Display.LandAnimationDeath
        else
            self:GetBlueprint().Display.AnimationDeath = self:GetBlueprint().Display.WaterAnimationDeath
        end
        CSeaUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
    
     DeathThread = function(self, overkillRatio)
        if (self:GetCurrentLayer() != 'Water') then
            self:PlayUnitSound('Destroyed')
            local army = self:GetArmy()
            if self.PlayDestructionEffects then
                self:CreateDestructionEffects( self, overkillRatio )
            end

            # Create Initial explosion effects
            if( self.ShowUnitDestructionDebris and overkillRatio ) then
                if overkillRatio <= 1 then
                    self.CreateUnitDestructionDebris( self, true, true, false )
                elseif overkillRatio <= 2 then
                    self.CreateUnitDestructionDebris( self, true, true, false )
                elseif overkillRatio <= 3 then
                    self.CreateUnitDestructionDebris( self, true, true, true )
                else #VAPORIZED
                    self.CreateUnitDestructionDebris( self, true, true, true )
                end
            end

            WaitSeconds(2)
            if self.PlayDestructionEffects then
                self:CreateDestructionEffects( self, overkillRatio )
            end 
            WaitSeconds(1)
            if self.PlayDestructionEffects then
                self:CreateDestructionEffects( self, overkillRatio )
            end                                    
            self:CreateWreckage(0.1)
            self:Destroy()
        else
            CSeaUnit.DeathThread(self, overkillRatio)
        end
    end,

}

TypeClass = MCPC1NXAS
