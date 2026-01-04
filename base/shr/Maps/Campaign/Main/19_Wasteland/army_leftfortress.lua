setupArmyLeftFortress = function()

	ArmyLeftFortress						= {}

	ArmyLeftFortress.player 				= 2
	ArmyLeftFortress.id						= 3
	ArmyLeftFortress.strength				= 6 + CP_Difficulty
	ArmyLeftFortress.retreatStrength		= 1
	ArmyLeftFortress.position				= GetPosition("KI1_DefensePos")
	ArmyLeftFortress.baseDefenseRange		= 6000
	ArmyLeftFortress.outerDefenseRange		= 8000
	ArmyLeftFortress.rodeLength				= 3000
	ArmyLeftFortress.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword, 
												UpgradeCategories.LeaderBow,
												UpgradeCategories.BlackKnightLeaderMace1,
												Entities.PV_Cannon3a }

	if CP_Difficulty == 0 then
		table.insert(ArmyLeftFortress.AllowedTypes, Entities.PV_Cannon2)
	else
		table.insert(ArmyLeftFortress.AllowedTypes, Entities.PV_Cannon4a)
	end

	ArmyLeftFortress.Attack					= false
	ArmyLeftFortress.AttackAllowed			= false
	ArmyLeftFortress.AttackPos				= GetPosition("KI1_DefensePos")


	-- Setup army
	SetupArmy(ArmyLeftFortress)
	
	-- Army generator
	SetupAITroopGenerator("LeftFortress", ArmyLeftFortress)
	
	-- Control army
	StartJob("ControlArmyLeftFortress")
end

--[[
StartLeftFortress_Attack = function()
	-- Begin attack
	--ArmyLeftFortress.Attack = true
	ArmyLeftFortress.AttackAllowed = true
end
--]]
-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyLeftFortress"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyLeftFortress = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyLeftFortress",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyLeftFortress = function()
	-------------------------------------------------------------------------------------------------------------------
		local currentWeatherState = Logic.GetWeatherState()
		if currentWeatherState == 3 or bringLifeToTreeDone == true then
			--ArmyLeftFortress.Attack = true
			ArmyLeftFortress.AttackAllowed = true
		else
			--ArmyLeftFortress.Attack = false
			ArmyLeftFortress.AttackAllowed = false
		end
		TickOffensiveAIController(ArmyLeftFortress)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
