
createQuestHireTroops = function()

	local Job = {}
	
	Job.Tribute = 001

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops1", 
						ResourceType.Iron, 
						300 )
	
	Job.Ralleypoint	= "Dario"
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword1, 
							Soldiers 	= 4
						}
					}

	Job.Callback 	= TributePaid

	SetupTributePaid(Job)
	
end



--------------------------------------------------------------------	
TributePaid = function()
	
	-- TFToDo Cutscene / briefing rein

	end1stSubQuest()
	

	-- TF>
	local Job = {}
	
	Job.Tribute = 002

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops2", 
						ResourceType.Iron, 
						700 )
	
	Job.Ralleypoint	= "Dario"
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword2, 
							Soldiers 	= 4
						}
					}
	
	if CP_Difficulty == 0 then
		Job.Callback 	= TributePaid2
	else
		Job.Callback 	= TributePaid3
	end

	SetupTributePaid(Job)
	--<
	
	return true
	
end


--------------------------------------------------------------------	
TributePaid2 = function()
	
	-- TF>
	local Job = {}
	
	Job.Tribute = 003

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops3", 
						ResourceType.Iron, 
						1000 )
	
	Job.Ralleypoint	= "Dario"
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword3, 
							Soldiers 	= 4
						}
					}

	Job.Callback 	= TributePaid3

	SetupTributePaid(Job)
	--<
	
	return true
	
end	
	

--------------------------------------------------------------------	
TributePaid3 = function()

	return true

end	
