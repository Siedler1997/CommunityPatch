setupArmyP2IronAttack = function()

	ArmyP2IronAttack					= {}

	ArmyP2IronAttack.player 			= 	2
	ArmyP2IronAttack.id					= 	4
	ArmyP2IronAttack.strength			= 	4
	ArmyP2IronAttack.position			= 	GetPosition("AI1_ConcentratingArea2")
	ArmyP2IronAttack.rodeLength			= 	7000
	                                	
	ArmyP2IronAttack.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword, 
												UpgradeCategories.LeaderBow
											}

	-- Attack parameter
	ArmyP2IronAttack.retreatStrength	= 	1

	ArmyP2IronAttack.baseDefenseRange	= 	5000
	ArmyP2IronAttack.outerDefenseRange	= 	7000
                                      	
	ArmyP2IronAttack.Attack				= 	false
	ArmyP2IronAttack.AttackPos			=	GetPosition("AI1_Attack_Iron")
	ArmyP2IronAttack.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP2IronAttack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP2IronAttack", ArmyP2IronAttack)
	
	-- Control army
	StartJob("ControlArmyP2IronAttack")
end

StartArmyP2IronAttack = function()

	-- Begin attack
	ArmyP2IronAttack.AttackAllowed = true

	TimeLine.Enter("Allow P2IA Cannons", TimeLine.Seconds + 10*60, "AllowArmyP2IronAttackCannons")
	TimeLine.Enter("Allow P2IA Cavalry", TimeLine.Seconds + 40*60, "AllowArmyP2IronAttackCavalry")

	TimeLine.Enter("Increase Size P2IA to 5/1", TimeLine.Seconds + 20*60, "IncreaseArmyP2IronAttackSize")
	TimeLine.Enter("Increase Size P2IA to 6/2", TimeLine.Seconds + 30*60, "IncreaseArmyP2IronAttackSize")
	TimeLine.Enter("Increase Size P2IA to 7/2", TimeLine.Seconds + 40*60, "IncreaseArmyP2IronAttackSize")
	TimeLine.Enter("Increase Size P2IA to 8/2", TimeLine.Seconds + 50*60, "IncreaseArmyP2IronAttackSize")

end

AllowArmyP2IronAttackCannons = function()
	if CP_Difficulty == 0 then
		table.insert(ArmyP2IronAttack.AllowedTypes, 	Entities.PV_Cannon2)
		table.insert(ArmyP2IronAttack.AllowedTypes, 	Entities.PV_Cannon2)
	else
		table.insert(ArmyP2IronAttack.AllowedTypes, 	Entities.PV_Cannon3a)
		table.insert(ArmyP2IronAttack.AllowedTypes, 	Entities.PV_Cannon3a)
	end
end

AllowArmyP2IronAttackCavalry = function()

	table.insert(ArmyP2IronAttack.AllowedTypes, 	UpgradeCategories.LeaderHeavyCavalry)
	table.insert(ArmyP2IronAttack.AllowedTypes, 	UpgradeCategories.LeaderCavalry)

end

IncreaseArmyP2IronAttackSize = function()

	ArmyP2IronAttack.strength 			=	ArmyP2IronAttack.strength + 1
	ArmyP2IronAttack.retreatStrength	=	ArmyP2IronAttack.strength / 3

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2IronAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2IronAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2IronAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2IronAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2IronAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
