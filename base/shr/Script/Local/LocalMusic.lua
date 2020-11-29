--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Musik Script
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

LocalMusic = {}

--LocalMusic.MusicPath = "base\\shr\\music\\"

LocalMusic.SetEurope = {}
LocalMusic.SetEurope["summer"] = 		{
										{ "06_MiddleEurope_Summer1.mp3", 149 },										
										{ "07_MiddleEurope_Summer2.mp3", 165 },
										{ "08_MiddleEurope_Summer3.mp3", 168 },
										{ "09_MiddleEurope_Summer4.mp3", 160 },
										{ "10_MiddleEurope_Summer5.mp3", 158 },
										{ "11_MiddleEurope_Summer6.mp3", 153 },
										{ "12_MiddleEurope_Summer7.mp3", 155 },
										{ "13_MiddleEurope_Summer8.mp3", 156 },
										{ "14_MiddleEurope_Summer9.mp3", 138 }
										}


LocalMusic.SetMediterranean ={}
LocalMusic.SetMediterranean["summer"] = {
										{ "15_Mediterranean_Summer1.mp3", 165 },
										{ "16_Mediterranean_Summer2.mp3", 142 },
										{ "09_MiddleEurope_Summer4.mp3", 160 },
										{ "10_MiddleEurope_Summer5.mp3", 158 },
										{ "11_MiddleEurope_Summer6.mp3", 153 }
										
										}

LocalMusic.SetHighland = {}
LocalMusic.SetHighland["summer"] = 		{
										{ "17_Highland_Summer1.mp3", 150 },
										{ "18_Highland_Summer2.mp3", 137 },
										{ "12_MiddleEurope_Summer7.mp3", 155 },
										{ "13_MiddleEurope_Summer8.mp3", 156 },
										{ "14_MiddleEurope_Summer9.mp3", 138 }
										}


LocalMusic.SetEvelance = {}
LocalMusic.SetEvelance["summer"] = 		{
										{ "19_Evelance_Summer1.mp3", 154 },
										{ "20_Evelance_Summer2.mp3", 152 },
										{ "21_Evelance_Summer3.mp3", 165 },
										{ "22_Evelance_Summer4.mp3", 150 },
										{ "23_Evelance_Summer5.mp3", 158 },
										{ "24_Evelance_Summer6.mp3", 168 }
										}


LocalMusic.SetEurope["snow"] = 			{
										{ "25_MiddleEurope_Winter1.mp3", 144 },
										{ "26_MiddleEurope_Winter2.mp3", 165 },						
										{ "30_MiddleEurope_Winter3.mp3", 156 },
										{ "28_Highland_Winter1.mp3", 135 }, 
										{ "27_Mediterranean_Winter1.mp3", 164 }, 
										{ "29_Evelance_Winter1.mp3", 135 }
										}


LocalMusic.SetEvelance["snow"] =		{
										{ "19_Evelance_Summer1.mp3", 154 }, 
										{ "20_Evelance_Summer2.mp3", 152 }, 
										{ "21_Evelance_Summer3.mp3", 165 },
										{ "22_Evelance_Summer4.mp3", 150 }, 
										{ "23_Evelance_Summer5.mp3", 158 }, 
										{ "24_Evelance_Summer6.mp3", 168 }
										}


LocalMusic.SetHighland["snow"] =		{
										{ "25_MiddleEurope_Winter1.mp3", 144 }, 
										{ "26_MiddleEurope_Winter2.mp3", 165 }, 
										{ "30_MiddleEurope_Winter3.mp3", 156 },
										{ "28_Highland_Winter1.mp3", 135 }, 
										{ "27_Mediterranean_Winter1.mp3", 164 }, 
										{ "29_Evelance_Winter1.mp3", 135 }
										} 


LocalMusic.SetMediterranean["snow"] =	{
										{ "25_MiddleEurope_Winter1.mp3", 144 }, 
										{ "26_MiddleEurope_Winter2.mp3", 165 }, 
										{ "30_MiddleEurope_Winter3.mp3", 156 },
										{ "28_Highland_Winter1.mp3", 135 }, 
										{ "27_Mediterranean_Winter1.mp3", 164 }, 
										{ "29_Evelance_Winter1.mp3", 135 }
										}
										
LocalMusic.SetBattle=  					{
										{ "03_CombatEurope1.mp3", 117 },
										{ "04_CombatMediterranean1.mp3", 113 },
										{ "05_CombatEvelance1.mp3", 117 }
										}

LocalMusic.SetMainTheme=				{
										{ "01_MainTheme1.mp3", 152 },
										{ "02_MainTheme2.mp3", 127 }
										}

LocalMusic.SetBriefing=					{										
										{ "Win.mp3", 33 }
										}


HIGHLANDMUSIC 		= LocalMusic.SetHighland
EUROPEMUSIC 		= LocalMusic.SetEurope
MEDITERANEANMUSIC	= LocalMusic.SetMediterranean
EVELANCEMUSIC		= LocalMusic.SetEvelance


LocalMusic.UseSet = EUROPEMUSIC

LocalMusic.SongLength = 0
LocalMusic.BattlesOnTheMap = 0
LocalMusic.LastBattleMusicStarted = 0

function
LocalMusic_UpdateMusic()

	if LocalMusic.BattlesOnTheMap == 0 then
		--Music is playing?
		if  LocalMusic.SongLength  > Logic.GetTime() then	 
			return
		end	
	end

	--get current Weather
	local Weather = Logic.GetWeatherState()
	
	if Weather == 1 then
		--normal
		Weather = "summer"
	elseif Weather == 2 then
		--rain
		Weather = "snow"
	elseif Weather == 3 then
		--snow
		Weather = "snow"
	end
	
	local SetToUse
	
	if LocalMusic.BattlesOnTheMap == 1 then
		SetToUse = LocalMusic.SetBattle
	else
		SetToUse = LocalMusic.UseSet[Weather]
	end
	
	--is briefing running?
 	if IsBriefingActive ~= nil and IsBriefingActive() == true then
		SetToUse = LocalMusic.SetBriefing
	end
	
	
	local SongAmount = table.getn(SetToUse)
	local Random = 1 + XGUIEng.GetRandom(SongAmount-1)
	local SongToPlay = Folders.Music .. SetToUse[Random][1]	
	
	
	Sound.StartMusic( SongToPlay, 127)
	LocalMusic.SongLength =  Logic.GetTime() + SetToUse[Random][2] + 2
	
	LocalMusic.BattlesOnTheMap = 0
	
	--GUI.AddNote(SetToUse[Random][1] .. " is currently playing")
	

end

-----------------------------------------------------------------------------
--Start battle music
function
LocalMusic.CallbackSettlerKilled(_HurterPlayerID, _HurtPlayerID)
	
	local PlayerID = GUI.GetPlayerID()
	
	if _HurterPlayerID ~= _HurtPlayerID 
	and PlayerID == _HurtPlayerID  then		
		if LocalMusic.LastBattleMusicStarted < Logic.GetTime() then		
			LocalMusic.BattlesOnTheMap = 1
			LocalMusic.LastBattleMusicStarted = Logic.GetTime() + 127
			LocalMusic.SongLength = 0
		end
	end
end