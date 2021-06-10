createPlayer5 = function()

	local playerId = 5

	Logic.SetPlayerName(5, String.MainKey.."_Player5Name")

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
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)
	
	if CP_Difficulty > 0 then
		for i = 1, 3 do
			UpgradeP5PoleArm()
			UpgradeP5Sword()
			UpgradeP5Bow()
		end
		UpgradeP5Cavalry()
		UpgradeP5HeavyCavalry()
	end
	
	setupArmyP5Attack()
	setupArmyP5Defense()
end


UpgradeP5PoleArm = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
end

UpgradeP5Sword = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
end

UpgradeP5Bow = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
end

UpgradeP5Cavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 5)
end

UpgradeP5HeavyCavalry = function()
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 5)
end

GiveP5ArmyResources = function()

	Tools.GiveResouces(5, 3000, 0, 1000, 0, 1000, 1000)

end