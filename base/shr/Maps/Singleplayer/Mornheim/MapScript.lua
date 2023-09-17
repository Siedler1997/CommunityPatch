--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- Include main function
Script.Load( "Data\\Script\\MapTools\\Main.lua" )

IncludeLocals("briefing")
IncludeLocals("gameConditions")
IncludeLocals("player1")

IncludeLocals("player2")
IncludeLocals("armyCorps11")
IncludeLocals("armyCorps12")

IncludeLocals("player3")
IncludeLocals("armyTroops101A")
IncludeLocals("armyTroops101B")
IncludeLocals("armyDespair1")

IncludeLocals("player4")
IncludeLocals("armyTroopsRD")
IncludeLocals("armyNorth")
IncludeLocals("armyDespair2")

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to initialize the diplomacy states
function Mission_InitDiplomacy()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile 	)	
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Hostile  	)	
	
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral	)	
	Logic.SetDiplomacyState( 2, 5, Diplomacy.Neutral	)	
	Logic.SetDiplomacyState( 3, 5, Diplomacy.Neutral	)	
	Logic.SetDiplomacyState( 4, 5, Diplomacy.Neutral	)	

	end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game to initialize player colors
function Mission_InitPlayerColorMapping()
		local p1color = GetPlayerPreferredColor()
		Display.SetPlayerColorMapping(1, p1color)
		if p1color == 2 then
			Display.SetPlayerColorMapping(2, BARBARIAN_COLOR)	-- 
		elseif p1color == 3 then
			Display.SetPlayerColorMapping(3, PLAYER_FRIEND_COLOR)		-- 
		end

		--Display.SetPlayerColorMapping(3, ENEMY_COLOR1)		-- 
		--Display.SetPlayerColorMapping(4, PLAYER_FRIEND_COLOR)		-- 
		Display.SetPlayerColorMapping(5, CLEYCOURT_COLOR)	-- 
		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called from main script to init all resources for player(s)
function Mission_InitResources()
	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called to setup Technology states on mission start
function Mission_InitTechnologies()
	ResearchAllMilitaryTechs(2)
	ResearchAllMilitaryTechs(3)
	ResearchAllMilitaryTechs(4)
	ResearchAllMilitaryTechs(5)
	ResearchAllMilitaryTechs(6)
	ResearchAllMilitaryTechs(7)
	ResearchAllMilitaryTechs(8)
end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start to initialize ai for all ai players
function Mission_InitAI()


	end


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	Display.SetRenderUseGfxSets(1)
	
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()

	
	Logic.SetupGfxSet(1)
	
	Logic.AddWeatherElement(1, 600, 1, 1, 5, 10)
	Logic.AddWeatherElement(2,  90, 1, 2, 5, 10)
  
 
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function Mission_FirstMapAction()


	String.Init("SP01_07_Mornheim")

	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Construction   	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_GearWheel      	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_ChainBlock     	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Architecture   	,2 )

	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Alchemy        	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Alloying       	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Metallurgy     	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Chemistry      	,2 )
                             
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Taxation       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Trading        	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Banking        	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Gilds          	,2 )
                             
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Literacy       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Laws           	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Printing       	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Library        	,2 )
                             
                             
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Mercenaries    	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_StandingArmy   	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Tactics        	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Strategies     	,2 )
                             
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.GT_Beautification 	,2 )



	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Alchemist        	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Archery          	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Bank             	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Barracks         	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Beautification01 	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Beautification02 	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Beautification03 	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Blacksmith       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Brickworks       	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Claymine         	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Farm             	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Foundry          	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Headquarter      	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Ironmine         	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Market           	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Monastery        	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Outpost          	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Residence        	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Sawmill          	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Stables          	,2 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_StoneMason       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Stonemine        	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Sulfurmine       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Tower            	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_University       	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Village          	,3 )
	Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Weathermachine   	,2 )

	--	set up all players

		setupPlayer1()
		setupPlayer2()
		setupPlayer3()
		setupPlayer4()

		
		Logic.SetPlayerName(5, String.MainKey.."_Player5Name")

		--Input.KeyBindDown(Keys.S, "Logic.SetTechnologyState(1,Technologies.T_SuperTechnology,3)")

	--	debugging support

	--	EnableDebugging()

	-- Set Music-Set
	
		LocalMusic.UseSet = EUROPEMUSIC

	--	start time line support

		TimeLine.Start()
	
	--	check victory and defeat conditions
	
		StartJob("GameConditions")

	--	create the briefing
	
		createBriefing()	
	
	--	chest stuff
		
		--	the openers
		
			CreateChestOpener("hero1")
			CreateChestOpener("hero2")
			CreateChestOpener("hero3")
			CreateChestOpener("hero4")
			CreateChestOpener("hero5")
	
		--	create some random chests
	
			CreateRandomChests()

		--	go!
		
			StartChestQuest()

			--Tools.ExploreArea(-1, -1, 900)
	end

