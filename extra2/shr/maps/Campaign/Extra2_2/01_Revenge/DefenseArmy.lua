DefenseArmy1_DELAY 		=       600
DefenseArmy1_COUNTER 	        =	DefenseArmy1_DELAY
DefenseArmy2_DELAY 		=       600
DefenseArmy2_COUNTER 	        =	DefenseArmy2_DELAY
DefenseArmy3_DELAY 		=       600
DefenseArmy3_COUNTER 	        =	DefenseArmy3_DELAY
DefenseArmy4_DELAY 		=       600
DefenseArmy4_COUNTER 	        =	DefenseArmy4_DELAY
DefenseArmy5_DELAY 		=       600
DefenseArmy5_COUNTER 	        =	DefenseArmy5_DELAY
DefenseArmy6_DELAY 		=       600
DefenseArmy6_COUNTER 	        =	DefenseArmy6_DELAY

---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy1 = function()


	StartJob("TimerDefenseArmy1")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy1"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy1_COUNTER > 0 and IsAlive("CapTent7") and IsDead("BaseDefense1") then

                   DefenseArmy1_COUNTER = DefenseArmy1_COUNTER - 1

                   return false

                	elseif DefenseArmy1_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy1 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase1()

                             DefenseArmy1_DELAY 		=       600
                             DefenseArmy1_COUNTER 	        =	DefenseArmy1_DELAY
	                     StartJob("TimerDefenseArmy1")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase1 = function()
	local experience = MEDIUM_EXPERIENCE	
	DefenseArmy		= {	Entities.PU_LeaderBow3,
					Entities.PU_LeaderPoleArm3,
					Entities.PU_LeaderSword3
					}

	if CP_Difficulty == 1 then
		experience = experience + 2
	end


	PickAUnit1 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn1")
		Defense1 = AI.Entity_CreateFormation(2, PickAUnit1, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense1, "BaseDefense1")
		LookAt(Defense1, "lookpos")


end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy2 = function()


	StartJob("TimerDefenseArmy2")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy2"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy2 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy2_COUNTER > 0 and IsAlive("CapTent2") and IsDead("BaseDefense2") then

                   DefenseArmy2_COUNTER = DefenseArmy2_COUNTER - 1

                   return false

                	elseif DefenseArmy2_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy2 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase2()

                             DefenseArmy2_DELAY 		=       600
                             DefenseArmy2_COUNTER 	        =	DefenseArmy2_DELAY
	                     StartJob("TimerDefenseArmy2")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase2 = function()
	local experience = MEDIUM_EXPERIENCE	
	DefenseArmy		= {	Entities.PU_LeaderBow3,
					Entities.PU_LeaderPoleArm3,
					Entities.PU_LeaderSword3
					}

	if CP_Difficulty == 1 then
		experience = experience + 2
	end


	PickAUnit2 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn2")
		Defense2 = AI.Entity_CreateFormation(2, PickAUnit2, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense2, "BaseDefense2")
		LookAt(Defense2, "lookpos")


end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy3 = function()


	StartJob("TimerDefenseArmy3")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy3"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy3 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy3_COUNTER > 0 and IsAlive("CapTent4") and IsDead("BaseDefense3") then

                   DefenseArmy3_COUNTER = DefenseArmy3_COUNTER - 1

                   return false

                	elseif DefenseArmy3_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy3 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase3()

                             DefenseArmy3_DELAY 		=       600
                             DefenseArmy3_COUNTER 	        =	DefenseArmy3_DELAY
	                     StartJob("TimerDefenseArmy3")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase3 = function()
	local experience = MEDIUM_EXPERIENCE	
	DefenseArmy		= {	Entities.PU_LeaderBow3,
					Entities.PU_LeaderPoleArm3,
					Entities.PU_LeaderSword3
					}

	if CP_Difficulty == 1 then
		experience = experience + 2
	end


	PickAUnit3 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn3")
		Defense3 = AI.Entity_CreateFormation(2, PickAUnit3, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense3, "BaseDefense3")
		LookAt(Defense3, "lookpos")


