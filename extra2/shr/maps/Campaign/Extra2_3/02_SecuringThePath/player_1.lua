createPlayer1 = function()

	local playerId = 1
	
	Logic.SetPlayerName(playerId, String.Player(playerId))
	Tools.GiveResouces(playerId, 3000,1500,1300,1000,500,500) 
	
	CP_ActivateEvilMod(1, 1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBarbarian, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightLeaderMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.BlackKnightSoldierMace1, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBandit, 1)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBandit, 1)

end