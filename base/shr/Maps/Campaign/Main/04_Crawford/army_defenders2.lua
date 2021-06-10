
-- Army in East

createArmyDefenders2 = function()

	--	set up
		local strength = 3
		local experience = 0
		local etype = Entities.CU_BlackKnight_LeaderMace1
		if CP_Difficulty > 0 then
			strength = 4
			experience = HIGH_EXPERIENCE
			etype = Entities.CU_BlackKnight_LeaderMace2
		end

		armyDefenders2						= {}
	
		armyDefenders2.player 				= 5
		armyDefenders2.id					= 8
		armyDefenders2.strength				= strength
		armyDefenders2.position				= GetPosition("spawn2")
		armyDefenders2.rodeLength			= 4000
		armyDefenders2.control				= {}
		armyDefenders2.control.timer		= 0
		
		SetupArmy(armyDefenders2)
	
	--	create

		local troopDescription = {
		
			maxNumberOfSoldiers	= 8,
			minNumberOfSoldiers	= 2,
			experiencePoints 	= experience,
		}				

		troopDescription.leaderType = etype
		EnlargeArmy(armyDefenders2,troopDescription)
		EnlargeArmy(armyDefenders2,troopDescription)
		
		if CP_Difficulty == 0 then
			troopDescription.leaderType = Entities.PU_LeaderBow1
		elseif CP_Difficulty == 1 then
			troopDescription.leaderType = Entities.PU_LeaderBow2
		else
			troopDescription.leaderType = Entities.PU_LeaderBow3
		end		
		EnlargeArmy(armyDefenders2,troopDescription)
		
		if CP_Difficulty == 1 then
			troopDescription.leaderType = Entities.PV_Cannon1
		elseif CP_Difficulty == 2 then
			troopDescription.leaderType = Entities.PV_Cannon2
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
	