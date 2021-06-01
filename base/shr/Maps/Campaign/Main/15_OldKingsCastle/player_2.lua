
-- Kerberos army South

createPlayer2 = function()

	local playerId = 2

	--Logic.SetPlayerName(2, String.MainKey.."_Player2Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	1000,
			clay				=	400,
			iron				=	400,
			sulfur				=	400,
			stone				=	400,
			wood				=	400
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
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)
	
	setupArmyP2Defense()
	setupArmyP2FirstAttack()
	setupArmyP2IronAttack()
	setupArmyP2Intruder()
	setupArmyP2VillageAttack()

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

end