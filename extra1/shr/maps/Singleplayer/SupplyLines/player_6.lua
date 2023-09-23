
createPlayer6 = function()

	--	describe the player structure

	local playerId = 6
	Logic.SetPlayerName(6, String.MainKey.."_Player6Name")

		Player6 					= {}
		Player6.id 					= 6

	--	set up default information

		local description = {
		
			serfLimit				=	7,
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
				gold				=	7,
				clay				=	5,
				iron				=	7,
				sulfur				=	5,
				stone				=	5,
				wood				=	7,
				updateTime			=	2
			},
			--------------------------------------------------
			rebuild	= { delay = 1 , randomTime = 3 } }
		
		SetupPlayerAi(Player6.id,description)


	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)



	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)


	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
	
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 6)


local position = GetPosition("village6")


		construction	= { { type	= Entities.PB_VillageCenter3	,	pos = position , level=3} }
						
		FeedAiWithConstructionPlanFile(6,construction)
	
	end
