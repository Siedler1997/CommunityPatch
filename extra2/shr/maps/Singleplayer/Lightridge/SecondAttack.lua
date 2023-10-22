---------------------------------------------------------------------------------------------------------------------

CheckArchers2 = function()


	StartJob("AttackArchers2")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AttackArchers2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_AttackArchers2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsDead("AttackOnArchers1") and  IsDead("AttackOnArchers2") and IsDead("AttackOnArchers3")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_AttackArchers2 = function()
	-------------------------------------------------------------------------------------------------------------------

                        local pos 		= GetPosition("SpawnThiefWest")
                        Archers2Attack1 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(Archers2Attack1, "Attack2OnArchers1")


                     	local pos 		= GetPosition("SpawnThiefEast")
                        Archers2Attack2 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(Archers2Attack2, "Attack2OnArchers2")


                        local pos 		= GetPosition("SpawnThiefSouth")
                        Archers2Attack3 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(Archers2Attack3, "Attack2OnArchers3")


			Attack("Attack2OnArchers1","TargetBridge")
			Attack("Attack2OnArchers2","TargetBridge")
			Attack("Attack2OnArchers3","TargetBridge")

			Check3Archers()


                        return true


	end
