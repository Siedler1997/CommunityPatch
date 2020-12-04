--------------------------------------------------------------------------------
-- End screen window stuff
--------------------------------------------------------------------------------
-- Restarts the map (Triggerfix by mcb)
function GUIAction_RestartMap()
	Trigger.DisableTriggerSystem(1)
	Framework.RestartMap()
	--QuitGame()
end

function
GUIAction_LoadMap()
	QuitGame()
end