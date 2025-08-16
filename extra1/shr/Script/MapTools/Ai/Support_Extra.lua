function ResearchAllUniversityTechnologies_Extra(_playerId)

	--AddOn Technologies
	Logic.SetTechnologyState(_playerId,Technologies.GT_Mathematics,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Binocular,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Matchlock,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_PulledBarrel,3)

end

----------------------------------------------------------------------------------------
-- Start Countdown
----------------------------------------------------------------------------------------
function MapLocal_StartCountDown(_time)

	GUIQuestTools.ToggleStopWatch(_time, 1)

end


----------------------------------------------------------------------------------------
-- Stop Countdown
----------------------------------------------------------------------------------------
function MapLocal_StopCountDown()

	GUIQuestTools.ToggleStopWatch(0, 0)

end

----------------------------------------------------------------------------------------
-- Set Campaign Flag for Extra campaigns
----------------------------------------------------------------------------------------

function SetGDBFlagForExtraCampaign()
	-- Get map name
	local MapName = Framework.GetCurrentMapName()
	-- Create key
	local KeyName = "Game\\Campaign02\\WonMap_" .. MapName
	-- Set GDB key
	GDB.SetValue( KeyName, 1 )	
end

----------------------------------------------------------------------------------------
-- Check if lockpicking is possible
----------------------------------------------------------------------------------------

function CheckLockpicking(_position)
	local open = false

	local entities,scoutId = Logic.GetEntitiesInArea(Entities.PU_Scout,_position.X,_position.Y,250,1)
	if scoutId ~= nil then
		local techState = Logic.GetTechnologyState(GetPlayer(scoutId), Technologies.T_Lockpicking)
		if techState == 4 then
			open = true
		end
	end

	local entities,thiefId = Logic.GetEntitiesInArea(Entities.PU_Thief,_position.X,_position.Y,250,1)
	if thiefId ~= nil then
		local techState = Logic.GetTechnologyState(GetPlayer(thiefId), Technologies.T_Lockpicking)
		if techState == 4 then
			open = true
		end
	end

	return open
end