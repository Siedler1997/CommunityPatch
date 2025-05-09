
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	Logic.SetPlayerName(5, String.MainKey.."_Player5Name")

		Player5 					= {}
		Player5.id 					= 5

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	true,
			--resourceFocus			        =	ResourceType.WoodRaw,
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
				updateTime			=	3
			},
			--------------------------------------------------
			rebuild	=	{
					delay			=	2,
					randomTime		=	7
				},		
		}
		
		SetupPlayerAi(Player5.id,description)



	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)

	--[[
		local position = GetPosition("village5")


		construction	= { { type	= Entities.PB_VillageCenter3 , pos = position , level=3	} }
						
		FeedAiWithConstructionPlanFile(5,construction)
	--]]
end
