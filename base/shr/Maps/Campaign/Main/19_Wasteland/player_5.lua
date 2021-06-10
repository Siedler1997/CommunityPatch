createPlayer5 = function()

	local playerId = 5
	Logic.SetPlayerName(5, "CM01_19_Wasteland_Txt/_Player5Name")

	--	set up  player ai
	
	if CP_Difficulty > 0 then
		MapEditor_SetupAI(playerId, 1, 5000, 1, "KI3_HQ", 2, 0)
		--Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral )
	end
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

	if CP_Difficulty > 0 then
		aiDescription.refresh = {
			gold				=	30,
			clay				=	20,
			iron				=	20,
			sulfur				=	20,
			stone				=	20,
			wood				=	20,
			updateTime			=	10
		}
	end

	SetupPlayerAi(playerId,aiDescription)
	--[[
	-- upgrade soldiers
	local i
	for i=1,3 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	end
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 5)
	--]]
	setupArmyRightFortress()
	setupArmyCenterOutpost()
end