
createPlayer3 = function()

	--	describe the player structure
	
	local playerId = 3
	Logic.SetPlayerName(3, String.MainKey.."_Player3Name")
	
		player3 	= {}
		player3.id 	= 3

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
				gold				=	5,
				clay				=	3,
				iron				=	3,
				sulfur				=	3,
				stone				=	3,
				wood				=	3,
				updateTime			=	2
			},

			rebuild	= { delay = 1 , randomTime = 7 }
		}
		
		SetupPlayerAi(player3.id,description)

		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 3)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 3)

		--[[
		local position = GetPosition("village3")


		construction	= { { type	= Entities.PB_VillageCenter3 , pos = position , level=3 } }
						
		FeedAiWithConstructionPlanFile(3,construction)
		--]]
	
	end
