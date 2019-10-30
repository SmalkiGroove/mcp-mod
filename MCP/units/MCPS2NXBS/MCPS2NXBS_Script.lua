local SSeaUnit = import('/lua/seraphimunits.lua').SSeaUnit
local SeraphimWeapons = import('/lua/seraphimweapons.lua')
local SAMElectrumMissileDefense = SeraphimWeapons.SAMElectrumMissileDefense
local SAAShleoCannonWeapon = SeraphimWeapons.SAAShleoCannonWeapon
local SDFHeavyQuarnonCannon = SeraphimWeapons.SDFHeavyQuarnonCannon
local SDFAjelluAntiTorpedoDefense = SeraphimWeapons.SDFAjelluAntiTorpedoDefense
local SANHeavyCavitationTorpedo = SeraphimWeapons.SANHeavyCavitationTorpedo


MCPS2NXBS = Class(SSeaUnit) {

	ShieldEffects = {
        '/effects/emitters/quark_bomb2_02_emit.bp',
    },	

    Weapons = {
		ChromBeamLeftFront = Class(SDFHeavyQuarnonCannon) {},
		ChromBeamRightFront = Class(SDFHeavyQuarnonCannon) {},
		ChromBeamLeftRear = Class(SDFHeavyQuarnonCannon) {},
		ChromBeamRightRear = Class(SDFHeavyQuarnonCannon) {},
        AntiMissileFront = Class(SAMElectrumMissileDefense) {},
        AntiMissileRear = Class(SAMElectrumMissileDefense) {},
        AntiAirLeft = Class(SAAShleoCannonWeapon) { FxMuzzleScale = 2.25, },
        AntiAirRight = Class(SAAShleoCannonWeapon) { FxMuzzleScale = 2.25, },
        Torpedo = Class(SANHeavyCavitationTorpedo) {},
        TorpedoDefense = Class(SDFAjelluAntiTorpedoDefense) {},
    },
	
	OnStopBeingBuilt = function(self, builder, layer)
        SSeaUnit.OnStopBeingBuilt(self, builder, layer)
		self.ShieldEffectsBag = {}
        self.Trash:Add(CreateAttachedEmitter(self, 'BeamSphere', self:GetArmy(), '/effects/emitters/quark_bomb2_02_emit.bp'))
		self.Trash:Add(CreateAttachedEmitter(self, 'BeamEmitter001', self:GetArmy(), '/effects/emitters/quark_bomb2_02_emit.bp'))
		self.Trash:Add(CreateAttachedEmitter(self, 'BeamEmitter002', self:GetArmy(), '/effects/emitters/quark_bomb2_02_emit.bp'))
		self.Trash:Add(CreateAttachedEmitter(self, 'BeamEmitter003', self:GetArmy(), '/effects/emitters/quark_bomb2_02_emit.bp'))
		self.Trash:Add(CreateAttachedEmitter(self, 'BeamEmitter004', self:GetArmy(), '/effects/emitters/quark_bomb2_02_emit.bp'))
		
		self.Trash:Add(AttachBeamEntityToEntity(self, 'BeamEmitter001', self, 'BeamEmitter002', self:GetArmy(), '/mods/MCP/effects/emitters/w_i_bem01_p_01_beam_emit.bp'))
		self.Trash:Add(AttachBeamEntityToEntity(self, 'BeamEmitter001', self, 'BeamSphere', self:GetArmy(), '/mods/MCP/effects/emitters/seratank_beam_emit.bp'))
		self.Trash:Add(AttachBeamEntityToEntity(self, 'BeamEmitter003', self, 'BeamEmitter004', self:GetArmy(), '/mods/MCP/effects/emitters/w_i_bem01_p_01_beam_emit.bp'))
		self.Trash:Add(AttachBeamEntityToEntity(self, 'BeamEmitter003', self, 'BeamSphere', self:GetArmy(), '/mods/MCP/effects/emitters/seratank_beam_emit.bp'))
		
	
    end,

    OnDestroy = function(self)
    	if self.Trash then
            self.Trash:Destroy()
        end
    end,
	
	OnShieldEnabled = function(self)
        SSeaUnit.OnShieldEnabled(self)
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
        for k, v in self.ShieldEffects do
            table.insert( self.ShieldEffectsBag, CreateAttachedEmitter( self, 'Shield_Effect', self:GetArmy(), v ):ScaleEmitter(1) )
        end
    end,

    OnShieldDisabled = function(self)
        SSeaUnit.OnShieldDisabled(self)
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
    end,
    
    OnKilled = function(self, instigator, type, overkillRatio)
        SSeaUnit.OnKilled(self, instigator, type, overkillRatio)
        if self.ShieldEffctsBag then
            for k,v in self.ShieldEffectsBag do
                v:Destroy()
            end
        end
    end,  
}

TypeClass = MCPS2NXBS