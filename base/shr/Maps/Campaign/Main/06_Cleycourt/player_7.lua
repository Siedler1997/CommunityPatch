createPlayer7 = function()

	local playerId = 7
	Logic.SetPlayerName(7, String.MainKey.."_Player7Name")

	--	set up  player ai
	
	local aiDescription = {
	
		serfLimit				=	1,
		--------------------------------------------------
		resources = {
			gold				=	1000,
			clay				=	200,
			iron				=	200,
			sulfur				=	200,
			stone				=	200,
			wood				=	300
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
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
			delay				=	30,
			randomTime			=	30
		}
	}
	SetupPlayerAi(playerId,aiDescription)

	--	create village

	local position = GetPosition("P7DefendPos")
	local towerLevel = 1
	if CP_Difficulty == 2 then
		towerLevel = towerLevel + 1
	end

	local ironVillage = 
				{
					{ type	= Entities.PB_VillageCenter1	,	pos = position	},
					{ type	= Entities.PB_Tower1			,	pos = GetPosition("P7TowerPos"),	level = towerLevel	},
					{ type	= Entities.PB_IronMine1			,	pos = position	},
					{ type	= Entities.PB_Farm1				,	pos = position	},
					{ type	= Entities.PB_Residence1		,	pos = position	},
					{ type	= Entities.PB_Tower1			,	pos = position,			level = towerLevel	}
				}
	FeedAiWithConstructionPlanFile(playerId, ironVillage)
	
	setupArmyP7Defense()
	setupArmyP7IronMine()
	
end