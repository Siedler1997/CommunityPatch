-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Destroy Outpost
--
-------------------------------------------------------------------------------------------------------------------------

startQuestDestroyOutpost = function()

	Report("start quest: destroy outpost")

	--	ai
	
		createArmyAttack1()

		createArmyAttack2()
		
		createArmyMinePatrol()

		createArmyDefendMines()

		setupArmyKerberosDefense()

	--	quest
	
		createQuestDestroyLionsDen()

		createQuestReachWeatherMachine()
		createQuestWeatherMaker()
		
		createQuestDefeat()
		
		createQuestDestroyOutpost()
		
		createQuestTrader1()
		createQuestTrader2()
		createQuestTrader3()
	
		createQuestReinforcements()
		
		createQuestWetCannons()

		createQuestRewards()

		--Kerberos starts using his weather tower after 15 minutes to drown player armies
		if CP_Difficulty > 0 then
			StartCountdown(15 * 60, createQuestEnemyWeather, false)
		end

	-- NPCs

		InitMapNPCs()

		InitNPCLookAt("Miner1")
	

	--	briefing

		createBriefingPrelude()

		StartCountdown(15 * 60, createPlayer4, false)

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestDestroyOutpost = function()

	startQuestDestroyLionsDen()

	ResolveBriefing(briefingPrelude[page_preludeOutpost])

	end

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest:	Destroy Lions Den
--
-------------------------------------------------------------------------------------------------------------------------

startQuestDestroyLionsDen = function()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(3, true)
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(5, true)
		ResearchAllMilitaryTechs(7, true)
		ResearchAllMilitaryTechs(8, true)
	end

	Report("start quest: destroy lions den")

	--	change player ids
	
--		Logic.ChangeAllEntitiesPlayerID(4,GetHumanPlayer())

		--createQuestReinforcements2()

	--	ai
	
		createArmyDefendDen()
	
		createArmyAttack3()
		
		Logic.SetDiplomacyState( 1, 5, Diplomacy.Hostile )
		Logic.SetPlayerName(5, String.MainKey.."_Player5Name")

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestDestroyLionsDen = function()

	ResolveBriefing(briefingPrelude[page_preludeCastle])

	-- start Kerberos' history fresco
		StartBinkVideo("BattleOfEvelance") 

	-- Extro
		StartBinkVideo("Outro")

	Victory()

end
	
-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	-- Ignore if running briefing
	if IsBriefingActive() then
		return
	end

	if Logic.IsHero(_heroId) then
	
		if _npcId == GetEntityId("trader1") then

			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				createBriefingTrader1()
			
				destroyQuestTrader1()
				
			end
	
		end

		if _npcId == GetEntityId("trader2") then

			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				createBriefingTrader2()
			
				destroyQuestTrader2()
				
			end
	
		end

		if _npcId == GetEntityId("trader3") then

			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				createBriefingTrader3()
			
				destroyQuestTrader3()
				
			end
	
		end

	
		if _npcId == GetEntityId("WeatherMaker") then

			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				createBriefingWeatherMaker()
			
				destroyQuestWeatherMaker()
				
			end
	
		end
	

	-- NPCs giving hints:

    
	    local NPC = "Miner1"
	    if _npcId == GetEntityId(NPC) then
	
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
			
				createBriefingMiner1()
				DisableNpcMarker(NPC)
				
			end
		end


	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------

	end
end