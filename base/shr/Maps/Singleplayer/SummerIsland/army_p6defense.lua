setupArmyP6Defense = function()

	ArmyP6Defense					= {}

	ArmyP6Defense.player 			= 	6
	ArmyP6Defense.id				= 	0
	ArmyP6Defense.strength			= 	8
	ArmyP6Defense.position			= 	GetPosition("P6Defense")
	ArmyP6Defense.rodeLength		= 	4500
	                                	
	ArmyP6Defense.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderHeavyCavalry,
											UpgradeCategories.LeaderBow,
											Entities.PV_Cannon3,
											Entities.PV_Cannon3 }
	ArmyP6Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP6Defense.retreatStrength	= 	0

	ArmyP6Defense.baseDefenseRange	= 	4500
	ArmyP6Defense.outerDefenseRange	= 	4500
                                      	
	ArmyP6Defense.Attack			= 	false
	ArmyP6Defense.AttackAllowed		= 	false

	ArmyP6Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP6Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP6Defense", ArmyP6Defense)
	
	-- Control army
	StartJob("ControlArmyP6Defense")

	TimeLine.Enter("Upgrade P6pole to lvl 2", TimeLine.Seconds + 30*60, "UpgradeP6PoleArm")
	TimeLine.Enter("Upgrade P6pole to lvl 3", TimeLine.Seconds + 60*60, "UpgradeP6PoleArm")
	TimeLine.Enter("Upgrade P6pole to lvl 4", TimeLine.Seconds + 100*60, "UpgradeP6PoleArm")
	
	TimeLine.Enter("Upgrade P6sword to lvl 2", TimeLine.Seconds + 50*60, "UpgradeP6Sword")
	TimeLine.Enter("Upgrade P6sword to lvl 3", TimeLine.Seconds + 80*60, "UpgradeP6Sword")
	TimeLine.Enter("Upgrade P6sword to lvl 4", TimeLine.Seconds + 120*60, "UpgradeP6Sword")

	TimeLine.Enter("Upgrade P6bow to lvl 2", TimeLine.Seconds + 40*60, "UpgradeP6Bow")
	TimeLine.Enter("Upgrade P6bow to lvl 3", TimeLine.Seconds + 70*60, "UpgradeP6Bow")
	TimeLine.Enter("Upgrade P6bow to lvl 4", TimeLine.Seconds + 110*60, "UpgradeP6Bow")

	TimeLine.Enter("Upgrade P6heavycavalry to lvl 2", TimeLine.Seconds + 90*60, "UpgradeP6HeavyCavalry")
	--TimeLine.Enter("Upgrade P6cavalry to lvl 2", TimeLine.Seconds + 125*60, "UpgradeP6Cavalry")

	TimeLine.Enter("Allow P6D Cannons", TimeLine.Seconds + 130*60, "AllowArmyP6DefenseCannons")

end

AllowArmyP6DefenseCannons = function()

	table.insert(ArmyP6Defense.AllowedTypes, 	Entities.PV_Cannon4)
	table.insert(ArmyP6Defense.AllowedTypes, 	Entities.PV_Cannon4)

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP6Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP6Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP6Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP6Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP6Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
