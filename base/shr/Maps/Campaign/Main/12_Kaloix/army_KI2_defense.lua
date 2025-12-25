setupArmyKI2Defense = function()

	armyKI2Defense				= {}

	armyKI2Defense.player 				= 2
	armyKI2Defense.id					= 2
	armyKI2Defense.strength				= 4 + CP_Difficulty
	armyKI2Defense.retreatStrength		= 3
	armyKI2Defense.position				= GetPosition("KI2_Defense")
	armyKI2Defense.baseDefenseRange		= 3000
	armyKI2Defense.outerDefenseRange	= 4000
	armyKI2Defense.rodeLength			= 3000
	armyKI2Defense.AllowedTypes 		= { UpgradeCategories.LeaderCavalry }
	if CP_Difficulty == 2 then
		table.insert(armyKI2Defense.AllowedTypes, LeaderHeavyCavalry)
	end

	armyKI2Defense.Attack				= false
	armyKI2Defense.AttackAllowed		= false


	-- Setup army
	SetupArmy(armyKI2Defense)
	
	-- Army generator
	SetupAITroopGenerator("KI2Defense", armyKI2Defense)
	
	-- Control army
	StartJob("ControlarmyKI2Defense")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyKI2Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyKI2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyKI2Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyKI2Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(armyKI2Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
