------- Templars  ----

setupTemplars = function ()
	local pos = GetPosition("templars")
	local etype = Entities.PU_LeaderHeavyCavalry2
	if CP_Difficulty > 0 then
		etype = Entities.PU_LeaderHeavyCavalry1
	end
    templars = Tools.CreateGroup(1, etype, 3, pos.X, pos.Y, 0)
    SetEntityName(templars, "templars") 
end