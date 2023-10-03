---------------------------------------------------------------------------------------------------------------------

Check3Archers = function()


	StartJob("Attack3Archers")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "Attack3Archers"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_Attack3Archers = function()
	-------------------------------------------------------------------------------------------------------------------

                
                return IsDead("Attack2OnArchers1") and  IsDead("Attack2OnArchers2") and IsDead("Attack2OnArchers3")

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_Attack3Archers = function()
	-------------------------------------------------------------------------------------------------------------------

			createSpawnTHIEFWest()
                	createSpawnTHIEFEast()
                	createSpawnTHIEFSouth()


                        local pos 		= GetPosition("SpawnThiefSouth")
                        Archers3Attack	 	= Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(Archers3Attack, "Attack3OnArchers")

			Attack("Attack3OnArchers","TargetBridge")

                        return true


	end
