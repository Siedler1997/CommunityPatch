
--****************************[QUEST 1 STUFF]***********************
--------------------------------[Moving thief on a chosen way]------------------------------------

j = 0 --way of the thief, 0 default means random
TIMER = 60 * 30  -- time until thief go
STOP_TIME = 70 --time stop for each waypoint
ThiefGo = false -- true when TIMER = 0 

--------------------------------------------------------------------------------
--*******************[starts thief timer for the first part of the road]********

ThiefTimer = function()
--[[
	if TIMER == 1 then
		--MoveThief()  --now starts in ThiefGoBriefing
		DestroyNPC(NPCthief)
		createThiefGoBriefing()
		return true
	else
		TIMER = TIMER - 1
	end
	--]]
	DestroyNPC(NPCthief)
	createThiefGoBriefing()
end
-------------------------------------------------------------------------------------
--********************[thief is a peasant<2 be easyer spoted>then run to the first waypoint]*********

MoveThief = function()

i = 1

if j == 0 then
j = GetRandom(1,3) --if no fire is lightened, the thief choose a random way
end

--ReplaceEntity("thief",Entities.CU_SettlerIdle)
--Move("thief","stop"..j.."_1")

StartSimpleJob("moveT")
StartSimpleHiResJob("ThiefStop")

end
---------------------------------------------------------------------------------
--*********************[thief stops 4 a few sex in each waypoint]***************

ThiefStop = function()

if i == 6 and IsNear("thief","stop"..j.."_"..i,100) then
--createGeneralBriefing("stop"..j.."_"..i,"thief.target1")

end1stQuest()
return true

end

if IsAlive("thief") then

	if IsNear("thief","stop"..j.."_"..i,100) and Counter.Tick2("ControlThief",STOP_TIME) == true then
	ControlThief()
	return true
	end
else
	return true
end

end
--------------------------------------------------------------------------------
--*****************[thief go to the next waypoint]******************************

ControlThief = function()
i = i + 1

if IsAlive("thief") then

--	Move("thief","stop"..j.."_"..i)
	StartSimpleHiResJob("ThiefStop")
	StartSimpleJob("moveT")
else
	return true
end

end

moveT = function()
	Move("thief","stop"..j.."_"..i)
	if IsNear("thief","stop"..j.."_"..i,50) then
	return true
	end
end

------------------------------------------------------------------------------------
-----------------------------[Light the fire to show way]---------------------------

TowerInFlames = function()

if ThiefGo == true then
return true
end

local tower1 = Logic.GetEntityIDByName("fire_south")
local tower2 = Logic.GetEntityIDByName("fire_central")
local tower3 = Logic.GetEntityIDByName("fire_north")

if Logic.GetEntityHealth(tower1) < (Logic.GetEntityMaxHealth(tower1) * 0.2) then
ChangePlayer("fire_south",4)
j = 1
createGeneralBriefing("fire_south","fire")
return true

elseif Logic.GetEntityHealth(tower2) < (Logic.GetEntityMaxHealth(tower2) * 0.2) then
ChangePlayer("fire_central",4)
j = 2
createGeneralBriefing("fire_central","fire")
return true

elseif Logic.GetEntityHealth(tower3) < (Logic.GetEntityMaxHealth(tower3) * 0.2) then
ChangePlayer("fire_north",4)
j = 3
createGeneralBriefing("fire_north","fire")
return true

end

end




