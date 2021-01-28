createPlayer6 = function()

	local playerId = 6

	Logic.SetPlayerName(6, String.MainKey.."_Player6Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
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

	if CP_Difficulty == 1 then
		local towers1 = { Logic.GetPlayerEntities(6, Entities.PB_Tower2, 5, 0) }
		for i = 1, table.getn(towers1) do
			if IsExisting(towers1[i]) then
				GUI.UpgradeSingleBuilding(towers1[i])		
			end
		end

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

	local i
	for i=1,3 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
	end

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)
end