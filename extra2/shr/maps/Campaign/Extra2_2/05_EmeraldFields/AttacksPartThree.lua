-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyPart3Attack = function()

	ArmyPart3Attack					= {}

	ArmyPart3Attack.player 				= 7
	ArmyPart3Attack.id				= 1
	ArmyPart3Attack.strength			= 3
	ArmyPart3Attack.retreatStrength			= 0
	ArmyPart3Attack.position			= GetPosition("P3SpawnArmy")
	ArmyPart3Attack.baseDefenseRange		= 6000
	ArmyPart3Attack.outerDefenseRange		= 7000
	ArmyPart3Attack.rodeLength			= 3000
	ArmyPart3Attack.beAgressive			= true
	ArmyPart3Attack.AllowedTypes 			= {	UpgradeCategories.LeaderSword, 
								UpgradeCategories.LeaderBow,
								Entities.PV_Cannon3,
								UpgradeCategories.LeaderHeavyCavalry
								}

	if CP_Difficulty == 1 then
		ArmyPart3Attack.strength = ArmyPart3Attack.strength * 2
		table.insert(ArmyPart3Attack.AllowedTypes, UpgradeCategories.LeaderPoleArm)
		table.insert(ArmyPart3Attack.AllowedTypes, UpgradeCategories.LeaderCavalry)
		table.insert(ArmyPart3Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
	end

	ArmyPart3Attack.Attack				= false
	ArmyPart3Attack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyPart3Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyPart3Attack)
	
	-- Control army
	StartJob("ControlArmyPart3Attack")
end

P3Attack = function()

	-- Begin attack
	ArmyPart3Attack.AttackAllowed		= true
	ArmyPart3Attack.AttackPos		= GetPosition("BaseUnderAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyPart3Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyPart3Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyPart3Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyPart3Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyPart3Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
