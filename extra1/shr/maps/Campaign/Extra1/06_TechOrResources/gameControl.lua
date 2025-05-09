------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

    CreateChestOpener("Dario")
    CreateChestOpener("Pilgrim")
    CreateChestOpener("Ari")
    CreateChestOpener("Helias")
    CreateChestOpener("Salem")
    CreateChestOpener("Yuki")
    CreateChestOpener("Drake")
    StartChestQuest()

	StartCutscene(Cutscenes[INTROCUTSCENE],createPreludeBriefing)
    createFarmerBriefing()

    --createAssaultArmies()
    createDefendArmies()
    createFriendlyArmies()
    createGuardArmies()

    createQuestVictory()
    createQuestStones()
    createQuestPriest()

    if CP_Difficulty < 2 then
        CreateRandomGoldChests()
    end
end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ReplaceEntity("drawbridge",Entities.PB_DrawBridgeClosed1)

    destroyPreludeBriefing()

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

    end
