---------------------------------------------------------------------------------------------
function createQuestGate()

    StartSimpleJob("controlGate")

    end
---------------------------------------------------------------------------------------------
function controlGate()

    if IsDead("control2") then
        ReplaceEntity("gate",Entities.XD_DarkWallStraightGate)
        return true
        end

    end