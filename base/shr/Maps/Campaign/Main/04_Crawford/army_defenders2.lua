
-- Army in East

createArmyDefenders2 = function()

	--	set up

		armyDefenders2						= {}
	
		armyDefenders2.player 				= 5
		armyDefenders2.id					= 8
		armyDefenders2.strength				= 3
		armyDefenders2.position				= GetPosition("spawn2")
		armyDefenders2.rodeLength			= 4000
		armyDefenders2.control				= {}
		armyDefenders2.control.timer		= 0
		
		SetupArmy(armyDefenders2)
	
	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= LOW_EXPERIENCE,
		}				

		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1			
		EnlargeArmy(armyDefenders2,troopDescription)
		EnlargeArmy(armyDefenders2,troopDescription)
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2
		end
		EnlargeArmy(armyDefenders2,troopDescription)
	
	--	job		
		
		StartJob("ControlArmyDefenders2")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefenders2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefenders2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyDefenders2",2)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefenders2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyDefenders2) then
						
			return true
			
			end

		Defend(armyDefenders2)

		return false
		
		end
	