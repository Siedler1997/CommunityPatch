
setupArmyCorps11 = function()

	armyCorps11							= {}

	armyCorps11.player 					= 2
	armyCorps11.id						= 1
	armyCorps11.strength				= 8
	armyCorps11.position				= GetPosition("player2")
	armyCorps11.rodeLength				= 4500
	armyCorps11.control					= {}
	armyCorps11.control.activation		= 60 * 5
	armyCorps11.control.timer			= 0
	
	SetupArmy(armyCorps11)

	---------------------------------------------------------------------
	
	armyCorps11a						= {}

	armyCorps11a.player 				= 2
	armyCorps11a.id						= 2
	armyCorps11a.strength				= 8
	armyCorps11a.position				= GetPosition("player2")
	armyCorps11a.rodeLength				= 4500
	armyCorps11a.control				= {}
	armyCorps11a.control.activation		= 60 * 10
	armyCorps11a.control.timer			= 0
	
	SetupArmy(armyCorps11a)

	
	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetUpArmyCorps11"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetUpArmyCorps11 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyCorps11.control.timer = armyCorps11.control.timer +1
		
		return 		Counter.Tick2("SetupArmyCorps11",20) 
				and	IsWeak(armyCorps11)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetUpArmyCorps11 = function()
	-------------------------------------------------------------------------------------------------------------------
		local distribution = Logic.GetRandom(100)
		
		local leaderType 		= Entities.PU_LeaderBow3
		local experience 		= HIGH_EXPERIENCE
		local numberOfSoldiers 	= 9
		
		if 		armyCorps11.control.timer > ONEMINUTE * 60 then
		
					Report("create troops level 3")
		
					experience = HIGH_EXPERIENCE				
		
					armyCorps11.strength = 8
					
					numberOfSoldiers = 9
		
					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow4
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword4
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm4
					else		
						leaderType = Entities.PV_Cannon4
					end
		
		elseif	armyCorps11.control.timer > ONEMINUTE * 40 then

					Report("create troops level 2")

					experience = HIGH_EXPERIENCE

					armyCorps11.strength = 8
					
					numberOfSoldiers = 9

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow3
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword3
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm3
					else		
						leaderType = Entities.PV_Cannon3
					end
		
		elseif	armyCorps11.control.timer > ONEMINUTE * 15 then

					Report("create troops level 1")

					experience = HIGH_EXPERIENCE					
					
					armyCorps11.strength = 8
	
					numberOfSoldiers = 6

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow2
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword2
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm2
					else		
						leaderType = Entities.PV_Cannon2
					end
		
		else

					Report("create troops level 0")
					
					armyCorps11.strength = 8

					numberOfSoldiers = 5

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow1
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword1
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm2
					else		
						leaderType = Entities.PV_Cannon1
					end

				end
			
		local troopDescription = {
		
			leaderType 			= leaderType,
			maxNumberOfSoldiers	= numberOfSoldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			
	
		EnlargeArmy(armyCorps11,troopDescription)
		
		if HasFullStrength(armyCorps11) then
			
			StartJob("ControlArmyCorps11")
			
			return true;
			
			end
						
		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCorps11"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCorps11 = function()
	-------------------------------------------------------------------------------------------------------------------
		armyCorps11.control.activation = armyCorps11.control.activation -1
		
		return 		armyCorps11.control.activation < 0
				and	Counter.Tick2("ControlArmyCorps11",30) 
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCorps11 = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if IsDead(armyCorps11) then
		
			Retreat(armyCorps11)
			
			StartJob("SetUpArmyCorps11")
			
			return true
			
			end

		Advance(armyCorps11)	

		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	












-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetUpArmyCorps11a"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetUpArmyCorps11a = function()
	-------------------------------------------------------------------------------------------------------------------
		
		armyCorps11a.control.timer = armyCorps11a.control.timer +1
		
		return 		Counter.Tick2("SetupArmyCorps11a",40) 
				and	IsWeak(armyCorps11a)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetUpArmyCorps11a = function()
	-------------------------------------------------------------------------------------------------------------------
		local distribution = Logic.GetRandom(100)
		
		local leaderType 		= Entities.PU_LeaderBow3
		local experience 		= HIGH_EXPERIENCE
		local numberOfSoldiers 	= 9
		
		if 		armyCorps11a.control.timer > ONEMINUTE * 60 then
		
					Report("create troops level 3")
		
					experience = HIGH_EXPERIENCE				
		
					armyCorps11a.strength = 8
					
					numberOfSoldiers = 9
		
					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow4
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword4
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm4
					else		
						leaderType = Entities.PV_Cannon4
					end
		
		elseif	armyCorps11a.control.timer > ONEMINUTE * 30 then

					Report("create troops level 2")

					experience = HIGH_EXPERIENCE

					armyCorps11a.strength = 8
					
					numberOfSoldiers = 9

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow3
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword3
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm3
					else		
						leaderType = Entities.PV_Cannon3
					end
		
		elseif	armyCorps11a.control.timer > ONEMINUTE * 15 then

					Report("create troops level 1")

					experience = HIGH_EXPERIENCE					
					
					armyCorps11a.strength = 8
	
					numberOfSoldiers = 7

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow2
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword2
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm2
					else		
						leaderType = Entities.PV_Cannon2
					end
		
		else

					Report("create troops level 0")
					
					armyCorps11a.strength = 8

					numberOfSoldiers = 5

					if distribution > 70 then			
						leaderType = Entities.PU_LeaderBow1
					elseif distribution > 50 then			
						leaderType = Entities.PU_LeaderSword1
					elseif distribution > 20 then	
						leaderType = Entities.PU_LeaderPoleArm2
					else		
						leaderType = Entities.PV_Cannon1
					end

				end
			
		local troopDescription = {
		
			leaderType 			= leaderType,
			maxNumberOfSoldiers	= numberOfSoldiers,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= experience,
		}			
	
		EnlargeArmy(armyCorps11a,troopDescription)
		
		if HasFullStrength(armyCorps11a) then

			Redeploy(armyCorps11a,GetPosition("rally1"),0)
			
			StartJob("ControlArmyCorps11a")
			
			return true;
			
			end
						
		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCorps11a"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCorps11a = function()
	-------------------------------------------------------------------------------------------------------------------
		armyCorps11a.control.activation = armyCorps11a.control.activation -1
		
		return 		armyCorps11a.control.activation < 0
				and	Counter.Tick2("ControlArmyCorps11a",30) 
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCorps11a = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if IsDead(armyCorps11a) then
		
			Redeploy(armyCorps11a,GetPosition("player2"),1000)
		
			StartJob("SetUpArmyCorps11a")
			
			return true
			
			end

		Advance(armyCorps11a)	

		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	







