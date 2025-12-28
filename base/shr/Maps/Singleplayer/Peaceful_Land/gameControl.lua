-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	do what you want
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")
	
	EnableNpcMarker("merchant1")
	EnableNpcMarker("merchant2")
	EnableNpcMarker("merchant3")

	createArmySpawn()
	createArmyFriend()

	createBriefingPrelude()
	
	startQuestDefeat()
	startQuestVictory()

end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	Victory()

end	

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)
	if IsBriefingActive() then	
		return	
		end	
	if Logic.IsHero(_heroId) then
		if _npcId == GetEntityId("merchant1") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant1")
				createBriefingMerchant1()
				local job = {}		
				job.Tribute = 1
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									String.Key("tribute1"),
									ResourceType.Gold, 
									5000 )			
				job.Callback = TributePaid1
				SetupTributePaid(job)								
				end
			end
		if _npcId == GetEntityId("merchant2") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant2")
		    	createBriefingMerchant2()
				local job = {}		
				job.Tribute = 2
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									String.Key("tribute2"),
									ResourceType.Gold, 
									5000 )			
				job.Callback = TributePaid2
				SetupTributePaid(job)				
				end
			end
		if _npcId == GetEntityId("merchant3") then			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				DisableNpcMarker("merchant3")
				createBriefingMerchant3()
				local job = {}		
				job.Tribute = 3
				Logic.AddTribute(	GetHumanPlayer(), 
									job.Tribute,
									0,
									0,
									String.Key("tribute3"),
									ResourceType.Gold, 
									5000 )			
				job.Callback = TributePaid3
				SetupTributePaid(job)							
				end
			end
		end				
end


TributePaid1 = function()
	createArmyPlay()
	end
TributePaid2 = function()
	tribute2Paid = true
	CreateRandomChests(true)
	CreateRandomGoldChests(true)
	StartChestQuest()
	end
TributePaid3 = function()
	Logic.SetDiplomacyState( 2, 4, Diplomacy.Hostile )
	StartJob("ControlArmyFriend")
	end