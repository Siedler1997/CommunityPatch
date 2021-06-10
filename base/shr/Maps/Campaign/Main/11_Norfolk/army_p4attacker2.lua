setupArmyP4Attacker2 = function()

	ArmyP4Attacker2						= {}

	ArmyP4Attacker2.player 				= 	4
	ArmyP4Attacker2.id					= 	7
	ArmyP4Attacker2.strength			= 	3
	ArmyP4Attacker2.position			= 	GetPosition("P4AttackPos")
	ArmyP4Attacker2.rodeLength			= 	3000
	ArmyP4Attacker2.beAgressive			=	true
	    
	ArmyP4Attacker2.AllowedTypes = 	{ 	UpgradeCategories.LeaderBarbarian }

	-- Attack parameter
	ArmyP4Attacker2.retreatStrength		= 	0

	ArmyP4Attacker2.baseDefenseRange	= 	2000
	ArmyP4Attacker2.outerDefenseRange	= 	3000
                                      	
	ArmyP4Attacker2.Attack				= 	false
	ArmyP4Attacker2.AttackPos			=	GetPosition("HQ1_Pos")
	ArmyP4Attacker2.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP4Attacker2)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP4Attacker2", ArmyP4Attacker2)
	
	-- Control army
	StartJob("ControlArmyP4Attacker2")

	TimeLine.Enter("Start P4 Attack", TimeLine.Seconds + 600, "StartArmyP4Attacker2")
end

StartArmyP4Attacker2 = function()
	if P4WinterAttackGathered == nil then

		-- Begin attack
		ArmyP4Attacker2.AttackAllowed = true
		Report("P4NormalAttack")
	end
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP4Attacker"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP4Attacker2 = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP4Attacker2",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP4Attacker2 = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP4Attacker2)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
