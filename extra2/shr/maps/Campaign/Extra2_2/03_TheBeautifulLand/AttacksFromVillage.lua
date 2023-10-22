-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyAI1Attack = function()

	ArmyAI1Attack					= {}

	ArmyAI1Attack.player 				= 2
	ArmyAI1Attack.id				= 1
	ArmyAI1Attack.strength				= 6
	ArmyAI1Attack.retreatStrength			= 2
	ArmyAI1Attack.position				= GetPosition("spawn2")
	ArmyAI1Attack.baseDefenseRange			= 6000
	ArmyAI1Attack.outerDefenseRange			= 7000
	ArmyAI1Attack.rodeLength			= 3000
	ArmyAI1Attack.beAgressive			= true
	ArmyAI1Attack.AllowedTypes 			= {	
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow
								}
	if CP_Difficulty == 2 then
		ArmyAI1Attack.strength = ArmyAI1Attack.strength + 2
		table.insert(ArmyAI1Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
	end

	ArmyAI1Attack.Attack				= false
	ArmyAI1Attack.AttackAllowed			= false
	ArmyAI1Attack.experiencePoints		=	CP_Difficulty


	-- Setup army
	SetupArmy(ArmyAI1Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyAI1Attack)
	
	-- Control army
	StartJob("ControlArmyAI1Attack")
end

StartAttackPos1 = function()

	-- Begin attack
	ArmyAI1Attack.AttackAllowed	= true
	ArmyAI1Attack.AttackPos		= GetPosition("Attack1")

end

StartAttackPos2 = function()

	-- Begin attack
	ArmyAI1Attack.AttackAllowed	= true
	ArmyAI1Attack.AttackPos		= GetPosition("Attack2")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAI1Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAI1Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAI1Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAI1Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAI1Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
