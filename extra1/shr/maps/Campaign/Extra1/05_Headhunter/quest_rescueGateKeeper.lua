---------------------------------------------------------------------------------------------
function createQuestRescueGateKeeper()

    StartSimpleJob("controlRescueGateKeeper")

    end
---------------------------------------------------------------------------------------------
function controlRescueGateKeeper()
    for i = 1,6,1 do
        local name = "gateTower"..i
        if IsDead(name) == false then
            return false
        end
    end

    if IsDead(armyCamp2) == false or IsExisting("PrisonCage") then
        return false
    end

    DestroyNPC(npcKeyKeeper)

    --DestroyEntity("jail")

    Move("gateKeeper","keyKeeper",1000)

    createBriefingKeyKeeper_GateKeeperIsOnTheWay()

    createBriefingGateKeeper()

    return true
end