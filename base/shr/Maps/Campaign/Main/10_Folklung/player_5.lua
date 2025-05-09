createPlayer5 = function()

			player5 					= {}
			player5.id 					= gvMission.PlayerIDBesieger
	
			Logic.SetPlayerName(gvMission.PlayerIDBesieger, String.MainKey.."_Player5Name")

	--	describe the player structure
			local description = {
		
				serfLimit				=	4,
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
					gold				=	100,
					clay				=	10,
					iron				=	100,
					sulfur				=	50,
					stone				=	10,
					wood				=	100,
					updateTime			=	5
				},
			}

		if CP_Difficulty == 2 then
			description.serfLimit = 8
			description.rebuild	=	{
				delay				=	30,
				randomTime			=	30
			}
		end

		SetupPlayerAi(player5.id, description)	  
	
end
