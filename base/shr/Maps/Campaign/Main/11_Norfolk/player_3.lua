createPlayer3 = function()

	local playerId = 3
	Logic.SetPlayerName(3, String.MainKey.."_Player3Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
			clay				=	3000,
			iron				=	3000,
			sulfur				=	3000,
			stone				=	3000,
			wood				=	3000
		},
		--------------------------------------------------
		refresh = {
			gold				=	3,
			clay				=	1,
			iron				=	1,
			sulfur				=	1,
			stone				=	1,
			wood				=	1,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
			delay				=	30,
			randomTime			=	30
		}	
		
		}
		
	Tools.GiveResouces(3, 3000, 3000, 3000, 3000,3000, 3000)

	SetupPlayerAi(playerId,aiDescription)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
	if CP_Difficulty == 1 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)
	end

	setupArmyP3Defense()
end