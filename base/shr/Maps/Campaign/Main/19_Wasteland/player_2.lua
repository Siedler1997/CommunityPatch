createPlayer2 = function()

	local playerId = 2
	Logic.SetPlayerName(2, "CM01_19_Wasteland_Txt/_Player2Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
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
			gold				=	30,
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
	local i
	for i=1,3 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
	end
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
		
	setupArmyLeftFortress()
end