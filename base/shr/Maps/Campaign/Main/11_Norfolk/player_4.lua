createPlayer4 = function()

	local playerId = 4
	Logic.SetPlayerName(4, String.MainKey.."_Player4Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		},
		--------------------------------------------------
		refresh = {
			gold				=	30,
			clay				=	10,
			iron				=	5,
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
	
	if CP_Difficulty > 0 then
		aiDescription.refresh = {
			gold				=	60,
			clay				=	20,
			iron				=	10,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	10
		}
		if CP_Difficulty == 2 then
			aiDescription.refresh.updateTime = 5
		end
	end

	SetupPlayerAi(playerId, aiDescription)

	local position = GetPosition("TowerIronCheck1")
	local position2 = GetPosition("P4BuildIronMines")
	
	local iron = 
			{
				{ type	= Entities.PB_Tower1		,	pos = position,	level = 2	},
				{ type	= Entities.PB_IronMine1		,	pos = position	},
				{ type	= Entities.PB_Farm1			,	pos = position	},
				{ type	= Entities.PB_Residence1	,	pos = position	},
				{ type	= Entities.PB_Tower1		,	pos = position2,	level = 2	},
				{ type	= Entities.PB_IronMine1		,	pos = position2	},
				{ type	= Entities.PB_Farm1			,	pos = position2	},
				{ type	= Entities.PB_Residence1	,	pos = position2	},
			}

	FeedAiWithConstructionPlanFile(playerId, iron)	

	if CP_Difficulty > 0 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBarbarian, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBarbarian, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
	end

	setupArmyP4Intruder()
	setupArmyP4Attacker()
	setupArmyP4Defense()
end