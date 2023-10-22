THIEFSouth_DELAY 		=       720
THIEFSouth_COUNTER 	        =	THIEFSouth_DELAY

---------------------------------------------------------------------------------------------------------------------------

createSpawnTHIEFSouth = function()


	StartJob("TimerTHIEFSouth")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerTHIEFSouth"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerTHIEFSouth = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if THIEFSouth_COUNTER > 0 and IsAlive("spawnBuild2") and variabila==0 then

                   THIEFSouth_COUNTER = THIEFSouth_COUNTER - 1

                   return false

                	elseif THIEFSouth_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerTHIEFSouth = function()
	-------------------------------------------------------------------------------------------------------------------

                        Thief2   = CreateEntity(3,Entities.PU_Thief,GetPosition("SpawnThief1South"),"ThiefSouth")
			ThiefBomb1()


                        local pos = GetPosition("SpawnThiefSouth")
                        SouthDef = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(SouthDef, "DefenseSouth")


                     	local pos = GetPosition("SpawnThiefSouth")
                        SouthDef1 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(SouthDef1, "DefenseSouth1")

			Attack("DefenseSouth","TargetBridge")
			Attack("DefenseSouth1","TargetBridge")


                             THIEFSouth_DELAY 			=       720
                             THIEFSouth_COUNTER 	        =	THIEFSouth_DELAY
	                     StartJob("TimerTHIEFSouth")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

ThiefBomb1 = function()

	if BridgeDestroyed == 0 then
	Move("ThiefSouth","TargetBridge",1990)
	
	end

end