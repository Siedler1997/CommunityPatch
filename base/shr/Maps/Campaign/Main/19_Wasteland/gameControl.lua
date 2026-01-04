VillagesRemainNames = {}
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
	
	--	createQuestReachMountainFortress()
	--	StartCutscene("Intro", createBriefingMapStart)


	--	briefing
	--	createBriefingPrelude()

	Logic.ChangeAllEntitiesPlayerID(7, 1)

	-- Attach soldiers
	local i
	for i=1,3 do
		Tools.AttachSoldiersToLeader("P1_Leader"..i, 4)
	end

	--	briefingPrelude.refugee = GetID("NPC_Prelude")
	--	EnableNpcMarker("NPC_Prelude")

	--	quests
	VillagesRemainNames = {
		XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player3Name"),
		XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player4Name"),
		XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player5Name"),
		XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player6Name")
	}
	--start2ndQuest()	--unused
	--start3rdQuest()	--Bring life to tree(rain)
	start4thQuest()		--Rescue villagers
	start6thQuest()		--Search allies
	--createQuestBuildAlchemy()
	createQuestSnow()

	--	StartCutscene("Intro", createBriefingMapStart)
	StartCutscene("Intro")
end

end1stQuest = function()
--	obsolete
--	ResolveBriefing(briefingMapStart[2])
	Report("end 1st quest")
end	

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Quest:	Make winter
--
-------------------------------------------------------------------------------------------------------------------------

start2ndQuest = function()
	Report("start 2nd quest")			
	
	-- Add new quest
	Logic.AddQuest(
		1,									
		4,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest004_name_Snow",
		"CM01_19_Wasteland_Txt/mainquest004_desc_Snow",			
		1	
	)
	--already started
	--createQuestSnow()
	
	local Miner = Logic.GetEntityIDByName("weathermaster_off")
	Logic.SetEntityName(Miner, "weathermaster")
	
	EnableNpcMarker("weathermaster")
end

-------------------------------------------------------------------------------------------------------------------------
	
