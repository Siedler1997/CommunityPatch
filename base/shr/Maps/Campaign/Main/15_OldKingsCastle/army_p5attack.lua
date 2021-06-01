setupArmyP5Attack = function()

	ArmyP5Attack					= {}

	ArmyP5Attack.player 			= 	5
	ArmyP5Attack.id					= 	1
	ArmyP5Attack.position			= 	GetPosition("AI2_ConcentratingArea")
	ArmyP5Attack.rodeLength			= 	6000
	                                	
	ArmyP5Attack.AllowedTypes 		= 	{	UpgradeCategories.LeaderPoleArm, 
											UpgradeCategories.LeaderSword, 
											UpgradeCategories.LeaderBow,
											UpgradeCategories.LeaderCavalry,
											UpgradeCategories.LeaderHeavyCavalry }

	if CP_Difficulty == 0 then
		ArmyP5Attack.strength		= 	6
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon2)
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon2)
	else
		ArmyP5Attack.strength		= 	8
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon4)
		table.insert(ArmyP5Attack.AllowedTypes, Entities.PV_Cannon4)
	end

	-- Attack parameter
	ArmyP5Attack.retreatStrength	= 	2

	ArmyP5Attack.baseDefenseRange	= 	6000
	ArmyP5Attack.outerDefenseRange	= 	10000
                                      	
	ArmyP5Attack.Attack				= 	false
	ArmyP5Attack.AttackPos			=	GetPosition("AI2_ConcentratingArea")
	ArmyP5Attack.AttackAllowed		= 	false


	-- Setup army
	SetupArmy(ArmyP5Attack)
	
	-- Army generator
	SetupAITroopGenerator("ArmyP5Attack", ArmyP5Attack)
	
	-- Control army
	StartJob("ControlArmyP5Attack")
end

StartArmyP5Attack = function()

	-- Begin attack
	ArmyP5Attack.AttackAllowed = true

	local i
	for i=2,10 do
		TimeLine.Enter("P5 Attack Wave"..i, TimeLine.Seconds + i*10*60, "GiveP5ArmyResources")
	end

end

SetupArmyP5Upgrading = function()

	TimeLine.Enter("Upgrade P5pole to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5PoleArm")
	TimeLine.Enter("Upgrade P5pole to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5PoleArm")
	TimeLine.Enter("Upgrade P5pole to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5PoleArm")
	
	TimeLine.Enter("Upgrade P5sword to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5Sword")
	TimeLine.Enter("Upgrade P5sword to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5Sword")
	TimeLine.Enter("Upgrade P5sword to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5Sword")

	TimeLine.Enter("Upgrade P5bow to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5Bow")
	TimeLine.Enter("Upgrade P5bow to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5Bow")
	TimeLine.Enter("Upgrade P5bow to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5Bow")

	TimeLine.Enter("Upgrade P5cavalry to lvl 2", TimeLine.Seconds + 60*60, "UpgradeP2Cavalry")
	TimeLine.Enter("Upgrade P5heavycavalry to lvl 2", TimeLine.Seconds + 65*60, "UpgradeP2HeavyCavalry")

end


IncreaseArmyP5AttackSize = function()

	ArmyP5Attack.strength 			=	ArmyP5Attack.strength + 1
	ArmyP5Attack.retreatStrength	=	ArmyP5Attack.strength / 3

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP5Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP5Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP5Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
