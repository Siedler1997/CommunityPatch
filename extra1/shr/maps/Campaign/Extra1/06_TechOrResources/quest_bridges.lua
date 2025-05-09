---------------------------------------------------------------------------------------------
function createQuestBridges()
    StartSimpleJob("controlBridges")
end
---------------------------------------------------------------------------------------------
function controlBridges()
	if Counter.Tick2("controlBridges", 10) then
        local pos1 = GetPosition("westBridgePos")
        local pos2 = GetPosition("eastBridgePos")
	    local bridgeWest = { Logic.GetEntitiesInArea(Entities.PB_Bridge2, pos1.X, pos1.Y, 1000, 1) }
	    local bridgeEast = { Logic.GetEntitiesInArea(Entities.PB_Bridge1, pos2.X, pos2.Y, 1000, 1) }
        if bridgeWest[1] == 0 and bridgeEast[1] == 0 then
            CreateEntity(2,Entities.XD_Bomb1,GetPosition("bomb1pos"))
            CreateEntity(2,Entities.XD_Bomb1,GetPosition("bomb2pos"))
            return true
        end
    end
end