-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyPart4Attack = function()

	ArmyPart4Attack					= {}

	ArmyPart4Attack.player 				= 7
	ArmyPart4Attack.id				= 2
	ArmyPart4Attack.strength			= 3
	ArmyPart4Attack.retreatStrength			= 0
	ArmyPart4Attack.position			= GetPosition("P4SpawnArmy")
	ArmyPart4Attack.baseDefenseRange		= 6000
	ArmyPart4Attack.outerDefenseRange		= 7000
	ArmyPart4Attack.rodeLength			= 3000
	ArmyPart4Attack.beAgressive			= true
	ArmyPart4Attack.AllowedTypes 			= {	UpgradeCategories.LeaderSword, 
								UpgradeCategories.LeaderPoleArm,
								UpgradeCategories.LeaderBow
								}

	if CP_Difficulty > 0 then
		ArmyPart4Attack.strength = ArmyPart4Attack.strength * 2
		table.insert(ArmyPart4Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
	end

	ArmyPart4Attack.Attack				= false
	ArmyPart4Attack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyPart4Attack)
	
	-- Army generator
	SetupAITroopGenerator("AI1Attack", ArmyPart4Attack)
	
	-- Control army
	StartJob("ControlArmyPart4Attack")
end

P4Attack = function()

	-- Begin attack
	ArmyPart4Attack.AttackAllowed		= true
	ArmyPart4Attack.AttackPos		= GetPosition("BaseUnderAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyPart4Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyPart4Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyPart4Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyPart4Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyPart4Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
