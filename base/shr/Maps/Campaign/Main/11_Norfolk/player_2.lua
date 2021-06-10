createPlayer2 = function()

	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")


	--	set up  player ai
	
	--MapEditor_SetupAI(playerId, 1, 3000, 0, "Player2", 1, 0)
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
			iron				=	20,
			sulfur				=	1,
			stone				=	20,
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
			iron				=	40,
			sulfur				=	5,
			stone				=	40,
			wood				=	20,
			updateTime			=	10
		}
		if CP_Difficulty == 2 then
			aiDescription.refresh.updateTime = 5
		end
	end

	SetupPlayerAi(playerId, aiDescription)

	local position = GetPosition("SulfurTowerCheck")
	
	local sulfur = 
				{
					{ type	= Entities.PB_Tower1			,	pos = position,	level = 2	},
					{ type	= Entities.PB_SulfurMine1		,	pos = position	},
					{ type	= Entities.PB_Farm1				,	pos = position	},
					{ type	= Entities.PB_Residence1		,	pos = position	},
					{ type	= Entities.PB_Tower1			,	pos = position,	level = 2	},
					{ type	= Entities.PB_SulfurMine1		,	pos = position	},
					{ type	= Entities.PB_Farm1				,	pos = position	},
					{ type	= Entities.PB_Residence1		,	pos = position	},
				}
	FeedAiWithConstructionPlanFile(playerId, sulfur)	

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	if CP_Difficulty > 0 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
	end
	setupArmyP2Attacker()
	setupArmyP2Defense()
	
end