end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy4 = function()


	StartJob("TimerDefenseArmy4")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy4"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy4 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy4_COUNTER > 0 and IsAlive("CapTent9") and IsDead("BaseDefense4") then

                   DefenseArmy4_COUNTER = DefenseArmy4_COUNTER - 1

                   return false

                	elseif DefenseArmy4_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy4 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase4()

                             DefenseArmy4_DELAY 		=       600
                             DefenseArmy4_COUNTER 	        =	DefenseArmy4_DELAY
	                     StartJob("TimerDefenseArmy4")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase4 = function()
	local experience = MEDIUM_EXPERIENCE	
	DefenseArmy		= {	Entities.PU_LeaderBow3,
					Entities.PU_LeaderPoleArm3,
					Entities.PU_LeaderSword3
					}

	if CP_Difficulty == 1 then
		experience = experience + 2
	end


	PickAUnit4 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn4")
		Defense4 = AI.Entity_CreateFormation(2, PickAUnit4, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense4, "BaseDefense4")
		LookAt(Defense4, "lookpos")


end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy5 = function()


	StartJob("TimerDefenseArmy5")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy5"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy5 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy5_COUNTER > 0 and IsAlive("Tent8") and IsDead("BaseDefense5") then

                   DefenseArmy5_COUNTER = DefenseArmy5_COUNTER - 1

                   return false

                	elseif DefenseArmy5_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy5 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase5()

                             DefenseArmy5_DELAY 		=       600
                             DefenseArmy5_COUNTER 	        =	DefenseArmy5_DELAY
	                     StartJob("TimerDefenseArmy5")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase5 = function()
	local experience = MEDIUM_EXPERIENCE	
	local DefenseArmy	= 	{	
				Entities.CU_BanditLeaderBow1
				}

	if CP_Difficulty == 0 then
		table.insert(DefenseArmy, Entities.CU_BanditLeaderSword1)
		table.insert(DefenseArmy, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(DefenseArmy, Entities.CU_BanditLeaderSword2)
		table.insert(DefenseArmy, Entities.CU_Barbarian_LeaderClub2)
	end


	PickAUnit5 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn5")
		Defense5 = AI.Entity_CreateFormation(2, PickAUnit5, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense5, "BaseDefense5")


end

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

createDefenseArmy6 = function()


	StartJob("TimerDefenseArmy6")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerDefenseArmy6"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerDefenseArmy6 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if DefenseArmy6_COUNTER > 0 and IsAlive("Tent3") and IsDead("BaseDefense6") then

                   DefenseArmy6_COUNTER = DefenseArmy6_COUNTER - 1

                   return false

                	elseif DefenseArmy6_COUNTER==0 then 

			return true
                      
                                 
			end

		end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerDefenseArmy6 = function()
	-------------------------------------------------------------------------------------------------------------------


			DefenseBase6()

                             DefenseArmy6_DELAY 		=       600
                             DefenseArmy6_COUNTER 	        =	DefenseArmy6_DELAY
	                     StartJob("TimerDefenseArmy6")

                        return true


	end

---------------------------------------------------------------------------------------------------------------------------

DefenseBase6 = function()
	local experience = MEDIUM_EXPERIENCE	
	local DefenseArmy	= 	{	
				Entities.CU_BanditLeaderBow1
				}

	if CP_Difficulty == 0 then
		table.insert(DefenseArmy, Entities.CU_BanditLeaderSword1)
		table.insert(DefenseArmy, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(DefenseArmy, Entities.CU_BanditLeaderSword2)
		table.insert(DefenseArmy, Entities.CU_Barbarian_LeaderClub2)
	end


	PickAUnit6 		= 	DefenseArmy[Logic.GetRandom(table.getn(DefenseArmy))+1]


		local pos = GetPosition("DefSpawn6")
		Defense6 = AI.Entity_CreateFormation(2, PickAUnit6, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(Defense6, "BaseDefense6")


end

