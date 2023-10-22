setupArmyP4Defense = function()

	ArmyP4Defense					= {}

	ArmyP4Defense.player 			= 	4
	ArmyP4Defense.id				= 	0
	ArmyP4Defense.strength			= 	6
	ArmyP4Defense.position			= 	GetPosition("P4Defense")
	ArmyP4Defense.rodeLength		= 	4500
	                                	
	ArmyP4Defense.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow }
	ArmyP4Defense.ignoreAttack		=	true

	-- Attack parameter
	ArmyP4Defense.retreatStrength	= 	0

	ArmyP4Defense.baseDefenseRange	= 	4500
	ArmyP4Defense.outerDefenseRange	= 	4500
                                      	
	ArmyP4Defense.Attack			= 	false
	ArmyP4Defense.AttackAllowed		= 	false

	ArmyP4Defense.pulse				=	true

	-- Setup army
	SetupArmy(ArmyP4Defense)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP4Defense", ArmyP4Defense)
	
	-- Control army
	StartJob("ControlArmyP4Defense")

	TimeLine.Enter("Upgrade P4pole to lvl 2", TimeLine.Seconds + 30*60, "UpgradeP4PoleArm")
	TimeLine.Enter("Upgrade P4pole to lvl 3", TimeLine.Seconds + 60*60, "UpgradeP4PoleArm")
	--TimeLine.Enter("Upgrade P4pole to lvl 4", TimeLine.Seconds + 125*60, "UpgradeP4PoleArm")
	
	TimeLine.Enter("Upgrade P4sword to lvl 2", TimeLine.Seconds + 40*60, "UpgradeP4Sword")
	TimeLine.Enter("Upgrade P4sword to lvl 3", TimeLine.Seconds + 70*60, "UpgradeP4Sword")
	--TimeLine.Enter("Upgrade P4sword to lvl 4", TimeLine.Seconds + 155*60, "UpgradeP4Sword")

	TimeLine.Enter("Upgrade P4bow to lvl 2", TimeLine.Seconds + 50*60, "UpgradeP4Bow")
	TimeLine.Enter("Upgrade P4bow to lvl 3", TimeLine.Seconds + 80*60, "UpgradeP4Bow")
	--TimeLine.Enter("Upgrade P4bow to lvl 4", TimeLine.Seconds + 145*60, "UpgradeP4Bow")

--	TimeLine.Enter("Upgrade P4heavycavalry to lvl 2", TimeLine.Seconds + 95*60, "UpgradeP4HeavyCavalry")
--	TimeLine.Enter("Upgrade P4cavalry to lvl 2", TimeLine.Seconds + 125*60, "UpgradeP4Cavalry")

	--TimeLine.Enter("Allow P4D Cannons", TimeLine.Seconds + 130*60, "AllowArmyP4DefenseCannons")
	TimeLine.Enter("Increase army size", TimeLine.Seconds + 90*60, "IncreaseP4DefenseArmySize")
	
	TimeLine.Enter("Allow P4 Rifles", TimeLine.Seconds + 90*60, "AllowArmyP4DefenseRifle")
end

AllowArmyP4DefenseCannons = function()

	table.insert(ArmyP4Defense.AllowedTypes, 	Entities.PV_Cannon4)
	table.insert(ArmyP4Defense.AllowedTypes, 	Entities.PV_Cannon4)

end

AllowArmyP4DefenseRifle = function()
	table.insert(ArmyP4Defense.AllowedTypes, UpgradeCategories.LeaderRifle)
end

IncreaseP4DefenseArmySize = function()

	ArmyP4Defense.strength = 8

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP4Defense"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP4Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP4Defense",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP4Defense = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP4Defense)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
