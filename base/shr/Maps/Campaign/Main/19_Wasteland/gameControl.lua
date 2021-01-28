-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	reach mountain fortress(expedition)
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	--	ai
	
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer5()
	createPlayer6()
	--createPlayer7()
	
	--	briefing
	

--	createBriefingMapStart()
	
	--	quests
	
--	createQuestReachMountainFortress()
--	StartCutscene("Intro", createBriefingMapStart)

	start2ndQuest() 
	start4thQuest()
	start6thQuest()
	createQuestBuildAlchemy()
	
--	EnableNpcMarker("weathermaster")
	EnableNpcMarker("weathermaster_off")
	EnableNpcMarker("Fugitive")

--	StartCutscene("Intro", createBriefingMapStart)
	StartCutscene("Intro")
	
	
end

end1stQuest = function()
--	obsolete
--	ResolveBriefing(briefingMapStart[2])
	Report("end 1st quest")
end	


-------------------------------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	Free village in the swamp(snow)
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
				
	Report("start 2nd quest")				
			
	--	briefing
	
--	createBriefingPrelude()

	Logic.ChangeAllEntitiesPlayerID(7, 1)

		-- Attach soldiers
		local i
		for i=1,3 do
			Tools.AttachSoldiersToLeader("P1_Leader"..i, 4)
		end

--		briefingPrelude.refugee = GetID("NPC_Prelude")
--		EnableNpcMarker("NPC_Prelude")

	--	quests
	
--	createQuestSnow() SnowQuest erst nach SwampQuest

	-- Enable BuildUpNPC
	InitNPCLookAt("BuildUpNPC")
	SetNPCLookAtTarget("BuildUpNPC",1)
	EnableNpcMarker("BuildUpNPC")

	InitNPCLookAt("Banned_Info_NPC")
	SetNPCLookAtTarget("Banned_Info_NPC",1)
	EnableNpcMarker("Banned_Info_NPC")

	end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()	

	Report("end 2nd quest")

--	ResolveBriefing(briefingPrelude[3])

	VillageDone()
	
	DisableNpcMarker("Banned_Info_NPC")
	
	-- Let serf run to heroes
	EnableNpcMarker("SnowNPC")

	-- Start npc near tree
	InitNPCLookAt("RainNPC")
	SetNPCLookAtTarget("RainNPC",1)
	SetNPCWaypoints("RainNPC", "RainNPCMove", 10)
	EnableNpcMarker("RainNPC")

	-- Give resources to player
	Tools.GiveResouces(gvMission.PlayerID, 1000, 1000, 1000, 1000, 1000, 1000)

	start3rdQuest()
end
			

-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	Bring life to tree(rain)
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()

	Report("start 3rd quest")

	--	quests
	
--RainQuest erst, nachdem Spieler mit Serf geredet hat
--		createQuestRain()
--	

	-- Show dry village briefing
	createBriefingDryVillage()


end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")

	ResolveBriefing(briefingDryVillage[2])
		
	
	briefingRainFinished()
		
	-- Replace tree
	ReplaceEntity("DeadTree", Entities.XD_TreeEvelance1)
		
	-- Player 4 joins
	Logic.ChangeAllEntitiesPlayerID(4, 1)
	
	VillageDone()
end


-------------------------------------------------------------------------------------------------------------------------
--
--									4th Quest:	Rescue villagers(Rescue)
--
-------------------------------------------------------------------------------------------------------------------------


start4thQuest = function()

	Report("start 4th quest")

	--	quests
	
	createQuestRescueVillagers()

end

-------------------------------------------------------------------------------------------------------------------------

end4thQuest = function()	

	Report("end 4th quest")

	-- Village done
	VillageDone()

--	ResolveBriefing(briefingPrelude[4])

-- TK kopplung an BuildupQuest raus
--	if talkedToBuildUpNPC == nil then
--		start5thQuest()
--	end
end


-------------------------------------------------------------------------------------------------------------------------
--
--									5th Quest:	Buildup Village(Expansion)
--
-------------------------------------------------------------------------------------------------------------------------


start5thQuest = function()

	Report("start 5th quest")

	--	quests
	
	createQuestBuildUpVillage()

	-- 	briefing
	createBriefingBuildUp()

end

-------------------------------------------------------------------------------------------------------------------------

end5thQuest = function()	

	Report("end 5th quest")

	-- Village done
	VillageDone()

	-- Build up done
	buildUpDone = true
	
	-- Change player
	Logic.ChangeAllEntitiesPlayerID(6, 1)
	
	ResolveBriefing(briefingBuildUp[2])
	
	end


-------------------------------------------------------------------------------------------------------------------------
--
--									6th Quest:	Search Allies (alle 4 Dörfer befreien)
--
-------------------------------------------------------------------------------------------------------------------------


start6thQuest = function()

	Report("start 6th quest")

	--	quests
	
	createQuestSearchAllies()



end

-------------------------------------------------------------------------------------------------------------------------

end6thQuest = function()	

	Report("end 6th quest")
	SearchAlliesDone()
	
	end

-------------------------------------------------------------------------------------------------------------------------

VillageDone = function()

	-- No counter
	if VillageDoneCount == nil then
		VillageDoneCount = 1
	else
		VillageDoneCount = VillageDoneCount + 1
	end

	Logic.SetSubQuestDoneFlag(	1,	6,	(VillageDoneCount-1),	1,	1) 

	-- All four rescued mission is done
	if VillageDoneCount == 4 then
			
		end6thQuest()	
		StartCutscene("MissionComplete")	
		Victory()
	end
end

-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	Weather Master.
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

	--	quest

	createQuestWeatherMaster()
		
	--	briefing
		
	createBriefingWeatherMaster()
end

end1stSubQuest = function()

	Report("end 1st sub quest")

	-- Let it snow
	Logic.AddWeatherElement(3, 1000000000, 0, 3, 5, 10)
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	MapLocal_npcCheck(_heroId,_npcId)

	-- Hero is talking to build up npc

	if _npcId == GetID("BuildUpNPC") then

		-- already done
		if talkedToBuildUpNPC == nil then

			-- Build up briefing...quest must be generated seperatly
			start5thQuest()
			
			talkedToBuildUpNPC = true
		end
		
	elseif _npcId == GetID("RainNPC") then	

		-- already done
		if talkedToRainNPC == nil then

			-- Rain briefing...quest must be generated seperatly
			createBriefingRain(_heroId)
			createQuestRain()
			talkedToRainNPC = true
		end
		
	elseif _npcId == GetID("Banned_Info_NPC") then	

		-- already done
		if talkedToSwampNPC == nil then

			-- Rain briefing...quest must be generated seperatly
			createBriefingSwamp()
			
			talkedToSwampNPC = true
		end

	elseif _npcId == GetID("Fugitive") then	

		-- already done
		if talkedToFugitiveNPC == nil then

			-- Rain briefing...quest must be generated seperatly
			createBriefingFugitive()
			
			talkedToFugitiveNPC = true
		end
		
	elseif _npcId == GetID("weathermaster") then	

		-- already done
		if talkedToWeatherMasterNPC == nil then

			-- Rain briefing...quest must be generated seperatly
			start1stSubQuest()
			
			talkedToWeatherMasterNPC = true
		end
		
	elseif _npcId == GetID("weathermaster_off") then	

		-- already done
		if talkedToWeatherMasterOffNPC == nil then

			createBriefingWeatherMasterOff()
			talkedToWeatherMasterOffNPC = true

		end
		
	end
end


	