end2ndQuest = function()

	Report("end 2nd quest")
	
	if briefingSwamp ~= nil then
		ResolveBriefing(briefingSwamp[3])
	end
	
	RemoveValueFromTable(VillagesRemainNames, XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player3Name"))
	VillageDone()
	
	DisableNpcMarker("Banned_Info_NPC")
	SetNPCLookAtTarget("Banned_Info_NPC",0)

	--start3rdQuest()
end
	
-------------------------------------------------------------------------------------------------------------------------
--
--									3rd Quest:	Bring life to tree(rain)
--
-------------------------------------------------------------------------------------------------------------------------

start3rdQuest = function()
	Report("start 3rd quest")

	--	quests
	createQuestRain()
end

-------------------------------------------------------------------------------------------------------------------------

end3rdQuest = function()	

	Report("end 3rd quest")

	ResolveBriefing(briefingDryVillage[2])
		
	briefingRainFinished()
		
	-- Replace tree
	ReplaceEntity("DeadTree", Entities.XD_TreeEvelance1)
		
	-- Build up done Bring life to tree done
	bringLifeToTreeDone = true

	-- Player 4 joins
	local playerId = 4
	if CP_Difficulty < 2 then
		Logic.ChangeAllEntitiesPlayerID(playerId, 1)
	else
		local aiDescription = {
			serfLimit	=	4,
			extracting	=	false,
			rebuild	=	{
				delay				=	15,
				randomTime			=	15
			},
			resources = {
				gold				=	2000,
				clay				=	800,
				iron				=	800,
				sulfur				=	800,
				stone				=	800,
				wood				=	800
			},
			refresh = {
				gold				=	50,
				clay				=	20,
				iron				=	20,
				sulfur				=	20,
				stone				=	20,
				wood				=	20,
				updateTime			=	5
			}
		}
		SetupPlayerAi(playerId, aiDescription)

		setupArmyP4Defense()
	end
	Logic.SetDiplomacyState( 1, playerId, Diplomacy.Friendly )
	Logic.SetShareExplorationWithPlayerFlag(1, playerId, 1)
	Logic.SetDiplomacyState( playerId, 2, Diplomacy.Hostile )
	
	RemoveValueFromTable(VillagesRemainNames, XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player4Name"))
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
	
	if BriefingFugitive ~= nil then
		ResolveBriefing(BriefingFugitive[2])
	end
	
	-- Player 5 joins
	local playerId = 5
	if CP_Difficulty < 2 then
		Logic.ChangeAllEntitiesPlayerID(playerId, 1)
	else
		local aiDescription = {
			serfLimit	=	4,
			extracting	=	false,
			rebuild	=	{
				delay				=	15,
				randomTime			=	15
			},
			resources = {
				gold				=	2000,
				clay				=	800,
				iron				=	800,
				sulfur				=	800,
				stone				=	800,
				wood				=	800
			},
			refresh = {
				gold				=	50,
				clay				=	20,
				iron				=	20,
				sulfur				=	20,
				stone				=	20,
				wood				=	20,
				updateTime			=	5
			}
		}
		SetupPlayerAi(playerId, aiDescription)

		setupArmyP5Defense()
	end
	Logic.SetDiplomacyState( 1, playerId, Diplomacy.Friendly )
	Logic.SetShareExplorationWithPlayerFlag(1, playerId, 1)
	Logic.SetDiplomacyState( playerId, 2, Diplomacy.Hostile )
	
	RemoveValueFromTable(VillagesRemainNames, XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player5Name"))
	VillageDone()
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

	-- Build up done
	buildUpDone = true
	
	-- Change player
	local playerId = 6
	if CP_Difficulty < 2 then
		ChangePlayer("BuildUpNPC", 8)
		Logic.ChangeAllEntitiesPlayerID(playerId, 1)
		ChangePlayer("BuildUpNPC", playerId)
		Move("BuildUpNPC", "BuildUpNPC_TargetPos")
	else
		local aiDescription = {
			serfLimit	=	4,
			extracting	=	false,
			rebuild	=	{
				delay				=	15,
				randomTime			=	15
			},
			resources = {
				gold				=	2000,
				clay				=	800,
				iron				=	800,
				sulfur				=	800,
				stone				=	800,
				wood				=	800
			},
			refresh = {
				gold				=	50,
				clay				=	20,
				iron				=	20,
				sulfur				=	20,
				stone				=	20,
				wood				=	20,
				updateTime			=	5
			}
		}
		SetupPlayerAi(playerId, aiDescription)

		setupArmyP6Defense()
	end
	Logic.SetDiplomacyState( 1, playerId, Diplomacy.Friendly )
	Logic.SetShareExplorationWithPlayerFlag(1, playerId, 1)
	Logic.SetDiplomacyState( playerId, 2, Diplomacy.Hostile )
	
	ResolveBriefing(briefingBuildUp[2])

	RemoveValueFromTable(VillagesRemainNames, XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/_Player6Name"))
	VillageDone()
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
	--string.format(XString.Key("mainquest006_desc_SearchAllies"), XGUIEng.GetStringTableText("MenuGeneric/Female_Salut_Generic"))
	--Logic.SetSubQuestDoneFlag(	1,	6,	(VillageDoneCount-1),	1,	1) 

	if VillageDoneCount < 4 then
		UpdateSearchAllies()
	else
		-- All four rescued missions are done
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

	if _npcId == GetID("SnowNPC") then

		-- already done
		if talkedToSnowNPC == nil then

			-- Build up briefing...quest must be generated seperatly
			createBriefingDryVillage()
			
			talkedToSnowNPC = true
		end
		
	elseif _npcId == GetID("BuildUpNPC") then

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
			start3rdQuest()
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

	elseif _npcId == GetID("Fugitive2") then	

		-- already done
		if talkedToFugitiveNPC2 == nil then

			-- Rain briefing...quest must be generated seperatly
			createBriefingFugitive2()
			
			talkedToFugitiveNPC2 = true
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


	