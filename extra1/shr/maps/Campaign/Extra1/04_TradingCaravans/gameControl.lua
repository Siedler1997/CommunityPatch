------------------------------------------------------------------------------
-- Introduction, build wp wells
------------------------------------------------------------------------------
function start1stChapter()

	--Share fog of war for the caravans
	Logic.SetShareExplorationWithPlayerFlag(1,7,1)

	-- army checkrange
	ArmyCheckRange = 7000

	CreateChestOpener("Ari")
	CreateChestOpener("Salim")
	CreateChestOpener("Dario")
	CreateChestOpener("Pilgrim")
	CreateChestOpener("Yuki")
	StartChestQuest()
	
	if CP_Difficulty < 2 then
		CreateRandomGoldChests()	
	end

	if CP_Difficulty > 0 then
		local keychest = Logic.CreateEntity(Entities.XD_ChestClose,40700,2600,45,0)
		SetEntityName(keychest, "Gate_KeyChest")
		StartSimpleJob("HeroNearP4TradeLord2Chest")
	end
	
    -- set up and activate player 2
	
    CreatePlayer2()
    SetPlayerName(3, String.MainKey.."_Player3Name")
    --SetPlayerName(3, "Haendler")
    SetPlayerName(4, String.MainKey.."_Player4Name")
    --SetPlayerName(4, "Haendler")
    SetPlayerName(5, String.MainKey.."_Player5Name")
    --SetPlayerName(5, "Romeo")
	
    -- create the defense armies of steppe robbers

    --CreateArmyOne()
    --CreateArmyTwo()
    --CreateArmyThree()
	CreateArmiesBanditsDefense()
	CreateArmyPatrol()

	-- Quest
	CreateQuestCaravanWP()

	-- briefing
    StartCutscene(Cutscenes[INTROCUTSCENE],CreateBriefingPrelude)

	-- lost on hq lost
	AddDefeatEntity("Headquarter")
	
	start1stSubChapter()
	
end

function HeroNearP4TradeLord2Chest()
	for i = 1, table.getn(chestOpener), 1 do
		if IsNear(chestOpener[i], "Gate_KeyChest", 250) then
			ReplaceEntity("Gate_KeyChest", Entities.XD_ChestOpen)
			SpokenMessage("CM01_15_OldKingsCastle_Txt/Message_KeyFound")
			StartSimpleJob("HeroNearP4TradeLord2Gate")
			return true
		end
	end
end

function HeroNearP4TradeLord2Gate()
	local isNearGate = false
	for i = 1, table.getn(chestOpener), 1 do
		for j = 1, 3 do
			if IsNear(chestOpener[i], "P4_TradeLord2_Gate"..j, 500) then
				isNearGate = true
			end
		end
	end

	if isNearGate == true then
		for i = 1, 3 do
			ReplaceEntity("P4_TradeLord2_Gate"..i, Entities.XD_WallStraightGate)
		end
		SpokenMessage("CM01_15_OldKingsCastle_Txt/Message_GateOpened")
		return true
	end
end

function end1stChapter()
	
	ResolveBriefing(PreludeBriefingQuestTradeRoute) 

	start2ndChapter()

end
------------------------------------------------------------------------------
-- talk to tradelord 3
------------------------------------------------------------------------------
function start2ndChapter()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(8, true)
	end
	
	CreateBriefingTraderLord3()

	CreateNPCTradeLord3()

end
function end2ndChapter()

	ResolveBriefing(TraderLord3BriefingShowTradeLord)

	start3rdChapter()
				
end

------------------------------------------------------------------------------
-- escort first caravans 
------------------------------------------------------------------------------
function start3rdChapter()

	CreateQuestCaravans1()

	-- expand army check range for army one,two and three
	ArmyCheckRange = 10000
	
	CreateArmyCaravanAttack()
	
end
function end3rdChapter()

	-- give reward
	ResolveBriefing(ThresholdBriefing1QuestCaravan1)
	ResolveBriefing(ThresholdBriefing1ShowTarget)
	
	start4thChapter()

end
------------------------------------------------------------------------------
-- escort second caravans 
------------------------------------------------------------------------------
function start4thChapter()

	CreateBriefingCaravan2()

	CreateQuestCaravans2()

	InitPlayerColorMapping()
	
end
function end4thChapter()

	ResolveBriefing(BriefingCaravan2ShowStart)
	ResolveBriefing(BriefingCaravan2QuestCaravan2)
	ResolveBriefing(BriefingCaravan2ShowTarget)

	DestroyArmyCaravanAttack()

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

end
------------------------------------------------------------------------------
-- towers
------------------------------------------------------------------------------
function start1stSubChapter()

	CreateQuestDestroyTowers()

end
function end1stSubChapter()
	
	start2ndSubChapter()
	
end
------------------------------------------------------------------------------
-- Motte
------------------------------------------------------------------------------
function start2ndSubChapter()

	CreateNPCMotte()

	CreateNPCRifle()

end
function end2ndSubChapter()

	ReplaceEntity("NPCMotteGate", Entities.XD_WallStraightGate)
	LookAt("NPCMotte", "Dario")
	
	ResolveBriefing(BriefingNPCMotteShowVillage)
	ResolveBriefing(BriefingNPCMotteShowGate)
		
end