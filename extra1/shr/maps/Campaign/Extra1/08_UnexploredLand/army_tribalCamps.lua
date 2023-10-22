function CreateArmyTribalCamps()

	-- Init armies
	ArmyTribalCamps						= 	{}
	ArmyTribalCamps.firstWinter			=	true

	for i=1,3 do
	
		ArmyTribalCamps[i]						=	{}
		ArmyTribalCamps[i].player 				=	2
		ArmyTribalCamps[i].id					=	2+i

		ArmyTribalCamps[i].strength				=	4
		ArmyTribalCamps[i].respawnTime			=	5*60
		if CP_Difficulty > 0 then
			ArmyTribalCamps[i].strength = ArmyTribalCamps[i].strength * 2
			ArmyTribalCamps[i].respawnTime = ArmyTribalCamps[i].respawnTime - 2*60
		end
		
		ArmyTribalCamps[i].position				=	GetPosition("P2_Nephilim_TribalCamp"..i)
		ArmyTribalCamps[i].rodeLength			=	5000
		ArmyTribalCamps[i].retreatStrength		=	0
		ArmyTribalCamps[i].baseDefenseRange		=	5000
		ArmyTribalCamps[i].outerDefenseRange	=	5000
		ArmyTribalCamps[i].AttackAllowed		=	false
		ArmyTribalCamps[i].pulse				=	true
		
		ArmyTribalCamps[i].spawnTypes			=	{ 	{ Entities.CU_Evil_LeaderBearman1, 16 },  
														{ Entities.CU_Evil_LeaderSkirmisher1, 16 },  
														{ Entities.CU_Evil_LeaderBearman1, 16 },  
														{ Entities.CU_Evil_LeaderSkirmisher1, 16 } } 
	
		ArmyTribalCamps[i].spawnGenerator		=	"Nephilim_Tribal_CampTower"..i                        
		ArmyTribalCamps[i].spawnPos				=	GetPosition("P2_Nephilim_TribalCamp"..i)              
		ArmyTribalCamps[i].noEnemy				=	true
		ArmyTribalCamps[i].noEnemyDistance		=	5000
		ArmyTribalCamps[i].endless				=	true
		ArmyTribalCamps[i].experiencePoints		=	CP_Difficulty
		
		
		-- Spawn generator
		SetupAITroopSpawnGenerator("ArmyTribalCamps"..i, ArmyTribalCamps[i])

	end

	StartSimpleJob("ControlArmyTribalCamps")

end

function StartArmyTribalCampsAttack()

	StartSimpleJob("ArmyTribalCampsAttackController")

	StartSimpleJob("IncreaseCampStrength")

end

function IncreaseCampStrength()

	if Counter.Tick2("IncreaseCampStrength",10*60) then
			
		ArmyTribalCamps[1].strength = 4
		
		return true
	end

end

function ArmyTribalCampsAttackController()

	if ArmyTribalCamps.attacking == true or ArmyTribalCamps.firstWinter then

		-- next weather is winter
		if Logic.GetNextWeatherState() ~= 3 then
	
			if Logic.GetTimeToNextWeatherPeriod() <= 3*60 then
				
				for i=1,3 do
					--ArmyTribalCamps[i].AttackAllowed = false
					ArmyTribalCamps[i].outerDefenseRange	=	5000
					ResetOffensiveAIController(ArmyTribalCamps[i])
				end	
				
				ArmyTribalCamps.attacking = false
				ArmyTribalCamps.firstWinter	= false
			end
	
		end

	else
	
		if Logic.GetWeatherState() == 3 and Logic.GetTimeToNextWeatherPeriod() > 3*60 then
		
			for i=1,3 do
				--ArmyTribalCamps[i].AttackAllowed = true
				ArmyTribalCamps[i].outerDefenseRange	=	20000
				ResetOffensiveAIController(ArmyTribalCamps[i])			
			end
		
			ArmyTribalCamps.attacking = true
		end
	
	end

end

function ControlArmyTribalCamps()

	if Counter.Tick2("ControlArmyTribalCamps", 10) then

		for i=1,3 do
	
			TickOffensiveAIController(ArmyTribalCamps[i])
				
		end
	
	end

end
