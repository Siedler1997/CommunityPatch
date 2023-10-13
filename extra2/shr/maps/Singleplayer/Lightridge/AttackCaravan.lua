---------------------------------------------------------------------------------------------------------------------

CheckCaravan = function()


	StartJob("AttackCaravan")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AttackCaravan"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AttackCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsNear("caravanGold","TrapForErec",1000)

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AttackCaravan = function()
	-------------------------------------------------------------------------------------------------------------------

                        local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack1 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack1, "AttackOnCaravan1")


                     	local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack2 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack2, "AttackOnCaravan2")


                        local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack3 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack3, "AttackOnCaravan3")


                        local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack4 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack4, "AttackOnCaravan4")


                        local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack5 	= Tools.CreateGroup(3, Entities.PU_LeaderSword2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack5, "AttackOnCaravan5")


                        local pos 	= GetPosition("AttackOnErec")
                        CaravanAttack6 	= Tools.CreateGroup(3, Entities.PU_LeaderBow2, 4, pos.X, pos.Y, 180)
                        SetEntityName(CaravanAttack6, "AttackOnCaravan6")


			Attack("AttackOnCaravan1","caravanGold")
			Attack("AttackOnCaravan2","caravanIron")
			Attack("AttackOnCaravan3","caravanStone")
			Attack("AttackOnCaravan4","caravanClay")
			Attack("AttackOnCaravan5","caravanSulfur")
			Attack("AttackOnCaravan6","caravanWood")

                        variabila=1

                        return true


	end
