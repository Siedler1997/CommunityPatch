setupArmyAI1DefendIron = function()

	ArmyAI1DefendIron						= {}

	ArmyAI1DefendIron.player 				= 5
	ArmyAI1DefendIron.id					= 2
	ArmyAI1DefendIron.strength				= 4
	ArmyAI1DefendIron.retreatStrength		= 2
	ArmyAI1DefendIron.position				= GetPosition("AI1_Defend_Iron")
	ArmyAI1DefendIron.baseDefenseRange		= 3000
	ArmyAI1DefendIron.outerDefenseRange		= 3000
	ArmyAI1DefendIron.rodeLength			= 3000
	ArmyAI1DefendIron.beAgressive			= true
	ArmyAI1DefendIron.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow }
	if CP_Difficulty == 2 then
		table.insert(ArmyAI1DefendIron.AllowedTypes, Entities.PV_Cannon3)
		table.insert(ArmyAI1DefendIron.AllowedTypes, Entities.PV_Cannon3)
	else
		table.insert(ArmyAI1DefendIron.AllowedTypes, Entities.PV_Cannon2)
		table.insert(ArmyAI1DefendIron.AllowedTypes, Entities.PV_Cannon2)
	end

	ArmyAI1DefendIron.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyAI1DefendIron)
	
	-- Army generator
	SetupAITroopGenerator("AI1DefendIron", ArmyAI1DefendIron)
	
	-- Control army
	StartJob("ControlArmyAI1DefendIron")
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI1DefendIron"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAI1DefendIron = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAI1DefendIron",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAI1DefendIron = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAI1DefendIron)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
