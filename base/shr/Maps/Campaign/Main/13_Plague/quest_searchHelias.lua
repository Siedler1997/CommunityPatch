
-- meet Helias

startQuestSearchHelias = function()

	EnableNpcMarker("Helias")

end




endQuestSearchHelias = function()

	DisableNpcMarker("Helias")

	-- Stop moving entity and destroy task
		local movingID = Logic.GetEntityIDByName("Dario")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Erec")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end

		local movingID = Logic.GetEntityIDByName("Pilgrim")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Salim")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end

	ChangePlayer("Helias",GetHumanPlayer())
	
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechs(2, true)
		ResearchAllMilitaryTechs(3, true)
		ResearchAllMilitaryTechs(5, true)
		ResearchAllMilitaryTechs(6, true)	--No enemy, but has to be an useful help troop
	end
	
--	Logic.RotateEntity(GetID("Helias"), 180)	

	
end
