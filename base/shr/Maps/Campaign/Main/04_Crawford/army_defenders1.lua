
-- Army in west

createArmyDefenders1 = function()

	--	set up

		armyDefenders1						= {}
	
		armyDefenders1.player 				= 5
		armyDefenders1.id					= 7
		armyDefenders1.strength				= 3
		armyDefenders1.position				= GetPosition("spawn1")
		armyDefenders1.rodeLength			= 4000
		armyDefenders1.control				= {}
		armyDefenders1.control.timer		= 0
		
		SetupArmy(armyDefenders1)
	
	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= LOW_EXPERIENCE,
		}				


		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1				
		EnlargeArmy(armyDefenders1,troopDescription)
		EnlargeArmy(armyDefenders1,troopDescription)

		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
		else
			troopDescription.leaderType = Entities.PU_LeaderBow2
		end
		EnlargeArmy(armyDefenders1,troopDescription)
	
	--	job		
		
		StartJob("ControlArmyDefenders1")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyDefenders1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDefenders1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyDefenders1",2)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDefenders1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyDefenders1) then
						
			return true
			
			end

		Defend(armyDefenders1)

		return false
		
		end
	