

------------------------------------------------------------------------------------------------------------------------------------
function createQuestWinter()

	--Set timer for winter
	createTimerWinter()

end

------------------------------------------------------------------------------------------------------------------------------------
function createTimerWinter()
	
	StartSimpleJob("controlTimerWinter")

    -- start timer
    GUIQuestTools.ToggleStopWatch(TIMER_WINTER,1)
	
end

------------------------------------------------------------------------------------------------------------------------------------
function controlTimerWinter()

    if TIMER_WINTER > 0 then

        TIMER_WINTER = TIMER_WINTER -1

        return false

	end

	if AllSheepRescued() then
		endChapterOne()
		return true
	else
		Defeat()
	end
end
