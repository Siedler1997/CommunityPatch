
createPlayer4 = function()

	--	describe the player structure

	local playerId = 4
	Logic.SetPlayerName(playerId, String.Player(playerId))

	
		player4 	= {}
		player4.id 	= playerId



	--	set up default information

		local description = {
		
			serfLimit				=	7,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
			rebuild = {
				delay				=	25,
				randomTime			=	25
			},
			--------------------------------------------------
			resources = {
				gold				=	10000,
				clay				=	5000,
				iron				=	10000,
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
		
		SetupPlayerAi(player4.id,description)

local position = GetPosition("construct2")


		construction	= {
								{ type	= Entities.PB_VillageCenter1	,	pos = position	,level=1		},					
								
							--	{ type	= Entities.PB_University1		,	pos = position			,	level = 1},
							--	{ type	= Entities.PB_Residence1		,	pos = invalidPosition	},
							--	{ type	= Entities.PB_Farm1				,	pos = invalidPosition	},						

							--	{ type	= Entities.PB_StoneMine1		,	pos = position			},
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
						
		FeedAiWithConstructionPlanFile(4,construction)

local position = GetPosition("construct3")


		construction	= {
							
								{ type	= Entities.PB_StoneMine1		,	pos = position			},
								{ type	= Entities.PB_ClayMine1		,	pos = position			},
											
						}
						
		FeedAiWithConstructionPlanFile(4,construction)



	end
