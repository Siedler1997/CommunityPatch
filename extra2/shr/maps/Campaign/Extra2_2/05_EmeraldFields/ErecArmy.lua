-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyEArmyAttack = function()

	ArmyEArmyAttack					= {}

	ArmyEArmyAttack.player 				= 3
	ArmyEArmyAttack.id				= 1
	ArmyEArmyAttack.strength			= 3
	ArmyEArmyAttack.retreatStrength			= 0
	ArmyEArmyAttack.position			= GetPosition("ErecArmySpawn")
	ArmyEArmyAttack.baseDefenseRange		= 6000
	ArmyEArmyAttack.outerDefenseRange		= 7000
	ArmyEArmyAttack.rodeLength			= 3000
	ArmyEArmyAttack.beAgressive			= true
	ArmyEArmyAttack.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword,
												UpgradeCategories.LeaderHeavyCavalry,
												UpgradeCategories.LeaderCavalry,
												UpgradeCategories.LeaderBow,
												UpgradeCategories.LeaderRifle, 
												Entities.PV_Cannon2
								}

	ArmyEArmyAttack.Attack				= false
	ArmyEArmyAttack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyEArmyAttack)
	
	-- Army generator
	SetupAITroopGenerator("EArmyAttack", ArmyEArmyAttack)
	
	-- Control army
	StartJob("ControlArmyEArmyAttack")
end

ErecAttackPos1 = function()

	-- Begin attack
	ArmyEArmyAttack.AttackAllowed		= true
	ArmyEArmyAttack.AttackPos		= GetPosition("P4_AttackTarg2")

end

ErecAttackPos2 = function()

	-- Begin attack
	ArmyEArmyAttack.AttackAllowed		= true
	ArmyEArmyAttack.AttackPos		= GetPosition("ErecArmyAttack2")

end

ErecAttackPos3 = function()

	-- Begin attack
	ArmyEArmyAttack.AttackAllowed		= true
	ArmyEArmyAttack.AttackPos		= GetPosition("TargetFinalAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyEArmyAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyEArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyEArmyAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyEArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyEArmyAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
