
createPlayer4 = function()

	--	describe the player structure

	local playerId = 4
	Logic.SetPlayerName(playerId, String.MainKey.."_Player4Name")

	
		player4 	= {}
		player4.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	3,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
		--	rebuild = {
		--		delay				=	25,
		--		randomTime			=	25
		--	},
			--------------------------------------------------
			resources = {
				gold				=	1000,
				clay				=	1000,
				iron				=	1000,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	1000
			},
			--------------------------------------------------
			refresh = {
				gold				=	3,
				clay				=	3,
				iron				=	3,
				sulfur				=	3,
				stone				=	3,
				wood				=	3,
				updateTime			=	2
			},
		}
		
		SetupPlayerAi(player4.id,description)
		
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, playerId)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, playerId)

--local position = GetPosition("p4_base1")


--		construction	= {
--							        { type	= Entities.PB_IronMine1	,	pos = position			},					
--							        { type	= Entities.PB_SulfurMine1	,	pos = position			},					
--														
--							
--						}
--						
--		FeedAiWithConstructionPlanFile(4,construction)


	end
