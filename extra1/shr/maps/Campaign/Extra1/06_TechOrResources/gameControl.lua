------------------------------------------------------------------------------------------------------------------------------------
function beginChapterOne()

    CreateRandomGoldChests()
    CreateChestOpener("Dario")
    CreateChestOpener("Pilgrim")
    CreateChestOpener("Ari")
    CreateChestOpener("Helias")
    CreateChestOpener("Salem")
    StartChestQuest()

	StartCutscene(Cutscenes[INTROCUTSCENE],createPreludeBriefing)
    createFarmerBriefing()

    createAssaultArmies()
    createDefendArmies()
    createFriendlyArmies()
    createGuardArmies()

    createQuestVictory()
    createQuestStones()
    createQuestPriest()

    StartCountdown(15 * 60, createPlayer2, false)

end
------------------------------------------------------------------------------------------------------------------------------------
function endChapterOne()

    ReplaceEntity("drawbridge",Entities.PB_DrawBridgeClosed1)

    destroyPreludeBriefing()

	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)

    end


