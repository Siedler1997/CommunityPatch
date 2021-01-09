setupArmyLeftFortress = function()

	ArmyLeftFortress						= {}

	ArmyLeftFortress.player 				= 2
	ArmyLeftFortress.id						= 0
	ArmyLeftFortress.strength				= 6
	ArmyLeftFortress.retreatStrength			= 2
	ArmyLeftFortress.position				= GetPosition("KI1_DefensePos")
	ArmyLeftFortress.baseDefenseRange		= 6000
	ArmyLeftFortress.outerDefenseRange		= 8000
	ArmyLeftFortress.rodeLength				= 3000
	ArmyLeftFortress.AllowedTypes 			= {	UpgradeCategories.LeaderPoleArm, 
												UpgradeCategories.LeaderSword, 
												UpgradeCategories.LeaderBow }

	if CP_Difficulty == 0 then
		table.insert(ArmyLeftFortress.AllowedTypes, Entities.PV_Cannon2)
	else
		table.insert(ArmyLeftFortress.AllowedTypes, Entities.PV_Cannon4)
	end

	ArmyLeftFortress.Attack					= false
	ArmyLeftFortress.AttackPos				= GetPosition("KI1_AttackPos")
	ArmyLeftFortress.AttackAllowed			= false


	-- Setup army
	SetupArmy(ArmyLeftFortress)
	
	-- Army generator
	SetupAITroopGenerator("LeftFortress", ArmyLeftFortress)
	
	-- Control army
	StartJob("ControlArmyLeftFortress")
end

StartLeftFortress_Attack = function()

	-- Begin attack
	ArmyLeftFortress.AttackAllowed = true

end


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyLeftFortress"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyLeftFortress = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyLeftFortress",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyLeftFortress = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyLeftFortress)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
