createPlayer6 = function()

	local playerId = 6

	Logic.SetPlayerName(6, String.MainKey.."_Player6Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	1000,
			clay				=	 800,
			iron				=	 800,
			sulfur				=	 800,
			stone				=	 800,
			wood				=	 800
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false
	}

	if CP_Difficulty == 1 then
		aiDescription.refresh = {
			gold				=	30,
			clay				=	20,
			iron				=	20,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	10
		}
	end

	SetupPlayerAi(playerId,aiDescription)

	-- upgrade soldiers
	local i
	for i=1,2 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
	end
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)

end