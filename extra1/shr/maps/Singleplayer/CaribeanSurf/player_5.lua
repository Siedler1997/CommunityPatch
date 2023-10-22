
createPlayer5 = function()

	--	describe the player structure

	local playerId = 5
	Logic.SetPlayerName(playerId, String.Player(playerId))

	
		player5 	= {}
		player5.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	7,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime			=	25
			},
			--------------------------------------------------
			resources = {
				gold				=	5000,
				clay				=	5000,
				iron				=	5000,
				sulfur				=	5000,
				stone				=	5000,
				wood				=	5000
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
		
		SetupPlayerAi(player5.id,description)

		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player5.id)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, player5.id)

local position = GetPosition("p5_3")


		construction	= {
								{ type	= Entities.PB_VillageCenter1	,	pos = position	,level=3		},					
								
							--	{ type	= Entities.PB_University1		,	pos = position			,	level = 1},
							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	},						

								{ type	= Entities.PB_StoneMine1		,	pos = position			},
							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	,	level = 1},							
							--	{ type	= Entities.PB_Tower1			,	pos = invalidPosition	,	level = 2},							

							
							--	{ type	= Entities.PB_ClayMine1			,	pos = position			},
							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	},
							--	{ type	= Entities.PB_Tower1			,	pos = invalidPosition	,	level = 2},							
							--	{ type	= Entities.PB_Brickworks1		,	pos = invalidPosition	,	level = 1},
							--	{ type	= Entities.PB_Sawmill1			,	pos = position			},

							--	{ type	= Entities.PB_Foundry1			,	pos = position			},
							--	{ type	= Entities.PB_Blacksmith1		,	pos = position			,	level = 1},
							--	{ type	= Entities.PB_Tower1			,	pos = invalidPosition	,	level = 2},							

								{ type	= Entities.PB_IronMine1			,	pos = position			},
							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	,	level = 1},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	,	level = 1},

							--	{ type	= Entities.PB_Bank1				,	pos = position			},

							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	,	level = 1},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	},
						}
						
		FeedAiWithConstructionPlanFile(5,construction)

local position = GetPosition("p5_4")


		construction	= {
							
								{ type	= Entities.PB_VillageCenter1		,	pos = position	, level=3		},
							--	{ type	= Entities.PB_ClayMine1		,	pos = position			},
											
						}
						
		FeedAiWithConstructionPlanFile(5,construction)

local position = GetPosition("p5_1")


		construction	= {
							
							--	{ type	= Entities.PB_VillageCenter1		,	pos = position	, level=3		},
								{ type	= Entities.PB_ClayMine1		,	pos = position			},
											
						}
						
		FeedAiWithConstructionPlanFile(5,construction)

local position = GetPosition("p5_2")


		construction	= {
							
							--	{ type	= Entities.PB_VillageCenter1		,	pos = position	, level=3		},
								{ type	= Entities.PB_SulfurMine1		,	pos = position			},
											
						}
						
		FeedAiWithConstructionPlanFile(5,construction)




	end
