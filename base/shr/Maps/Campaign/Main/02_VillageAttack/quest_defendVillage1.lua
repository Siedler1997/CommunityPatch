
createQuestDefendVillage1 = function()

	local Job1 = {}
	
	Job1.Tribute = 003

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."tribute_NorthVillageTrade", 
						ResourceType.Gold, 
						500 )

	Job1.SpawnPlayer	= 4

	Job1.Spawn 			=	{ 	{	Pos 		= "stables", 
									LeaderType 	= Entities.PU_LeaderPoleArm3, 
									Soldiers 	= 8,
									AttackRalleypoint	= "deploy1A"
								},
								{ 	Pos 		= "stables", 
									LeaderType 	= Entities.PU_LeaderPoleArm3, 
									Soldiers 	= 8,
									AttackRalleypoint	= "deploy1B"
								},
								{	Pos 		= "stables", 
									LeaderType 	= Entities.PU_LeaderBow3, 
									Soldiers 	= 8,
									AttackRalleypoint	= "deploy1C"
								},
								{ 	Pos 		= "stables", 
									LeaderType 	= Entities.PU_LeaderBow3, 
									Soldiers 	= 8,
									AttackRalleypoint	= "deploy1D"
								}							
							}
					
	Job1.Callback 	= TributePaidVillage1

	SetupTributePaid(Job1)

end




destroyQuestDefendVillage1 = function()

end




	
TributePaidVillage1 = function()
	
	--TFToDo Briefing einbauen. Zeigen, wie Soldaten kommen

	if IsBriefingActive() ~= true then

		createBriefingVillageArmy()

	else

		MapMayorBriefing_Started = StartJob("Condition_DelayMayorBriefing")

	end
	
	
	
	return true
	
	end




	----------------------------------------------------------------
	Condition_DelayMayorBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             



                                                                    
	----------------------------------------------------------------
	Action_DelayMayorBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingVillageArmy()
	
		EndJob(MapMayorBriefing_Started)

	end
