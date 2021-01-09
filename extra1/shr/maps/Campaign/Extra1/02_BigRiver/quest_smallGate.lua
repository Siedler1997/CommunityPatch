---------------------------------------------------------------------------------------------
function createQuestSmallGate()

    StartSimpleJob("controlSmallGate")

    end
---------------------------------------------------------------------------------------------
function controlSmallGate()

    if IsDead("openSmallGate") then
        ReplaceEntity("smallGate",Entities.XD_DarkWallStraightGate)
        createBriefingSmallGateOpens()
        return true
        end

    end