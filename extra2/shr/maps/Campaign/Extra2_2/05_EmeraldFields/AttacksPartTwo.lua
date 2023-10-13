-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyPart2Attack = function()

	ArmyPart2Attack					= {}

	ArmyPart2Attack.player 				= 6
	ArmyPart2Attack.id				= 2
	ArmyPart2Attack.strength			= 3
	ArmyPart2Attack.retreatStrength			= 0
	ArmyPart2Attack.position			= GetPosition("P2SpawnArmy")
	ArmyPart2Attack.baseDefenseRange		= 6000
	ArmyPart2Attack.outerDefenseRange		= 7000
	ArmyPart2Attack.rodeLength			= 3000
	ArmyPart2Attack.beAgressive			= true
	ArmyPart2Attack.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
								UpgradeCategories.LeaderSword, 
								UpgradeCategories.LeaderBow
								}

	if CP_Difficulty > 0 then
		ArmyPart2Attack.strength = ArmyPart2Attack.strength * 2
		table.insert(ArmyPart2Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
	end

	ArmyPart2Attack.Attack				= false
	ArmyPart2Attack.AttackAllowed			= false
	ArmyPart2Attack.experiencePoints		=	CP_Difficulty


	-- Setup army
	SetupArmy(ArmyPart2Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyPart2Attack)
	
	-- Control army
	StartJob("ControlArmyPart2Attack")
end

P2Attack = function()

	-- Begin attack
	ArmyPart2Attack.AttackAllowed		= true
	ArmyPart2Attack.AttackPos		= GetPosition("BaseUnderAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyPart2Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyPart2Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyPart2Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyPart2Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyPart2Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
