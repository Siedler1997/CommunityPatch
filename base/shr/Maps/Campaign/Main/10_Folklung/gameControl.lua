-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Restablish Trade Routes
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()
	Report("start 1st quest")

	--	briefing
	createBriefingPrelude()

	--Lost "Quest"
	createQuestDefeat()
	createQuestMilitaryWon()
	
	start2ndQuest()
end

-------------------------------------------------------------------------------------------------------------------------

end1stQuest = function()
	Report("end 1st quest")
	
	FolklungWon()
end

-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
	Report("start 2nd quest")
	
	-- Main Quest-Stream
	createQuestReachFolklung()
end

-------------------------------------------------------------------------------------------------------------------------

end2ndQuest = function()
  Report("End 2nd quest")
  ResolveBriefing(PreludeFolklungCity)
  createBriefingFolklungReached()
  start3rdQuest()
end

-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()
	Report("start 3rd quest")
	createQuestReachFolklungCastle()
end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()
	Report("End 3rd quest")
	ResolveBriefing(QuestFolklungCastle)	
	StartCutscene("Cutscene1", createBriefingFolklungCastleReached)
	if CP_Difficulty < 2 then
		start4thQuest()
	end
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

start4thQuest = function()
	Report("start 4th quest")
	createQuestDestroyRock()
end

-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()
	Report("End 4th quest")
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

start5thQuest = function()
	Report("start 5th quest")
	createQuestCaptureEnemyLeader()
end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()
	Report("End 5th quest")
	FolklungWon()
end

-------------------------------------------------------------------------------------------------------------------------


FolklungWon = function()
	if FreeLeaderJob ~= nil then
		if FreeLeaderJob ~= 0 then
			EndJob(FreeLeaderJob)
			FreeLeaderJob = 0
		end
	end
	EndJob(DefeatQuest)
	DisableArmyBesiegerA()
	DisableArmyPlayerAttack()
	DisableArmyDefendBase()
	StartCutscene("MissionComplete", Victory)
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

	-- Hero is talking to build up npc
	if _npcId == GetID("SwampNPC") then
		-- already done
		if talkedSwampNPC == nil then
			Report("Talked to Swamp NPC")
			createBriefingSwampNPC()
			talkedSwampNPC = true
		end
	end
end