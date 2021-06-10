createPlayer5 = function()

	local playerId = 5
	Logic.SetPlayerName(5, "CM01_17_CloudyMountains_Txt/_Player5Name")


	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		extracting = false
	}
	if CP_Difficulty == 0 then
		aiDescription.resources = {
			gold				=	1000,
			clay				=	400,
			iron				=	400,
			sulfur				=	400,
			stone				=	400,
			wood				=	400
		}

		aiDescription.refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	10
		}
	else
		aiDescription.resources = {
			gold				=	2000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		}

		aiDescription.refresh = {
			gold				=	40,
			clay				=	20,
			iron				=	20,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	5
		}
	end

	SetupPlayerAi(playerId,aiDescription)

	-- upgrade soldiers
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	
	if CP_Difficulty == 2 then
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	end

	setupArmyAI1Attack()
	setupArmyAI1DefendIron()
	setupArmyAI1Defense()
end