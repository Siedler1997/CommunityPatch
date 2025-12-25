-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyPart5Attack = function()

	ArmyPart5Attack					= {}

	ArmyPart5Attack.player 				= 2
	ArmyPart5Attack.id				= 1
	ArmyPart5Attack.strength			= 4 + 2 * CP_Difficulty
	ArmyPart5Attack.retreatStrength			= 0
	ArmyPart5Attack.position			= GetPosition("P5SpawnArmy")
	ArmyPart5Attack.baseDefenseRange		= 6000
	ArmyPart5Attack.outerDefenseRange		= 7000
	ArmyPart5Attack.rodeLength			= 3000
	ArmyPart5Attack.beAgressive			= true
	ArmyPart5Attack.AllowedTypes 			= {	UpgradeCategories.LeaderSword, 
								UpgradeCategories.LeaderHeavyCavalry,
								UpgradeCategories.LeaderBow,
								Entities.PV_Cannon3
								}

	if CP_Difficulty == 2 then
		table.insert(ArmyPart5Attack.AllowedTypes, UpgradeCategories.BlackKnightLeaderMace1)
		table.insert(ArmyPart5Attack.AllowedTypes, UpgradeCategories.LeaderPoleArm)
		table.insert(ArmyPart5Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
	end

	ArmyPart5Attack.Attack				= false
	ArmyPart5Attack.AttackAllowed			= false
	ArmyPart5Attack.experiencePoints		=	CP_Difficulty


	-- Setup army
	SetupArmy(ArmyPart5Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyPart5Attack)
	
	-- Control army
	StartJob("ControlArmyPart5Attack")
end

P5Attack = function()

	-- Begin attack
	ArmyPart5Attack.AttackAllowed		= true
	ArmyPart5Attack.AttackPos		= GetPosition("BaseUnderAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyPart5Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyPart5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyPart5Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyPart5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyPart5Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
