-------------------------------------------------------------------------------------------------------------------------
--
--									start1stCutscene
--
-------------------------------------------------------------------------------------------------------------------------

start1stCutscene = function()

		Report("start 1st cutscene")


	-- Create NPCs	TF_Include!
		InitMapNPCs() 					--MapLocal_CreateNPCs()

	-- start Intro and continue with first quest
		StartCutscene("Intro", end1stCutscene)

	end



end1stCutscene = function()

	Report("end 1st cutscene")

	start1stQuest()

end

-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Destroy enemy building (castle of countess)
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

		Move("npcPilgrim","PlayerPosition")

	--	briefing

		createBriefingPrelude()
		
	--	quest

		startQuestBandits()
	
		startQuestDefeat()

		startQuestSearchPilgrim()

		startQuestSearchHelias()
		
		startQuestDestroyCastle()
		
		if CP_Difficulty < 2 then
			startQuestMerchant1()
		end
		
		startQuestNpcPilgrim()
		
		startQuestStoneRun()
		
		InitNPCLookAt("npc1")
		InitNPCLookAt("npc2")
		InitNPCLookAt("npc3")
		
	--	ai
		
		createArmySouthernAssault()
		
		createArmyFirstLineDefenders()
		
		createArmyMainForce()

	end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	ResolveBriefing(briefingPrelude[page_briefingPreludeQuest])

	if page_briefingBanditQuest ~= nil and page_briefingBanditQuest > 0 then
		ResolveBriefing(briefingBandits[page_briefingBanditQuest])
	end

	if page_briefingHeliasQuest ~= nil and page_briefingHeliasQuest > 0 then
		ResolveBriefing(briefingHelias[page_briefingHeliasQuest])
	end


	StartCutscene("MissionComplete", Victory)
	
	-- Victory()

end	

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)


	--	which hero is selected?
	
		if Logic.IsHero(_heroId) and IsBriefingActive() == false then



			if _npcId == GetEntityId("npcPilgrim") then
			
				endQuestNpcPilgrim()
				
			end
				
				
		
			if IsAlive("npc1") then
			
				if _npcId == GetEntityId("npc1") then
				
					createBriefingNpc1()
					
				end
			end
			

			if IsAlive("npc2") then

				if _npcId == GetEntityId("npc2") then
				
					createBriefingNpc2()
					
				end
			end
		
		
		
			if IsAlive("npc3") then

				if _npcId == GetEntityId("npc3") then
				
					createBriefingNpc3()
					
				end
			end
			
			

			if _npcId == GetEntityId("merchant1") then
			
				endQuestMerchant1()
				
				end
		
			if npc_pilgrim == nil and _npcId == GetEntityId("Pilgrim") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
					npc_pilgrim = 1
				
					createBriefingPilgrim()
				
					endQuestSearchPilgrim()
				
					end
					
				end


			if npc_helias == nil and _npcId == GetEntityId("Helias") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
					npc_helias = 1

					createBriefingHelias()
				
					endQuestSearchHelias()
				
					end
					
				end


			if npc_banditLeader == nil and _npcId == GetEntityId("banditLeader") then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

					npc_banditLeader = 1
				
					createBriefingBandits()
				
					createQuestHireTroops()
				
					endQuestBandits()
				
					end
					
				end
		
			end	

	----------------------------------------------------------------------------------------
	--	Tipp-giving NPCs without quests; TF_include

		MapLocal_npcCheck(_heroId,_npcId)

	----------------------------------------------------------------------------------------


	end