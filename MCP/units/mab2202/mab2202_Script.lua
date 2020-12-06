local AStructureUnit = import('/lua/aeonunits.lua').AStructureUnit
local ADFDisruptorWeapon = import('/lua/aeonweapons.lua').ADFDisruptorWeapon

MAB2202 = Class(AStructureUnit) {

    Weapons = {
        MainGun = Class(ADFDisruptorWeapon) {
            CreateProjectileAtMuzzle = function(self, muzzle)
                local proj = ADFDisruptorWeapon.CreateProjectileAtMuzzle(self, muzzle)
                local data = self:GetBlueprint().DamageToShields
                if proj and not proj:BeenDestroyed() then
                    proj:PassData(data)
                end
            end,
        },
    },

    OnStopBeingBuilt = function(self,builder,layer)
        AStructureUnit.OnStopBeingBuilt(self, builder, layer)
        ChangeState(self, self.HingeState)
    end,

    HingeState = State{ 
        Main = function(self)
            WaitSeconds(2) #unpacking of the unit, you can ignore this
            
            #Set up joints 1 and 2 
            self.J1 = CreateRotator(self, 'joint1', 'x') #the two bones ill be manipulating later
            self.J2 = CreateRotator(self, 'joint2', 'x')
            self.Trash:Add(self.J1) #these things that are just required for whatever reason? 
            self.Trash:Add(self.J2)

            local rotateold = {}

            while not self:IsDead() do

                WaitSeconds(0.1)

                local tune = {}
                tune.heading, tune.pitch = self:GetWeaponManipulatorByLabel('MainGun'):GetHeadingPitch()

                local rotate = {}
                rotate = MATH_IRound((180/3.14159)*tune.pitch)

                if rotateold ~= rotate then

                    #Translate differences in rotate 
                    
                    local R2 = {}
                    local R3 = {}

                    local R5 = {}
                    local R6 = {}

                    R2 = (-0.0165*(rotate*rotate))
                    R3 = (1.1357*(rotate))

                    R5 = (0.0295*(rotate*rotate))
                    R6 = (-1.9041*(rotate))

                    rotate1 = MATH_IRound(R2+R3)
                    rotate2 = MATH_IRound(R5+R6)

                    self.J1:SetGoal(-rotate1):SetSpeed(50)
                    self.J2:SetGoal(-rotate2):SetSpeed(50)
                end
                rotateold = rotate
            end
        end
    },
}
TypeClass = MAB2202