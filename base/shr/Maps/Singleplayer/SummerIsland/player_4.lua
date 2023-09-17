createPlayer4 = function()

	local playerId = 4

	Logic.SetPlayerName(playerId, String.Player(playerId))

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
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	5
		},
		--------------------------------------------------
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
				delay				=	5,
				randomTime			=	10
			}	
	}
	SetupPlayerAi(playerId,aiDescription)
	
	setupArmyP4Defense()
end


UpgradeP4PoleArm = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
end

UpgradeP4Sword = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
end

UpgradeP4Bow = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
end

UpgradeP4Cavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 4)
end

UpgradeP4HeavyCavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 4)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 4)
end

GiveP4ArmyResources = function()

	Tools.GiveResouces(4, 3000, 0, 1000, 0, 1000, 1000)

end