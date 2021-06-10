------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

	if CP_Difficulty == 0 then
        CreateRandomGoldChests()
        CreateRandomChests()
    end

    CreateChestOpener("Dario")
    CreateChestOpener("Pilgrim")
    CreateChestOpener("Ari")
    CreateChestOpener("Helias")
    CreateChestOpener("Salem")
    StartChestQuest()

    GlobalMissionScripting.ExploreArea(GetPosition("explore0").X,GetPosition("explore0").Y,4000 / 100)
	--Logic.ForceFullExplorationUpdate()


    createBanditArmies()
    createDefenderArmies()
    createQuestSmallGate()
    createQuestTowers()
    createQuestGate()
    createQuestEnemyOutpost()
    createQuestStoneBandits()
    createBriefingInventor()
    createBriefingBandits()
    createBriefingTip()

    local merchant = Logic.GetEntityIDByName("mercenary")

    Logic.AddMercenaryOffer(merchant,Entities.PV_Cannon4,3,ResourceType.Gold,300)


    StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
    --createBriefingScout()


--    CreateEntity(2,Entities.PU_Hero3_TrapCannon,GetPosition("mine1"),"mine1b")
--    CreateEntity(2,Entities.PU_Hero3_Trap,GetPosition("mine1"),"mine1a")

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    end

