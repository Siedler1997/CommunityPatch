createPlayer2 = function()

	local playerId = 2

	Logic.SetPlayerName(playerId, String.Player(playerId))

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	7,
		
		resourceFocus 			= ResourceType.WoodRaw,
		--------------------------------------------------
		resources = {
			gold				=	3000,
			clay				=	1000,
			iron				=	1000,
			sulfur				=	1000,
			stone				=	1000,
			wood				=	1500
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	20,
			updateTime			=	5
		},
		--------------------------------------------------
		extracting = true,
		--------------------------------------------------
		rebuild	=	{
				delay				=	5,
				randomTime			=	10
			},	
	}

	
	SetupPlayerAi(playerId,aiDescription)


	
	-- Armies
	setupArmyP2Defense()
	setupArmyP2Attack()
	setupArmyP2CavalryAttack()



	-- Resource booster
	TimeLine.Enter("Start with resource boosting", TimeLine.Seconds + 40*60, "GiveP2ArmyResources")



	--	create village

		local position = GetPosition("P2HQ")
		
		local EnemyVillage = 
					{
						{ type	= Entities.PB_ClayMine1,	pos = position						},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},
						{ type	= Entities.PB_Farm1		,	pos = invalidPosition				},
						{ type	= Entities.PB_Brickworks1,	pos = invalidPosition				},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},
						{ type	= Entities.PB_Tower1, 		pos = invalidPosition, level = 1	},

						{ type	= Entities.PB_Sawmill1	,	pos = position						},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},
						{ type	= Entities.PB_Farm1		,	pos = invalidPosition				},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},

						{ type	= Entities.PB_IronMine1,	pos = position						},
						{ type	= Entities.PB_Farm1		,	pos = invalidPosition				},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},
						{ type	= Entities.PB_Tower1, 		pos = invalidPosition, level = 1	},
						{ type	= Entities.PB_Tower1, 		pos = invalidPosition, level = 1	},

						{ type	= Entities.PB_ClayMine1,	pos = position						},
						{ type	= Entities.PB_Farm1		,	pos = invalidPosition				},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition				},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition, level = 2	},
						{ type	= Entities.PB_Tower1, 		pos = invalidPosition, level = 2	},

						{ type	= Entities.PB_Beautification01	,	pos = position				},

						{ type	= Entities.PB_Monastery1,	pos = position						},
						{ type	= Entities.PB_Residence1,	pos = invalidPosition, level = 2	},
						{ type	= Entities.PB_Farm1		,	pos = invalidPosition, level = 2	},

						{ type	= Entities.PB_Beautification02	,	pos = position				},
						{ type	= Entities.PB_Beautification03	,	pos = position				},

						{ type	= Entities.PB_Bank1	,			pos = position						},
						{ type	= Entities.PB_Residence1,		pos = invalidPosition, level = 2	},
						{ type	= Entities.PB_Farm1		,		pos = invalidPosition, level = 2	},
						{ type	= Entities.PB_Beautification01,	pos = invalidPosition				},
						{ type	= Entities.PB_Beautification03,	pos = invalidPosition				}

					}
					
					
	FeedAiWithConstructionPlanFile(playerId, EnemyVillage)
	
	local researchFile =	{
            					{ type	= Entities.PB_Residence1,   prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Residence1,   prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Farm1,   		prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Residence1,   prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Farm1,   		prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Tower1,   	prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Tower1,   	prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Farm1,   		prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Tower1,   	prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Residence1,   prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Farm1,   		prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Tower1,   	prob = 100, command = UPGRADE}

	    					}
	    
	FeedAiWithResearchPlanFile(playerId, researchFile)

	AI.Player_SetResourceLimits(2, 1000, 1500, 1500, 1500, 1500, 1500)


end






UpgradeP2PoleArm = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
end

UpgradeP2Sword = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
end

UpgradeP2Bow = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
end

UpgradeP2Cavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
end

UpgradeP2HeavyCavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
end

GiveP2ArmyResources = function()

	Tools.GiveResouces(2, 3000, 0, 1000, 0, 1000, 1000)

	local randomTime = Logic.GetRandom(15)

	TimeLine.Enter("P2 Resource Boost", TimeLine.Seconds + (randomTime+30)*60, "GiveP2ArmyResources")

end