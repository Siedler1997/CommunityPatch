
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
				experiencePoints 	= MEDIUM_EXPERIENCE,
			}			
	
			Move(CreateTroop(army,troopDescription),"deployEnd1")
			Move(CreateTroop(army,troopDescription),"deployEnd1b")

		--	army 2

			army.position	=	GetPosition("deployStart2")
			
			local troopDescription = {
			
				leaderType 			= Entities.PU_LeaderSword4,
				maxNumberOfSoldiers	= 9,
				minNumberOfSolderis	= 9,
				experiencePoints 	= MEDIUM_EXPERIENCE,
			}			
	
			Move(CreateTroop(army,troopDescription),"deployEnd2")
			Move(CreateTroop(army,troopDescription),"deployEnd2b")
	
	end
-----------------------------------------------------------------------------------------------------------------------	




createQuestReinforcements2 = function()

	reinforcements2 = 60 * 4

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
		experiencePoints 	= MEDIUM_EXPERIENCE,
	}			

--	troopDescription.leaderType = Entities.Entities.PV_Cannon4
	troopDescription.leaderType = Entities.PV_Cannon4

	Move(CreateTroop(army,troopDescription),"supportB1")
	Move(CreateTroop(army,troopDescription),"supportB2")
	Move(CreateTroop(army,troopDescription),"supportB3")
	Move(CreateTroop(army,troopDescription),"supportB4")

	troopDescription.leaderType = Entities.PU_LeaderHeavyCavalry2

	Move(CreateTroop(army,troopDescription),"supportB5")
	Move(CreateTroop(army,troopDescription),"supportB6")
	Move(CreateTroop(army,troopDescription),"supportB7")
	Move(CreateTroop(army,troopDescription),"supportB8")

	troopDescription.leaderType = Entities.PU_LeaderBow4

	Move(CreateTroop(army,troopDescription),"supportB5")
	Move(CreateTroop(army,troopDescription),"supportB6")
	Move(CreateTroop(army,troopDescription),"supportB7")
	Move(CreateTroop(army,troopDescription),"supportB8")


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
