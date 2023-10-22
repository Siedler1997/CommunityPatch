
createPlayer4 = function()

	--	describe the player structure
	
	local playerId = 4
	Logic.SetPlayerName(4, String.MainKey.."_Player4Name")
	
		player4 	= {}
		player4.id 	= 4

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime			=	25
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
				gold				=	10,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	2
			},

			rebuild	= { delay = 1 , randomTime = 7 }
		}
		
		SetupPlayerAi(player4.id,description)


	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)



	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)


	--[[
		local position = GetPosition("village4")


		construction	= { { type	= Entities.PB_VillageCenter3 , pos = position , level=3 } }
						
		FeedAiWithConstructionPlanFile(4,construction)
	--]]
end
