ATTACK_P2_START						= 30 * 60

setupArmyP2Attack = function()

	ArmyP2Attack					= {}

	ArmyP2Attack.player 			= 	2
	ArmyP2Attack.id					= 	0
	ArmyP2Attack.strength			= 	4
	ArmyP2Attack.position			= 	GetPosition("P2Defense")
	ArmyP2Attack.rodeLength			= 	7000
	ArmyP2Attack.beAgressive		=	true
	                                	
	ArmyP2Attack.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow 
										}

	-- Attack parameter
	ArmyP2Attack.retreatStrength	= 	1

	ArmyP2Attack.baseDefenseRange	= 	4000
	ArmyP2Attack.outerDefenseRange	= 	7000
                                      	
	ArmyP2Attack.Attack				= 	false
	ArmyP2Attack.AttackPos			=	{}
	
	for i=1,5 do
		ArmyP2Attack.AttackPos[i]	=	GetPosition("P2AttackPos"..i)
	end
	
	ArmyP2Attack.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP2Attack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP2Attack", ArmyP2Attack)
	
	-- Control army
	StartJob("ControlArmyP2Attack")

	TimeLine.Enter("Start P2A attack", TimeLine.Seconds + ATTACK_P2_START, "StartArmyP2Attack")

	TimeLine.Enter("Increase Size P2A to 5/1", TimeLine.Seconds + 50*60, "IncreaseArmyP2AttackSize")
	TimeLine.Enter("Increase Size P2A to 6/2", TimeLine.Seconds + 70*60, "IncreaseArmyP2AttackSize")
	TimeLine.Enter("Increase Size P2A to 7/2", TimeLine.Seconds + 90*60, "IncreaseArmyP2AttackSize")
	TimeLine.Enter("Increase Size P2A to 8/2", TimeLine.Seconds + 110*60, "IncreaseArmyP2AttackSize")

	TimeLine.Enter("Upgrade P2pole to lvl 2", TimeLine.Seconds + 40*60, "UpgradeP2PoleArm")
	TimeLine.Enter("Upgrade P2pole to lvl 3", TimeLine.Seconds + 90*60, "UpgradeP2PoleArm")
	TimeLine.Enter("Upgrade P2pole to lvl 4", TimeLine.Seconds + 120*60, "UpgradeP2PoleArm")
	
	TimeLine.Enter("Upgrade P2sword to lvl 2", TimeLine.Seconds + 30*60, "UpgradeP2Sword")
	TimeLine.Enter("Upgrade P2sword to lvl 3", TimeLine.Seconds + 60*60, "UpgradeP2Sword")
	TimeLine.Enter("Upgrade P2sword to lvl 4", TimeLine.Seconds + 100*60, "UpgradeP2Sword")

	TimeLine.Enter("Upgrade P2bow to lvl 2", TimeLine.Seconds + 50*60, "UpgradeP2Bow")
	TimeLine.Enter("Upgrade P2bow to lvl 3", TimeLine.Seconds + 70*60, "UpgradeP2Bow")
	TimeLine.Enter("Upgrade P2bow to lvl 4", TimeLine.Seconds + 110*60, "UpgradeP2Bow")
	
	TimeLine.Enter("Allow P2 Rifles", TimeLine.Seconds + 70*60, "AllowArmyP2AttackRifle")
	TimeLine.Enter("Upgrade P2rifle to lvl 2", TimeLine.Seconds + 130*60, "UpgradeP2Rifle")


end

StartArmyP2Attack = function()
	-- Begin attack
	ArmyP2Attack.AttackAllowed = true
end

IncreaseArmyP2AttackSize = function()

	ArmyP2Attack.strength 		=	ArmyP2Attack.strength + 1
	ArmyP2Attack.retreatStrength	=	ArmyP2Attack.strength / 3

end

AllowArmyP2AttackRifle = function()
	table.insert(ArmyP2Attack.AllowedTypes, UpgradeCategories.LeaderRifle)
end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP2Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP2Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP2Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP2Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP2Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
