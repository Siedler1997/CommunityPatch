ATTACK_P2_CAVALLERYSTART						= 50*60


setupArmyP2CavalryAttack = function()

	ArmyP2CavalryAttack						= {}

	ArmyP2CavalryAttack.player 				= 	2
	ArmyP2CavalryAttack.id					= 	1
	ArmyP2CavalryAttack.strength			= 	4
	ArmyP2CavalryAttack.position			= 	GetPosition("P2Defense")
	ArmyP2CavalryAttack.rodeLength			= 	7000
	ArmyP2CavalryAttack.beAgressive			=	true
	                                	
	ArmyP2CavalryAttack.AllowedTypes 		= 	{ UpgradeCategories.LeaderHeavyCavalry }

	-- Attack parameter
	ArmyP2CavalryAttack.retreatStrength		= 	1

	ArmyP2CavalryAttack.baseDefenseRange	= 	4000
	ArmyP2CavalryAttack.outerDefenseRange	= 	7000
                                      	
	ArmyP2CavalryAttack.Attack				= 	false
	ArmyP2CavalryAttack.AttackPos			=	{}
	
	for i=1,5 do
		ArmyP2CavalryAttack.AttackPos[i]		=	GetPosition("P2AttackPos"..i)
	end
	
	ArmyP2CavalryAttack.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP2CavalryAttack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP2CavalryAttack", ArmyP2CavalryAttack)
	
	-- Control army
	StartJob("ControlArmyP2CavalryAttack")

	TimeLine.Enter("Start P2CA attack", TimeLine.Seconds + ATTACK_P2_CAVALLERYSTART, "StartArmyP2CavalryAttack")

end

StartArmyP2CavalryAttack = function()

	-- Begin attack
	ArmyP2CavalryAttack.AttackAllowed = true

	TimeLine.Enter("Increase Size P2CA to 3/1", TimeLine.Seconds + 60*60, "IncreaseArmyP2CavalryAttackSize")
	TimeLine.Enter("Increase Size P2CA to 4/2", TimeLine.Seconds + 90*60, "IncreaseArmyP2CavalryAttackSize")
	TimeLine.Enter("Increase Size P2CA to 5/2", TimeLine.Seconds + 120*60, "IncreaseArmyP2CavalryAttackSize")
	TimeLine.Enter("Increase Size P2CA to 6/2", TimeLine.Seconds + 180*60, "IncreaseArmyP2CavalryAttackSize")

	TimeLine.Enter("Upgrade P2heavycavalry to lvl 2", TimeLine.Seconds + 150*60, "UpgradeP2HeavyCavalry")
end

IncreaseArmyP2CavalryAttackSize = function()

	ArmyP2CavalryAttack.strength 		=	ArmyP2CavalryAttack.strength + 1
	ArmyP2CavalryAttack.retreatStrength	=	ArmyP2CavalryAttack.strength / 3

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2CavalryAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2CavalryAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2CavalryAttack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2CavalryAttack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2CavalryAttack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
