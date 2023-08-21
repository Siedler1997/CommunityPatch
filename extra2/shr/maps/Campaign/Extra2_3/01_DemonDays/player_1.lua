createPlayer1 = function()

	local playerId = 1
	
	Logic.SetPlayerName(playerId, String.Player(playerId))
	if CP_Difficulty == 0 then
		Tools.GiveResouces(playerId, 2000,1500,1500,1500,1500,1500) 
	else
		Tools.GiveResouces(playerId, 1000,800,800,500,400,300) 
	end
	
	CP_ActivateEvilMod(1, 1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBandit, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBandit, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBanditBow, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBanditBow, 1)

end