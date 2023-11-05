fortifyVillageQuestDone = false

------------------------------------------------------------------------------------------------------------------------------------
function createFortifyVillageQuest()

    StartSimpleJob("controlFortifyTowers")

    GUIQuestTools.StartQuestInformation("Tower", "CM02_05_Headhunter/QI_fortifyVillage", 1, 1)

    end
------------------------------------------------------------------------------------------------------------------------------------
function controlFortifyTowers()

    local towers = countTowers()

    GUIQuestTools.UpdateQuestInformationString(towers .. "/" .. 4)

    if towers >= 4 then
        endChapterOne()

        GUIQuestTools.DisableQuestInformation()

        fortifyVillageQuestDone = true

        return true
    end
end
------------------------------------------------------------------------------------------------------------------------------------
function countTowers()
    local currentTowerCount = Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_Tower3)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_DarkTower2)
								+ Logic.GetNumberOfEntitiesOfTypeOfPlayer(1,Entities.PB_DarkTower3)

    return currentTowerCount
end