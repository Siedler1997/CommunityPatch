setupArmyKI2 = function()

	armyKI2							= {}

	armyKI2.player 					= 2
	armyKI2.id						= 1
	armyKI2.strength				= 4 + CP_Difficulty
	armyKI2.retreatStrength			= 2
	armyKI2.position				= GetPosition("KI2_Position")
	armyKI2.rodeLength				= 3000
	armyKI2.baseDefenseRange		= 3500
	armyKI2.outerDefenseRange		= 3500
	armyKI2.AllowedTypes 			= { UpgradeCategories.LeaderPoleArm, UpgradeCategories.LeaderSword,
										UpgradeCategories.LeaderBow }
	armyKI2.Attack					= false
	armyKI2.AttackPos			= GetPosition("KI2_Position")
	armyKI2.AttackAllowed			= false


	-- Setup army
	SetupArmy(armyKI2)
	
	-- Army generator
	SetupAITroopGenerator("KI2", armyKI2)
	
	-- Control army
	StartJob("ControlarmyKI2")
end

StartKI2_Attack = function()

	-- Begin attack
	armyKI2.AttackAllowed = true

end

StopKI2_Attack = function()

	-- Begin attack
	armyKI2.AttackAllowed = false

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlarmyKI2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlarmyKI2 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlarmyKI2",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlarmyKI2 = function()
	-------------------------------------------------------------------------------------------------------------------

		TickOffensiveAIController(armyKI2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
