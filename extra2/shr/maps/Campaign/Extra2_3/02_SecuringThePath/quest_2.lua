
------------------------[QUEST 2 STUFF]------------------------------

--***********************[starts the timer for the second part of the road]******************************************

startTimer_2 = function()
	local time = 20
	if CP_Difficulty > 0 then
		time = time - 5
	end
	StartCountdown(time * 60, ThiefTimer_2, true)

	AddGold(3000)
	AddIron(300)

	--[[
	TIMER = 60 * 20

	GUIQuestTools.ToggleStopWatch(TIMER ,1)
	StartSimpleJob("ThiefTimer_2")
	--]]
end


--------------------------------------------------------------------------------
--*******************[starts thief timer for the second part of the road]********

ThiefTimer_2 = function()
	--[[
	if TIMER == 1 then
		createThiefGoBriefing_2() --starts MoveThief_2()
		return true
	else
		TIMER = TIMER - 1
	end
	--]]
	
	createThiefGoBriefing_2() --starts MoveThief_2()
end
--------------------------------------------------------------------------------
--***********************[move thief on the second part of the way]*************

MoveThief_2 = function()

i = i + 1

StartSimpleJob("moveT")
StartSimpleHiResJob("ThiefStop_2")

end

---------------------------------------------------------------------------------
--*********************[thief stops 4 a few sex in each waypoint]***************

ThiefStop_2 = function()

if i == 10 and IsNear("thief","stop"..j.."_"..i,200) then

--createBriefingQuest2End()

end2ndQuest()

return true

end
if IsAlive("thief") then

	if IsNear("thief","stop"..j.."_"..i,100) and Counter.Tick2("MoveThief_2",STOP_TIME) == true then
	MoveThief_2()
	return true
	end
else
	return true
end

end