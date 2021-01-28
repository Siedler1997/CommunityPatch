
createPlayer2 = function()

	--	describe the player structure

	local playerId = 2
	--Logic.SetPlayerName(playerId, String.Player(playerId))
	
		Player2 					= {}
		Player2.id 					= playerId

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	true,
			--------------------------------------------------
			resources = {
				gold				=	10000,
				clay				=	10000,
				iron				=	10000,
				sulfur				=	10000,
				stone				=	10000,
				wood				=	10000
			},
			--------------------------------------------------
			refresh = {
				gold				=	5,
				clay				=	5,
				iron				=	5,
				sulfur				=	5,
				stone				=	5,
				wood				=	5,
				updateTime			=	15
			},
			--------------------------------------------------
			--rebuild	=	{
			--		delay			=	5,
			--		randomTime		=	10
			--	},		
		}

		if CP_Difficulty == 1 then
			description.refresh = {
				gold				=	30,
				clay				=	20,
				iron				=	20,
				sulfur				=	20,
				stone				=	20,
				wood				=	20,
				updateTime			=	10
			}
		end

		SetupPlayerAi(Player2.id,description)


--[[	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2) ]]

		if CP_Difficulty == 1 then
			for i = 1, 3 do
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
				Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
			end
			
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 2)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 2)
		end
end
