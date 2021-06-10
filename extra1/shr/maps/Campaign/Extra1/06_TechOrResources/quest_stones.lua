---------------------------------------------------------------------------------------------
function createQuestStones()

    StartSimpleJob("controlStones")

    end
---------------------------------------------------------------------------------------------
function controlStones()

    local removeGate = true

    local stonesOnMap = 0

    for i=0,6,1 do
        if IsDead("rock"..i) == false then
            stonesOnMap = stonesOnMap +1
            removeGate = false
            end
        end

    GUIQuestTools.UpdateQuestInformationString(stonesOnMap .. "/" .. 7)

    if removeGate == true then
        DisableNpcMarker("npcFarmer")
        GUIQuestTools.DisableQuestInformation()
        createHiddenPathBriefing()
        --DestroyEntity("gate1")
        return true
        end

    end