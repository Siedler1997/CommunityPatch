createPlayer5 = function()

	local playerId = 5

	Logic.SetPlayerName(5, String.MainKey.."_Player5Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,

		-- max values that player may have at maximum! 
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

		-- every 10 seconds give new resources:
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

	if CP_Difficulty == 1 then
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

	-- create armys		
		setupArmyRaiding()
		setupArmyKerberosDefense()
	
		setupArmyDefendPrincess()
	

end


UpgradeP5Sword = function()

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)

end

UpgradeP5Pike = function()

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)

end

UpgradeP5Bow = function()

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)

end

UpgradeP5Cavalery = function()

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 5)

end

UpgradeP5HeavyCavalery = function()

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 5)

end