---------------------------------------------------------------------------------------------
function createTimerForBombers()
    StartCountdown(30 * 60, createBombTroops, false)
end
------------------------------------------------------------------------------------------------------------------------------------
function createBombTroops()
    delayBombPeople = 5
    local bombSpawnyPos = GetPosition("bombSpawny")

    for i = 1,12,1 do
        --CreateEntity(2,Entities.PU_LeaderHeavyCavalry7,GetPosition("bombSpawny"),"bomb"..i)
		SetEntityName(AI.Entity_CreateFormation(7,Entities.PU_LeaderHeavyCavalry2,0,0,bombSpawnyPos.X,bombSpawnyPos.Y,0,0,3,0), "bomb"..i)
    end

    StartSimpleJob("controlBombTroops")

    return true
end
------------------------------------------------------------------------------------------------------------------------------------
function controlBombTroops()
    for i = 1,12,1 do
        local name = "bomb"..i
        if IsDead(name) == false then
            if GetRandom(100) > 95 then
                CreateEntity(Logic.EntityGetPlayer(GetEntityId(name)), Entities.XD_Bomb1,GetPosition(name),"bang")
            end
        end
    end

    if delayBombPeople > 0 then
        delayBombPeople = delayBombPeople-1
        return
    end

    delayBombPeople = 5

    for i = 1,12,1 do
        local name = "bomb"..i
        if IsDead(name) == false and Logic.EntityGetPlayer(GetEntityId(name)) ~= 1 then
            Move(name,"t"..GetRandom(1,10))
        end
    end
end