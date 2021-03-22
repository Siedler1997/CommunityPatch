-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "CREDTISFLIGHT"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Credits_Start()
	--Interface_SetCinematicMode(1)
	
		
	Display.SetRenderUseGfxSets(0)
	
	Display.SetRenderFog (1)
	Display.SetFogStartAndEnd ( 5400,19800)
    
    Display.SetGlobalLightDiffuse(205,204,180)
    Display.SetGlobalLightAmbient(120,110,110)
    Display.SetFogColor (152,172,182)
	

end



function Cutscene_Credits_NormalMusic()
	LocalMusic.SongLength = 50000
	Music.Start( "music\\40_Extra1_BridgeBuild.mp3" , 127, 1 )
end

function Cutscene_Credits_FightMusic()
	Music.Start( "music\\43_Extra1_DarkMoor_Combat.mp3" , 127, 1 )
	Mission_CreateAttackers()
end

function Cutscene_Credits_FogMusic()
	Music.Start( "music\\41_Extra1_DarkMoor_Theme1.mp3" , 127, 1 )
end


function Cutscene_Credits_QueenAttack()
	Input.GameMode()
	GUI.SettlerCircularAttack(GetID("Queen"))
	Input.CutsceneMode()
	Sound.PlayGUISound(Sounds.AOVoicesHero12_HERO12_poisonrange_rnd_02)
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Credits_Cancel()
	 -- Close game directly
	Framework.CloseGame()
	
	
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Credits_Finished()
	
	Cutscene.Start("Credits")
	 	
end

