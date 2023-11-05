-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	Restablish Trade Routes
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()
	Report("start 1st quest")
	
	-- Start quests
	createQuestDefeat()
	createQuestVictory()
	createQuestRewards()
	createQuestTrader()
	--createQuestSulphur()
	createQuestKidnapper()
	
	--InitNPCLookAt("NPCSulphur")
	InitNPCLookAt("NPCKidnapper")
	--	briefing
	createBriefingPrelude()
end

-------------------------------------------------------------------------------------------------------------------------

end1stQuest = function()
	Report("end 1st quest")
	createBriefingHelpTownguard()
	InitNPCLookAt("cityguard_3")
end

-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
	Report("start 2nd quest")
	createBriefingSulphurQuest()
end

-------------------------------------------------------------------------------------------------------------------------

end2ndQuest = function()
  Report("End 2nd quest")
  if(talkedNPCSulphur == nil) then
  	DisableNpcMarker("NPCSulphur")
  else
  	ResolveBriefing(SulphurTraderQuest)
	end
	createBriefingSulphurFinished()
	SulphurQuestDone = 1
end

-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()
	Report("start 3rd quest")
	createBriefingKidnapperQuest()
	ResolveBriefing(PreludeTraderQuest)
end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()
	Report("End 3rd quest")
	if(talkedNPCKidnapper == nil) then
  	DisableNpcMarker("NPCKidnapper")
  else
  	ResolveBriefing(KidnapperTraderQuest)
	end
	--local ID = GetID("GateP4")
	--Logic.RotateEntity(ID, 180)
	--ReplaceEntity("GateP4", Entities.XDIronGrid3)
	--Logic.DestroyEntity(GetID("GateP4"))
	--Logic.CreateEntity(Entities.XD_IronGrid3,25718.5,31651.5,-126)	
	Move("Hostage", "PrincessRescuePoint")
	createBriefingHostageFreed()
	KidnapperQuestDone = 1
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

start4thQuest = function()
	Report("start 4th quest")
	ResolveBriefing(HelpTownguardQuest)
	createBriefingCityguardQuest()
	createQuestRobbersKilled()
	if HelpTownguardQuestB ~= nil then
		createQuestDestroyRock()
	end	
end

-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()
	Report("End 4th quest")
	createBriefingGraveyardCleansed()
	InitNPCLookAt("Helias")
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

start5thQuest = function()
	Report("start 5th quest")
	ResolveBriefing(HeliasQuest)
	createBriefingHelias()
	createArmyFortress()
end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()
	Report("End 5th quest")
	ResolveBriefing(HeliasQuest)
	StartCutscene("Outro", Victory)
end

-------------------------------------------------------------------------------------------------------------------------


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
	if _npcId == GetID("NPCSulphur") then
		-- already done
		if talkedNPCSulphur == nil then
			Report("Talked to Sulphur NPC")
			start2ndQuest()
			talkedNPCSulphur = true
			if talkedNPCKidnapper ~= nil then
				ResolveBriefing(PreludeTraderQuest)
				PreludeTraderQuest = nil
			end
		end
	elseif _npcId == GetID("NPCKidnapper") then
		-- already done
		if talkedNPCKidnapper == nil then
			Report("Talked to Kidnapper NPC")
			if talkedNPCSulphur ~= nil then
				ResolveBriefing(PreludeTraderQuest)
				PreludeTraderQuest = nil
			end
			start3rdQuest()
			talkedNPCKidnapper = true
		end
	elseif _npcId == GetID("cityguard_3") then
		-- already done
		if talkedNPCCityguard == nil then
			Report("Talked to Cityguard NPC")
			start4thQuest()
			talkedNPCCityguard = true
		end
	elseif _npcId == GetID("Helias") then
		-- already done
		if talkedHelias == nil then
			Report("Talked to Helias")
			start5thQuest()
			talkedHelias = true
		end
	elseif _npcId == GetID("Mary") then
		-- already done
		if talkedMary == nil then
			Report("Talked to Mary")
			ResolveBriefing(HeliasQuest)
			createBriefingMary()
			talkedMary = true
		end
	end
end