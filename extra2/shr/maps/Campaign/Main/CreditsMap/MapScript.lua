--------------------------------------------------------------------------------
-- MapName: 	Credits
--------------------------------------------------------------------------------
-- This is a special map for the Games Convention 2004 in Leibzig
--
-- Cheats: See SpecialKeybindings()


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start and after save game is loaded, setup your weather gfx
-- sets here
function Mission_InitWeatherGfxSets()

	-- Use gfx sets
	Display.SetRenderUseGfxSets(1)
	
	-- Use normal weather gfx set
	WeatherSets_SetupNormal(1)
	WeatherSets_SetupRain(2)
	WeatherSets_SetupSnow(3)

end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start you should setup your weather periods here
function Mission_InitWeather()
	
	-- Init with gfx set 1
	Logic.SetupGfxSet(1)
	
	-- Only summer weather period 	
	Logic.AddWeatherElement(1, 3000,1,1,5,10)
	
end
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- This function is called on game start after all initialization is done
function  GameCallback_OnGameStart() 	
	
	XGUIEng.ShowWidget("Normal",0)
	XGUIEng.ShowWidget("3dOnScreenDisplay",0)
	XGUIEng.ShowWidget("Movie",1)
	
	
	
	--Include Support functions
	Script.Load( "Data\\Script\\MapTools\\Main.lua")
	Script.Load(Folders.MapTools.."Ai\\Support.lua")	
	Script.Load( Folders.MapTools.."WeatherSets.lua" )
	Script.Load( Folders.Map.."Cutscene_Control.lua" )
	
	
	--Preload all models
	Display.LoadAllModels()
	
	Display.SetPlayerColorMapping(1, GetPlayerPreferredColor())		
	
	Mission_InitWeatherGfxSets()
	Mission_InitWeather()
	
	
	-- Change music
	local MusicPath = "music\\"
	local SongNumber = 1 + XGUIEng.GetRandom( 1 )
	
	
	Music.Start( MusicPath .. "0" .. SongNumber .. "_MainTheme" .. SongNumber ..".mp3" , 100, 1 )
	
	Trigger.RequestTrigger(Events.LOGIC_EVENT_EVERY_SECOND, NIL, "MissionScriptingEverySecond", 1)
	gvCreditsTime = 0
	gvCreditsCounter = 0
	gvCreditsWaitTime = 5
	
	
	Display.SetRenderSky(1)
	GUI.SetFeedbackSoundOutputState(0)		
	Display.SetProgramOptionRenderOcclusionEffect(0)
	-- cutscene input mode
	Input.CutsceneMode()
	-- toggle FoW		
	Display.SetRenderFogOfWar(0) 
	GUI.MiniMap_SetRenderFogOfWar(0)
end



function
MissionScriptingEverySecond()
	
	
	if Logic.GetTime() == 1 then
		Cutscene.Start("Credits")
	end
	
	if gvCreditsCounter <= 25 then
		if gvCreditsTime < (Logic.GetTime()) then			
			local String = "Credits/Credits[" .. gvCreditsCounter .. "]"
			local StringTitle= "Credits/CreditsTitle[" .. gvCreditsCounter .. "]"
	
			XGUIEng.SetText( "CreditsWindowTextTitle", XGUIEng.GetStringTableText(StringTitle) )		
			XGUIEng.SetText( "CreditsWindowText", XGUIEng.GetStringTableText(String) )					
			gvCreditsTime = Logic.GetTime() + gvCreditsWaitTime
			gvCreditsCounter = gvCreditsCounter + 1
		end
	end
	if gvCreditsCounter == 25 then
		gvCreditsCounter = 0
		
	end
end