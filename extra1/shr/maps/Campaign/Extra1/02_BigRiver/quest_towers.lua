---------------------------------------------------------------------------------------------
function createQuestTowers()

    StartSimpleJob("controlTowers")

    end
---------------------------------------------------------------------------------------------
function controlTowers()
    if IsDead("control1") then
        for tower = 1,13,1 do
            if IsExisting("tower"..tower) then
                ChangePlayer("tower"..tower,4)
            end
        end
        return true
    end
end