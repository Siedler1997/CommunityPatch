setupArmyP4Attacker = function()

	ArmyP4Attacker						= {}

	ArmyP4Attacker.player 				= 	4
	ArmyP4Attacker.id					= 	3
	if CP_Difficulty == 1 then
		ArmyP4Attacker.strength				= 	6
	else
		ArmyP4Attacker.strength				= 	4
	end
	ArmyP4Attacker.position				= 	GetPosition("P4AttackPos")
	ArmyP4Attacker.rodeLength			= 	3000
	ArmyP4Attacker.beAgressive			=	true
	    
	ArmyP4Attacker.AllowedTypes = 	{ 	UpgradeCategories.LeaderBarbarian }

	-- Attack parameter
	ArmyP4Attacker.retreatStrength		= 	0

	ArmyP4Attacker.baseDefenseRange		= 	2000
	ArmyP4Attacker.outerDefenseRange	= 	3000
                                      	
	ArmyP4Attacker.Attack				= 	false
	ArmyP4Attacker.AttackPos			=	GetPosition("P4AttackPos")
	ArmyP4Attacker.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP4Attacker)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP4Attacker", ArmyP4Attacker)
	
	-- Control army
	StartJob("ControlArmyP4Attacker")
	
	TimeLine.Enter("Start P4 Attack", TimeLine.Seconds + 600, "StartArmyP4Attacker")
end

StartArmyP4Attacker = function()
	if P4WinterAttackGathered == nil then

		-- Begin attack
		ArmyP4Attacker.AttackAllowed = true
		Report("P4NormalAttack")
	end
end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP4Attacker"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP4Attacker = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP4Attacker",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP4Attacker = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP4Attacker)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
