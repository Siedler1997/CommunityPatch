THIEFWest_DELAY 		=       840
THIEFWest_COUNTER 	        =	THIEFWest_DELAY

---------------------------------------------------------------------------------------------------------------------------

createSpawnTHIEFWest = function()


	StartJob("TimerTHIEFWest")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerTHIEFWest"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerTHIEFWest = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if THIEFWest_COUNTER > 0 and IsAlive("spawnBuild3") and variabila==0 then

                   THIEFWest_COUNTER = THIEFWest_COUNTER - 1

                   return false

                	elseif THIEFWest_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerTHIEFWest = function()
	-------------------------------------------------------------------------------------------------------------------

                        Thief3   = CreateEntity(3,Entities.PU_Thief,GetPosition("SpawnThief1West"),"ThiefWest")
			ThiefBomb3()


                        local pos = GetPosition("SpawnThiefWest")
                        WestDef = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(WestDef, "DefenseWest")


                     	local pos = GetPosition("SpawnThiefWest")
                        WestDef1 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(WestDef1, "DefenseWest1")

			Attack("DefenseWest","TargetBridge")
			Attack("DefenseWest1","TargetBridge")


                             THIEFWest_DELAY 		=       840
                             THIEFWest_COUNTER 	        =	THIEFWest_DELAY
	                     StartJob("TimerTHIEFWest")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

ThiefBomb3 = function()

	if BridgeDestroyed == 0 then
	Move("ThiefWest","TargetBridgeSouth",1990)
	end

end

---------------------------------------------------------------------------------------------------------------------------