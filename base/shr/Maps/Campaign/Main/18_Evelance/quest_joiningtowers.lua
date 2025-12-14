createQuestJoiningTowers = function()
	local ammount = 4
	
	if CP_Difficulty < 2 then
		ammount = 7
	else
		ReplaceEntity("OP1_tower5", Entities.CB_DestroyAbleRuinSmallTower1)
		ReplaceEntity("OP1_tower6", Entities.CB_DestroyAbleRuinSmallTower3)
		ReplaceEntity("OP1_tower7", Entities.CB_DestroyAbleRuinSmallTower1)

		ChangePlayer("OP1_tower5", 7)
		ChangePlayer("OP1_tower6", 7)
		ChangePlayer("OP1_tower7", 7)
	end

	-- Use rescue quest
	InitTowers("OP1_tower", ammount)
	InitTowers("OP2_tower", 4)
	InitTowers("OP3_tower", 2)
end

InitTowers = function(_Name, _Count)

	local i
	for i=1, _Count do
		if CP_Difficulty > 0 then
			SetHealth(_Name..i, GetRandom(50, 100))
		end

		local Quest = {}
		Quest.ApproachRange = 1000
		
		Quest.Callback = TowerJoined		
		Quest.GiftEntity = _Name..i
		Quest.ApproachPos = _Name..i
		
		SetupRescue(Quest)
	end

end

TowerJoined = function()

	SpokenMessage(String.MainKey.."Message_TowerFound")

end