setupArmyAI1Defense = function()

	ArmyAI1Defense						= {}

	ArmyAI1Defense.player 				= 5
	ArmyAI1Defense.id					= 3
	ArmyAI1Defense.strength				= 4
	ArmyAI1Defense.retreatStrength		= 2
	ArmyAI1Defense.position				= GetPosition("AI1_DefensePos")
	ArmyAI1Defense.baseDefenseRange		= 6000
	ArmyAI1Defense.outerDefenseRange	= 7000
	ArmyAI1Defense.rodeLength			= 3000
	ArmyAI1Defense.AllowedTypes 		= {	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow }
	if CP_Difficulty == 2 then
		table.insert(ArmyAI1Defense.AllowedTypes, Entities.PV_Cannon3)
		table.insert(ArmyAI1Defense.AllowedTypes, Entities.PV_Cannon3)
	else
		table.insert(ArmyAI1Defense.AllowedTypes, Entities.PV_Cannon2)
		table.insert(ArmyAI1Defense.AllowedTypes, Entities.PV_Cannon2)
	end

	ArmyAI1Defense.Attack				= false
	ArmyAI1Defense.AttackAllowed		= false


	-- Setup army
	SetupArmy(ArmyAI1Defense)
	
	-- Army generator
	SetupAITroopGenerator("AI1Defense", ArmyAI1Defense)
	
	-- Control army
	StartJob("ControlArmyAI1Defense")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI1Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAI1Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAI1Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAI1Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAI1Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
