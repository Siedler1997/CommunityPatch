createPlayer6 = function()

	local playerId = 6

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
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)
	
	setupArmyP6Defense()
	--setupArmyP6IronMine()
	--setupArmyP6StoneMine()
end


UpgradeP6PoleArm = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 6)
end

UpgradeP6Sword = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 6)
end

UpgradeP6Bow = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
end

UpgradeP6Cavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
end

UpgradeP6HeavyCavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)
end

UpgradeP6Rifle = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 6)
end

GiveP6ArmyResources = function()

	Tools.GiveResouces(6, 3000, 0, 1000, 0, 1000, 1000)

end