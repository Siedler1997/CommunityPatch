THIEFEast_DELAY 		=       600
THIEFEast_COUNTER 	        =	THIEFEast_DELAY

---------------------------------------------------------------------------------------------------------------------------

createSpawnTHIEFEast = function()


	StartJob("TimerTHIEFEast")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerTHIEFEast"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerTHIEFEast = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if THIEFEast_COUNTER > 0 and IsAlive("spawnBuild1") and variabila==0 then

                   THIEFEast_COUNTER = THIEFEast_COUNTER - 1

                   return false

                	elseif THIEFEast_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerTHIEFEast = function()
	-------------------------------------------------------------------------------------------------------------------

                        Thief1   = CreateEntity(3,Entities.PU_Thief,GetPosition("SpawnThief1East"),"ThiefEast")
			ThiefBomb()


                        local pos = GetPosition("SpawnThiefEast")
                        EastDef = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(EastDef, "DefenseEast")


                     	local pos = GetPosition("SpawnThiefEast")
                        EastDef1 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm2, 4, pos.X, pos.Y, 180)
                        SetEntityName(EastDef1, "DefenseEast1")

			Attack("DefenseEast","TargetBridge")
			Attack("DefenseEast1","TargetBridge")


                             THIEFEast_DELAY 		=       600
                             THIEFEast_COUNTER 	        =	THIEFEast_DELAY
	                     StartJob("TimerTHIEFEast")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

ThiefBomb = function()

	if BridgeDestroyed == 0 then
	Move("ThiefEast","TargetBridgeSouth",1990)
	end

end

---------------------------------------------------------------------------------------------------------------------------