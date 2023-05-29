-------------------------------------------------------------------------------------------------------------------------
--
--									Quest Tower 1:	Establish 2 Towers
--
-------------------------------------------------------------------------------------------------------------------------

startQuestTower1 = function()

	Report("start quest: tower 1")

	-- Create NPCs
	
		InitMapNPCs() 					

	--	ai
	
		createArmyDefenders1()
		createArmyDefenders2()

		createArmyResources1()
		createArmyResources2()

		createArmySwamp1()
		createArmySwamp2()

	--	misc

		burnVillage()

	--	quests-

		createQuestReachTownExit()
		createQuestTower1()
		-- createQuestDefeat()		-- will be started after intial briefings as player has no HQ at beginnning, yet


	-- traders
		createQuestTrader1()
		createQuestTrader2()
		createQuestTrader3()


	--	briefing
	
		createBriefingTower1()

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestTower1 = function()

	Report("end quest: tower 1")

	ResolveBriefing(briefingTower1[page_tower1])

	startQuestTower2()

	end	

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest Tower 2:	Establish 2 Towers
--
-------------------------------------------------------------------------------------------------------------------------

startQuestTower2 = function()

	Report("start quest: tower 2")

	--	ai
	
		createArmyTower1()

	--	quest

		createQuestTower2()

	--	briefing
	
		createBriefingTower2()

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestTower2 = function()

	Report("end quest: tower 2")

	ResolveBriefing(briefingTower2[page_tower2])
	
	startQuestTower3()

	end	

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest Tower 3:	Establish 2 Towers
--
-------------------------------------------------------------------------------------------------------------------------

startQuestTower3 = function()

	Report("start quest: tower 3")

	--	ai
	
		createArmyTower2()

	--	quest

		createQuestTower3()

	--	briefing
	
		createBriefingTower3()

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestTower3 = function()

	Report("end quest: tower 3")

	ResolveBriefing(briefingTower3[page_tower3])

	startQuestDestroyKerberos()

	end	

-------------------------------------------------------------------------------------------------------------------------
--
--									Quest: Destroy Kerberos
--
-------------------------------------------------------------------------------------------------------------------------

startQuestDestroyKerberos = function()

	Report("start quest: destroy kerberos")

	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(5, true)
		ResearchAllMilitaryTechs(6, true)
	end
	
	Logic.SetShareExplorationWithPlayerFlag(1, 2, 1)

	--	ai
	
		createArmyEnemyCastle()

	--	quest

		createQuestRegent()
		createQuestBishop()
		createQuestLeo()
		createQuestEscapingBishop()
		createQuestDestroyKerberos()
		createQuestTraderNorth()
		createQuestTraderEast()

	--	briefing
	
		createBriefingDestroyKerberos()

	end

-------------------------------------------------------------------------------------------------------------------------
	
endQuestDestroyKerberos = function()

	Report("end quest: destroy kerberos")
	
	StartCutscene("CutsceneComplete", theEnd)

end



theEnd = function()
	
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


	if Logic.IsHero(_heroId) and IsBriefingActive() == false then

		if _npcId == GetEntityId("traderN") then

			createBriefingTraderNorthDialog()
			
			destroyQuestTraderNorth()

		end	


		if _npcId == GetEntityId("traderE") then

			createBriefingTraderEastDialog()

			destroyQuestTraderEast()

		end	


		if _npcId == GetEntityId("leo") then

			createBriefingLeoDialog()

			destroyQuestLeo()

		end	


		if _npcId == GetEntityId("regent") then

			createBriefingRegentDialog()

--			createBriefingHeliasAmulett()

			destroyQuestRegent()

		end	


		if IsAlive("bishop") then
			if _npcId == GetEntityId("bishop") and escapingBishopIsActive == nil then
	    
				createBriefingBishopDialog()
	    
				destroyQuestBishop()
	    
			end	
		end


		-- town guard		
		if IsAlive("Guardian"..talkToGuard) then

			if _npcId == GetEntityId("Guardian"..talkToGuard) and escapingBishopIsActive == nil then
	
				createBriefingReachTownExit()
	
				destroyQuestReachTownExit()
	
			end	
    	end

		if _npcId == GetEntityId("Trader1") then
		
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				StartBriefing(briefingTrader1)
			
				destroyQuestTrader1()					

			end
					
		end

		if _npcId == GetEntityId("Trader2") then
		
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				StartBriefing(briefingTrader2)
			
				destroyQuestTrader2()					

			end
					
		end

		if _npcId == GetEntityId("Trader3") then
		
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				StartBriefing(briefingTrader3)
			
				destroyQuestTrader3()					

			end
					
		end




	end


	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------


end