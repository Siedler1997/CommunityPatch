createPlayer2 = function()

			player2 					= {}
			player2.id 					= gvMission.PlayerIDFolklung
	
			Logic.SetPlayerName(gvMission.PlayerIDFolklung, String.MainKey.."_Player2Name")

	--	describe the player structure
			local description = {
		
				serfLimit				=	10,
				--------------------------------------------------
				extracting				=	false,
				--------------------------------------------------
				rebuild = {
					delay				=	0,
					randomTime			=	0
				},
				--------------------------------------------------
				resources = {
					gold				=	2000,
					clay				=	1000,
					iron				=	1500,
					sulfur				=	1000,
					stone				=	1000,
					wood				=	2000
				},
				--------------------------------------------------
				refresh = {
					gold				=	400,
					clay				=	30,
					iron				=	200,
					sulfur				=	50,
					stone				=	30,
					wood				=	100,
					updateTime			=	5
				},
			}
		
		Tools.GiveResouces(player2.id, 3000, 3000, 3000, 3000,3000, 3000)

		SetupPlayerAi(player2.id, description)	  
	
		for i = 1, 2 do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, player2.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, player2.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, player2.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, player2.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, player2.id)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, player2.id)
		end
end
