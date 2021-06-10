createPlayer2 = function()

	-- Setup ai
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")


	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	2,
		--------------------------------------------------
		resources = {
			gold				=	5000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	5,
			iron				=	5,
			sulfur				=	5,
			stone				=	5,
			wood				=	5,
			updateTime			=	5
		},
		--------------------------------------------------
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)
	
	if CP_Difficulty > 0 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	end

	setupArmyKI2()
	setupArmyKI2Defense()

end

