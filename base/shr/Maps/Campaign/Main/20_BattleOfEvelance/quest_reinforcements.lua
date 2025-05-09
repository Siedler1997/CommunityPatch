
REINFORCEMENT_DELAY = 15 * 60			-- 20
-------

createQuestReinforcements = function()

	StartJob("QuestReinforcements")

	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestReinforcements"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestReinforcements = function()
	-------------------------------------------------------------------------------------------------------------------

		local fireEvent = Counter.Tick2("QuestReinforments", REINFORCEMENT_DELAY)		
		local tick = Counter.GetTick("QuestReinforments")
		local limit = Counter.GetLimit("QuestReinforments")

		if tick == limit * 0.9 then
		

			SpokenMessage(String.MainKey.."Message_ReinforcementClose")
--			Message("Reinforcements are close!")
			
			end

		if tick == limit * 0.5 then
	
			SpokenMessage(String.MainKey.."Message_ReinforcementCloser")
		
--			Message("Reinforcements are coming closer...")
			
			end
				
		return fireEvent
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestReinforcements = function()
	-------------------------------------------------------------------------------------------------------------------

		--	briefing	
		if IsBriefingActive() ~= true then
		    CreateReinforcement()
		else
			Reinforcement_Started = StartJob("DelayBriefingReinforcement")
		end

		return true

	end

	
		----------------------------------------------------------------
		Condition_DelayBriefingReinforcement = function()                               
		----------------------------------------------------------------
			                                                                   
			if IsBriefingActive() ~= true then
			                                                            
				return true
			end
		
			return false
					                                                            
		end                                                             
		                                                                    
		----------------------------------------------------------------
		Action_DelayBriefingReinforcement = function()                                  
		----------------------------------------------------------------
			                                                            
		    CreateReinforcement()
			createQuestReinforcements2()
			EndJob(Reinforcement_Started)
		
		end



	-------------------------------------------------------------------------------------------------------------------
	CreateReinforcement = function()
	-------------------------------------------------------------------------------------------------------------------


		--	check if briefing is active
		if IsBriefingActive() ~= true then
			createBriefingReinforcementArrives()
		else
			Reinforcement1Briefing_Started = StartJob("DelayBriefingReinforcement1")
		end
	
--		Message("Reinforcements arriving!")

		ResolveBriefing(briefingPrelude[page_preludeReinforcements])

		local army = {}
		
		--	army 1
		
			army.player 	= 	GetHumanPlayer()
			army.id			=	1
			army.position	=	GetPosition("deployStart1")
			
			local troopDescription = {
			
				leaderType 			= Entities.PU_LeaderBow4,
				maxNumberOfSoldiers	= 9,
				minNumberOfSolderis	= 9,
				experiencePoints 	= VERYHIGH_EXPERIENCE-CP_Difficulty,
			}			
	
			Move(CreateTroop(army,troopDescription),"deployEnd1")
			Move(CreateTroop(army,troopDescription),"deployEnd1b")

		--	army 2

			army.position	=	GetPosition("deployStart2")
			
			local troopDescription = {
			
				leaderType 			= Entities.PU_LeaderSword4,
				maxNumberOfSoldiers	= 9,
				minNumberOfSolderis	= 9,
				experiencePoints 	= VERYHIGH_EXPERIENCE-CP_Difficulty,
			}			
	
			Move(CreateTroop(army,troopDescription),"deployEnd2")
			Move(CreateTroop(army,troopDescription),"deployEnd2b")
	
	end
-----------------------------------------------------------------------------------------------------------------------	




createQuestReinforcements2 = function()

	reinforcements2 = 60 * 60 * 2

	StartJob("QuestReinforcements2")

	end

Condition_QuestReinforcements2 = function()
	reinforcements2 = reinforcements2 -1
	return reinforcements2 <= 0 and IsBriefingActive() == false
	end
Action_QuestReinforcements2 = function()

	army = {}
	army.player 	= 	GetHumanPlayer()
	army.id			=	1
	army.position	=	GetPosition("supportA")
	
	local troopDescription = {
	
		leaderType 			= Entities.PV_Cannon4,
		maxNumberOfSoldiers	= 9,
		minNumberOfSolderis	= 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE-CP_Difficulty,
	}			

--	troopDescription.leaderType = Entities.Entities.PV_Cannon4
	troopDescription.leaderType = Entities.PV_Cannon4
	Move(CreateTroop(army,troopDescription),"supportB1")
	Move(CreateTroop(army,troopDescription),"supportB2")

	troopDescription.leaderType = Entities.PU_LeaderSword4
	Move(CreateTroop(army,troopDescription),"supportB5")
	Move(CreateTroop(army,troopDescription),"supportB6")
	--Move(CreateTroop(army,troopDescription),"supportB7")
	--Move(CreateTroop(army,troopDescription),"supportB8")
	
	troopDescription.leaderType = Entities.PU_LeaderBow4
	Move(CreateTroop(army,troopDescription),"supportB13")
	Move(CreateTroop(army,troopDescription),"supportB14")
	
	--second part
	army.position	=	GetPosition("supportA2")
	troopDescription.leaderType = Entities.PV_Cannon4
	Move(CreateTroop(army,troopDescription),"supportB3")
	Move(CreateTroop(army,troopDescription),"supportB4")

	troopDescription.leaderType = Entities.PU_LeaderBow4
	Move(CreateTroop(army,troopDescription),"supportB9")
	Move(CreateTroop(army,troopDescription),"supportB10")

	troopDescription.leaderType = Entities.PU_LeaderPoleArm4
	Move(CreateTroop(army,troopDescription),"supportB11")
	Move(CreateTroop(army,troopDescription),"supportB12")

	SetEntityName(Logic.CreateEntity(Entities.PU_Serf, 29735, 2640, 0, 1), "supportSerf1")
	SetEntityName(Logic.CreateEntity(Entities.PU_Serf, 29500, 2625, 0, 1), "supportSerf2")
	SetEntityName(Logic.CreateEntity(Entities.PU_Serf, 29630, 2740, 0, 1), "supportSerf3")
	SetEntityName(Logic.CreateEntity(Entities.PU_Serf, 29620, 2510, 0, 1), "supportSerf4")
	LookAt("supportSerf1", "supportSerf2")
	LookAt("supportSerf2", "supportSerf1")
	LookAt("supportSerf3", "supportSerf4")
	LookAt("supportSerf4", "supportSerf3")
	
	CreateEntity(1, Entities.PU_Hero1, GetPosition("supportA2"), "Dovbar")
	Move("Dovbar","supportB0")
    gvGUI.BonusHeroId = GetEntityId("Dovbar")

	--	check if briefing is active
	if IsBriefingActive() ~= true then
		createBriefingReinforcementArrives2()
	else
		Reinforcement2Briefing_Started = StartJob("DelayBriefingReinforcement2")
	end
	
	return true
	end




	----------------------------------------------------------------
	Condition_DelayBriefingReinforcement1 = function()                               
	----------------------------------------------------------------
		if IsBriefingActive() ~= true then
			return true
		end
		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingReinforcement1 = function()                                  
	----------------------------------------------------------------
		createBriefingReinforcementArrives()
		EndJob(Reinforcement1Briefing_Started)
	end






	----------------------------------------------------------------
	Condition_DelayBriefingReinforcement2 = function()                               
	----------------------------------------------------------------
		if IsBriefingActive() ~= true then
			return true
		end
		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingReinforcement2 = function()                                  
	----------------------------------------------------------------
		createBriefingReinforcementArrives2()
		EndJob(Reinforcement2Briefing_Started)
	end
