-- Kerberos' Outposts

createPlayer4 = function()


	--	describe the player structure
	
		player4 					= {}
		player4.id 					= 4

	--	set up default information
	
		if CP_Difficulty == 0 then
			MapEditor_SetupAI(player4.id, 2, 3000, 3, "outpost", 1, 0, true)
		elseif CP_Difficulty == 1 then
			MapEditor_SetupAI(player4.id, 3, 5000, 3, "outpost", 2, 0, true)
		else
			MapEditor_SetupAI(player4.id, 3, 5000, 3, "outpost", 3, 0, true)
		end
		local description = {
		
			serfLimit				=	4+2*CP_Difficulty,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			rebuild = {
				delay				=	5,
				randomTime			=	5
			}
		}

		if CP_Difficulty == 0 then
			description.resources = {
				gold				=	2000,
				clay				=	1000,
				iron				=	1500,
				sulfur				=	1000,
				stone				=	1000,
				wood				=	2000
			}

			description.refresh = {
				gold				=	100,
				clay				=	10,
				iron				=	100,
				sulfur				=	50,
				stone				=	10,
				wood				=	100,
				updateTime			=	5
			}
		else
			description.resources = {
				gold				=	3000,
				clay				=	1000,
				iron				=	2000,
				sulfur				=	1500,
				stone				=	1000,
				wood				=	2000
			}

			description.refresh = {
				gold				=	300,
				clay				=	20,
				iron				=	200,
				sulfur				=	150,
				stone				=	50,
				wood				=	150,
				updateTime			=	5
			}
		end
		
		SetupPlayerAi(player4.id,description)
	
	end
