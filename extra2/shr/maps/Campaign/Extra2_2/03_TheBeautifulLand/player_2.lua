
createPlayer2 = function()

	--	describe the player structure
	
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2")
	
		player2 	= {}
		player2.id 	= 2

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	2,
				randomTime			=	5
			},
			--------------------------------------------------
			resources = {
				gold				=	2000,
				clay				=	2000,
				iron				=	2000,
				sulfur				=	2000,
				stone				=	2000,
				wood				=	2000
			},
			--------------------------------------------------
			refresh = {
				gold				=	3,
				clay				=	3,
				iron				=	3,
				sulfur				=	3,
				stone				=	3,
				wood				=	3,
				updateTime			=	5
			},
		}

		if CP_Difficulty > 0 then
			description.refresh = {
				gold				=	10,
				clay				=	10,
				iron				=	10,
				sulfur				=	10,
				stone				=	10,
				wood				=	10,
				updateTime			=	5
			}
		end
		
		SetupPlayerAi(player2.id,description)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	
	if CP_Difficulty > 0 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	end
	
end
