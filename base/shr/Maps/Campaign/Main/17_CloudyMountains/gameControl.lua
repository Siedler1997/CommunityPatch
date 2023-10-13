-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	destroy blocking
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")
	
	StartCutscene("Intro")

	--	ai
	
	createPlayer2()
	createPlayer3()
	createPlayer5()
	createPlayer6()
	
	--	briefing

	InitNPCLookAt("Leonardo")
	InitNPCLookAt("Woodpecker")
	InitNPCLookAt("IronMan")
	InitNPCLookAt("GateNPC")
	
	--	quests
	
	createQuestDestroyStone()

--TK GateNPC runs away if GateHQ is already conquered
	createQuestGateHQ()
	
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

	--	briefing
	
	createBriefingPrelude()

	start2ndQuest()
	start3rdQuest()
end	

-------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	build up
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()

	Report("start 2nd quest")

	--	quests
	
	createQuestBuildUp()
	createQuestCountVCs()
	createQuestDefeat()
end

-------------------------------------------------------------------------------------------------------------------------

end2ndQuest = function()	

	Report("end 2nd quest")
	
	-- noch nicht gelöst ?
	if end2ndQuestDone == nil then
		
		end2ndQuestDone = true
		ResolveBriefing(BuildUpPage)
		
			--	briefing	
			if IsBriefingActive() ~= true then
				Report("Briefing ok")
	--			MapLocal_CameraPositionBackup()
				createBriefingOrb()
				start4thQuest()
	
			else
				Report("Briefing Delayed!!!")
				MapBriefing_Started = StartJob("DelayBriefing")
	
			end
	end
		
end
	
	----------------------------------------------------------------
	Condition_DelayBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
--		MapLocal_CameraPositionBackup()
			createBriefingOrb()
			start4thQuest()

		EndJob(MapBriefing_Started)

	end
	

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	destroy east blocking
--
-------------------------------------------------------------------------------------------------------------------------


start3rdQuest = function()

	Report("start 3rd quest")

	--	quests
	
	createQuestDestroyBlocking()

end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")

	ResolveBriefing(EastBlockingPage)
	ResolveBriefing(SouthBlockingPage)

	CreateBriefingStoneValley()

	-- Enable stone valley npc
	EnableNpcMarker("Major")
end


-------------------------------------------------------------------------------------------------------------------------
--
--									4th Quest:	snow
--
-------------------------------------------------------------------------------------------------------------------------

start4thQuest = function()
				
	Report("start 4th quest")				
			
	--	quests
	
	createQuestSnow()

end

-------------------------------------------------------------------------------------------------------------------------
	
end4thQuest = function()	
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(3, true)
		ResearchAllMilitaryTechs(4, true)
		ResearchAllMilitaryTechs(5, true)
	end

	Report("end 4th quest")

	start5thQuest()
	start6thQuest()

	ResolveBriefing(SeeExplorationPage)
	ResolveBriefing(SnowQuestPage)
	
end
		
-------------------------------------------------------------------------------------------------------------------------
--
--									5th Quest:	Find orb
--
-------------------------------------------------------------------------------------------------------------------------

start5thQuest = function()
				
	Report("start 5th quest")				
			
	--	ai
	
	setupArmyAI2()
	
	--	quests
	
	createQuestFindOrb()

	-- Enable BuildUpNPC
--	InitNPC("BuildUpNPC")
--	SetNPCLookAtTarget("BuildUpNPC",1)
--	SetNPCWaypoints("RainNPC", "RainNPCMove", 10)
--	EnableNpcMarker("BuildUpNPC")

--	EnableNpcMarker("Banned_Info_NPC")
--	InitNPC("Banned_Info_NPC")
--	SetNPCLookAtTarget("BuildUpNPC",1)

end

-------------------------------------------------------------------------------------------------------------------------
	
end5thQuest = function()	

	Report("end 5th quest")

	ResolveBriefing(FindOrbPage)
	
	StartCutscene("MissionComplete")

	Victory()
end
		


			
-------------------------------------------------------------------------------------------------------------------------
--
--									6th Quest:	buy orb
--
-------------------------------------------------------------------------------------------------------------------------

start6thQuest = function()
				
	Report("start 6th quest")				

	--	briefing
	
	createBriefingSnow()
			
	--	quests
	
	createQuestBuyOrb()

end

-------------------------------------------------------------------------------------------------------------------------
	
end6thQuest = function()	

	Report("end 6th quest")

	ResolveBriefing(FindOrbPage)
	
	StartCutscene("MissionComplete")


	Victory()
end
		
		
-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	stone valley
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

	--	briefing
		
	createBriefingStoneValleyMajor()

	--	quest

	createQuestStoneValley()
		
	-- Resolve info

	ResolveBriefing(MajorInfoPage)
end

end1stSubQuest = function()

	Report("end 1st sub quest")

	--	Open gate
	
	DestroyEntity("Gate1")
	Report("Replace Gate")
	
	ReplaceEntity("openGate", Entities.XD_WallStraightGate_Closed)



	--	briefing
	
	createBriefingKey()
	
	ResolveBriefing(StoneValleyQuestPage)
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	MapLocal_npcCheck(_heroId,_npcId)

	if _npcId == GetID("Major") then

		if talkedToMajorNPC == nil then

			start1stSubQuest()
			
			talkedToMajorNPC = true
		end
		
	elseif _npcId == GetID("GateNPC") then

		if talkedToGateNPC == nil then
		
			talkedToGateNPC = true
			createBriefingGate()
			
		end
		
	elseif _npcId == GetID("IronMan") then

		if talkedToIronMan == nil then
		
			talkedToIronMan = true
			createBriefingIronMan()
			createQuestIronManTribute()
			DisableNpcMarker("IronMan")
			
		end
	elseif _npcId == GetID("Woodpecker") then

		if talkedToWoodpecker == nil then
		
			talkedToWoodpecker = true
			--DisableNpcMarker("Woodpecker")
			createBriefingWoodpecker()
			--local ID = GetID("Woodpecker")
			--MoveAndVanish(ID,"WoodpeckerExit")
			
		end
		
	end
end

