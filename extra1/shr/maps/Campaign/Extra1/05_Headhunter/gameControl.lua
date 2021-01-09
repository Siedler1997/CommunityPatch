------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

    --AddGold(10000)
    --AddStone(10000)
    --AddWood(10000)
    --AddSulfur(10000)
    
    local CannonMerchantID = GetEntityId("CannonMerchant")

    if CP_Difficulty == 0 then
        Logic.AddMercenaryOffer(CannonMerchantID, Entities.PV_Cannon4, 4, ResourceType.Sulfur, 100, ResourceType.Iron, 100, ResourceType.Gold, 100)
    else
        Logic.AddMercenaryOffer(CannonMerchantID, Entities.PV_Cannon3, 4, ResourceType.Sulfur, 100, ResourceType.Iron, 100, ResourceType.Gold, 100)
    end

    StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)
    createBriefingCrossroads()    

    createQuestDefeat()
    createArmyVillageAttackers()

    createFortifyVillageQuest()

    -- sub quest

    createBriefingKeyKeeper()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ResolveBriefing(preludeBriefing[preludeBriefingCommander])

    createBriefingFortifyVillageDone()

    destroyBriefingCrossroads()

    beginChapterTwo()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterTwo()

    createBriefingOpenBridge()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterTwo()

    ResolveBriefing(briefingFortifyVillageDone[briefingFortifyVillageDonePage])

    DestroyNPC(npcOpenBridge)

    ReplaceEntity("bridge",Entities.PB_DrawBridgeClosed1)

    beginChapterThree()

    createArmyWayDefenders()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterThree()

    createQuestDestroyCamp()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterThree()

    ResolveBriefing(briefingOpenBridge[briefingOpenBridgeDestroyCamp])

    for i = 1,6,1 do
        local name = "b"..i
        ChangePlayer(name,1)
        end

    for i = 1,4,1 do
        local name = "scout"..i
        ChangePlayer(name,1)
        end

    beginChapterFour()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterFour()

    createBriefingLab()

    createQuestWeather()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterFour()

    ResolveBriefing(briefingLab[briefingChangeWeather])

    beginChapterFive()

    end
------------------------------------------------------------------------------------------------------------------------------------
function beginChapterFive()

    createArmyCamps()

    createQuestRescueGateKeeper()

    createBriefingGuards()

    createBriefingHelias()

    createQuestHelias()

    createBriefingVictory()

    end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterFive()

--    ResolveBriefing(briefingHelias[briefingHeliasPage])
	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)


    end