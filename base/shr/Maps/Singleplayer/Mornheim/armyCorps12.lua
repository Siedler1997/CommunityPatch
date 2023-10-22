setupArmyCorps12 = function()

	armyCorps12							= {}

	armyCorps12.player 					= 2
	armyCorps12.id						= 3
	armyCorps12.strength				= 8
	armyCorps12.position				= GetPosition("player2")
	armyCorps12.rodeLength				= 4500
	armyCorps12.control					= {}
	armyCorps12.control.activation		= 60 * 5
	armyCorps12.control.timer			= 0
	
	SetupArmy(armyCorps12)
	
	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "SetUpArmyCorps12"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_SetUpArmyCorps12 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return 		Counter.Tick2("SetupArmyCorps12",50) 
				and	IsWeak(armyCorps12)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_SetUpArmyCorps12 = function()
	-------------------------------------------------------------------------------------------------------------------
		local distribution = Logic.GetRandom(100)
		
		local leaderType = Entities.PU_LeaderBow3

		if distribution > 70 then			
			leaderType = Entities.PU_LeaderBow2
		elseif distribution > 50 then			
			leaderType = Entities.PU_LeaderSword2
		elseif distribution > 20 then	
			leaderType = Entities.PV_Cannon2
		else		
			leaderType = Entities.PV_Cannon2
		end
			
		local troopDescription = {
		
			leaderType 			= leaderType,
			maxNumberOfSoldiers	= 9,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= HIGH_EXPERIENCE,
		}			
	
		EnlargeArmy(armyCorps12,troopDescription)
		EnlargeArmy(armyCorps12,troopDescription)
		
		StartJob("ControlArmyCorps12")
			
		return true;
		
		end
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyCorps12"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyCorps12 = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return Counter.Tick2("ControlArmyCorps12",30) 
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyCorps12 = function()
	-------------------------------------------------------------------------------------------------------------------
			
		if IsDead(armyCorps12) then
		
			Retreat(armyCorps12)
			
			StartJob("SetUpArmyCorps12")
			
			return true
			
			end

		FrontalAttack(armyCorps12)	

		return false
		
		end
-----------------------------------------------------------------------------------------------------------------------	
