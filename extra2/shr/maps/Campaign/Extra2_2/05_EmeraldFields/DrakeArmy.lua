-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

setupArmyDArmyAttack = function()

	ArmyDArmyAttack					= {}

	ArmyDArmyAttack.player 				= 4
	ArmyDArmyAttack.id				= 1
	ArmyDArmyAttack.strength			= 3
	ArmyDArmyAttack.retreatStrength			= 0
	ArmyDArmyAttack.position			= GetPosition("DrakeArmySpawn")
	ArmyDArmyAttack.baseDefenseRange		= 6000
	ArmyDArmyAttack.outerDefenseRange		= 7000
	ArmyDArmyAttack.rodeLength			= 3000
	ArmyDArmyAttack.beAgressive			= true
	ArmyDArmyAttack.AllowedTypes 			= {	UpgradeCategories.LeaderRifle,
												UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword,
												UpgradeCategories.LeaderHeavyCavalry,
												UpgradeCategories.LeaderBow, 
												UpgradeCategories.LeaderCavalry,
												Entities.PV_Cannon4
								}

	ArmyDArmyAttack.Attack				= false
	ArmyDArmyAttack.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyDArmyAttack)
	
	-- Army generator
	SetupAITroopGenerator("EArmyAttack", ArmyDArmyAttack)
	
	-- Control army
	StartJob("ControlArmyDArmyAttack")
end

DrakeAttackPos1 = function()

	-- Begin attack
	ArmyDArmyAttack.AttackAllowed		= true
	ArmyDArmyAttack.AttackPos		= GetPosition("P4_AttackTarg3")

end

DrakeAttackPos2 = function()

	-- Begin attack
	ArmyDArmyAttack.AttackAllowed		= true
	ArmyDArmyAttack.AttackPos		= GetPosition("DrakeArmyAttack2")

end

DrakeAttackPos3 = function()

	-- Begin attack
	ArmyDArmyAttack.AttackAllowed		= true
	ArmyDArmyAttack.AttackPos		= GetPosition("TargetFinalAttack")

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyDArmyAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyDArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyDArmyAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyDArmyAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyDArmyAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
