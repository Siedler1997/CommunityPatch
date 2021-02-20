-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyAriArmyAttack = function()

	ArmyAriArmyAttack				= {}

	ArmyAriArmyAttack.player 			= 5
	ArmyAriArmyAttack.id				= 1
	ArmyAriArmyAttack.strength			= 3
	ArmyAriArmyAttack.retreatStrength		= 0
	ArmyAriArmyAttack.position			= GetPosition("AriArmySpawn")
	ArmyAriArmyAttack.baseDefenseRange		= 6000
	ArmyAriArmyAttack.outerDefenseRange		= 7000
	ArmyAriArmyAttack.rodeLength			= 3000
	ArmyAriArmyAttack.beAgressive			= true
	ArmyAriArmyAttack.AllowedTypes 			= {	UpgradeCategories.LeaderBow,
												UpgradeCategories.LeaderHeavyCavalry,
												UpgradeCategories.LeaderRifle,
												UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword,
												UpgradeCategories.LeaderCavalry,
												Entities.PV_Cannon2

								}

	ArmyAriArmyAttack.Attack			= false
	ArmyAriArmyAttack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyAriArmyAttack)
	
	-- Army generator
	SetupAITroopGenerator("EArmyAttack", ArmyAriArmyAttack)
	
	-- Control army
	StartJob("ControlArmyAriArmyAttack")
end

AriAttackPos1 = function()

	-- Begin attack
	ArmyAriArmyAttack.AttackAllowed		= true
	ArmyAriArmyAttack.AttackPos		= GetPosition("P4_AttackTarg4")

end

AriAttackPos2 = function()

	-- Begin attack
	ArmyAriArmyAttack.AttackAllowed		= true
	ArmyAriArmyAttack.AttackPos		= GetPosition("AriArmyAttack2")

end

AriAttackPos3 = function()

	-- Begin attack
	ArmyAriArmyAttack.AttackAllowed		= true
	ArmyAriArmyAttack.AttackPos		= GetPosition("TargetFinalAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyAriArmyAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAriArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyAriArmyAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAriArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyAriArmyAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
