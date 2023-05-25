------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

    Report("begin chapter one")

    Logic.SetPlayerPaysLeaderFlag(1,0)

	if CP_Difficulty < 2 then
        CreateRandomGoldChests()
    else
	    CreateRandomGoldChest(GetPosition("GoldChest1"))
    end

    CreateChestOpener("Dario")
    CreateChestOpener("Pilgrim")
    CreateChestOpener("Ari")
    StartChestQuest()

	local troopDescription1 = {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYLOW_EXPERIENCE,
		leaderType          = Entities.PU_LeaderSword3,
		position            = GetPosition("pilgrim0")
	}

	local troopDescription2 = {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYLOW_EXPERIENCE,
		leaderType          = Entities.PU_LeaderBow3,
		position            = GetPosition("pilgrim0")
	}

	local army ={}

    local a0 = CreateTroop(army,troopDescription1)
    local a1 = CreateTroop(army,troopDescription2)

    Move(a0,"support0")
	Move(a1,"support1")

    local merchant = Logic.GetEntityIDByName("merchantTent")
    
	if CP_Difficulty == 0 then
        Logic.AddMercenaryOffer(merchant,Entities.PU_Thief,4,ResourceType.Gold,150)
        Logic.AddMercenaryOffer(merchant,Entities.CU_BanditLeaderBow1,2,ResourceType.Iron,200)
        Logic.AddMercenaryOffer(merchant,Entities.CU_Barbarian_LeaderClub1,2,ResourceType.Sulfur,200)
    else
        Logic.AddMercenaryOffer(merchant,Entities.PU_Thief,2,ResourceType.Gold,200)
        Logic.AddMercenaryOffer(merchant,Entities.CU_BanditLeaderBow1,2,ResourceType.Iron,300)
        Logic.AddMercenaryOffer(merchant,Entities.CU_Barbarian_LeaderClub1,2,ResourceType.Sulfur,300)
    end
	--Activate fog
	CreateDynamicFog("fog", 1)
	CreateDynamicFog("FogStoneMine", 0)


    createArmyDefender0()
    createQuestDefeat()
    createQuestThief()
    createBriefingBuilder0()   
    StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)



    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ResolveBriefing(briefingPrelude[briefingPreludeQuestPage])

    beginChapterTwo()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterTwo()

    Report("begin chapter two")

    createArmyDefender1()

    createQuestRuinDefenders()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterTwo()

    ResolveBriefing(briefingBuilder0[briefingBuilder0Page])

    StartCutscene(Cutscenes[THRESHOLDONECUTSCENE],beginChapterThree)

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterThree()

    Report("begin chapter three")


	createQuestDestroyRuins()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterThree()

    ResolveBriefing(briefingBuilder1[briefingBuilder1QuestPage])

    createBriefingBuilder2()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterFour()

    Report("begin chapter four")

    createQuestBridge()

    createArmyStone()

    createQuestStoneArmyDead()

    ChangeDynamicFog("FogStoneMine", 2, 3)

    createBriefingPilgrim()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterFour()

    ResolveBriefing(briefingBuilder2[briefingBuilder2QuestPage])

    beginChapterFive()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterFive()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(6, true)
	end

    Report("begin chapter five")

    createBriefingSurvive()

    createArmyBridge()

    createQuestSurvive()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterFive()

    StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

    end
------------------------------------------------------------------------------------------------------------------------------------
function ReplaceAfraidSettlers()

	--Table to Replace Afraid Settlers  by certain typs
	local AfraidSettlersTypsToReplace= 	{
											{Entities.CU_AfraidMasterBuilder,Entities.PU_MasterBuilder},
											{Entities.CU_AfraidAlchemist,Entities.PU_Alchemist},
											{Entities.CU_AfraidMiner,Entities.PU_Miner},
											{Entities.CU_AfraidSawmillworker,Entities.PU_Sawmillworker},
											{Entities.CU_AfraidSerf,Entities.PU_Serf},
											{Entities.CU_AfraidSmith,Entities.PU_Smith},
											{Entities.CU_AfraidStonecutter,Entities.PU_Stonecutter}
										}

	--go thru all entries in Table
	for i=1,table.getn(AfraidSettlersTypsToReplace),1
		do
			--Get number and IDS of settlers of this typ
			local NumberAndIDsOfAfraidSettlersOfType = {Logic.GetPlayerEntities(3,AfraidSettlersTypsToReplace[i][1],20)}

			--go thru all IDS of this typ
			for j=1,NumberAndIDsOfAfraidSettlersOfType[1],1
			do
				--save Position
				local Position = {}
				Position = GetPosition(NumberAndIDsOfAfraidSettlersOfType[j+1])

				--destroy ID
				DestroyEntity(NumberAndIDsOfAfraidSettlersOfType[j+1])

				--create new ID with the corresponding type of the given table
				CreateEntity(1, AfraidSettlersTypsToReplace[i][2], Position )
			end
		end

	end
	