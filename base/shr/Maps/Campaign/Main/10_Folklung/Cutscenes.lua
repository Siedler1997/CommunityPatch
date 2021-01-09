--------------------------------------------------------------------------------
-- E3_Folklung_Cutscenes
--
-- Author: Yvonne Kneisel
--
-- Last update: 04.05.2004
--------------------------------------------------------------------------------
	--Here because we want to reload it during the game
	-- Tables for Camera Pos, orientation, distance and angle
	gvMission_TargetCameraTable1  = {32043.00,  8230.00,  76.47, 	2500, 		 8}--start swamp	
	gvMission_TargetCameraTable2  = {32800.00, 11140.78, -12.00, 	3400, 		17}--swamp direction
	gvMission_TargetCameraTable3  = {33340.00, 15967.00, -35.00, 	4646, 		15}--burning house
	gvMission_TargetCameraTable4  = {33700.00, 18000.00, -45.00, 	3200, 		12}--close up burning haus 
	gvMission_TargetCameraTable5  = {34540.00, 24100.00,   2.66, 	5580, 		13}--city1
	gvMission_TargetCameraTable6  = {32340.00, 26600.00,  23.66, 	7580, 		18}--city2
	gvMission_TargetCameraTable7  = {25850.00, 27350.00,  55.00, 	5580, 		 9}--city3
	gvMission_TargetCameraTable8  = {24600.00, 29300.00,  37.00, 	5580, 		 3}--city4
	gvMission_TargetCameraTable9  = {24173.00, 28450.00,  21.98, 	4900, 		 1}--under the castle
	gvMission_TargetCameraTable10 = {22570.00, 29245.61,  37.98, 	6900, 		 5}--mountain
	gvMission_TargetCameraTable11 = {13054.00, 29931.00,  37.00, 	3500, 		10}--in between (river)
	gvMission_TargetCameraTable12 = { 8445.00, 27148.00, 110.00, 	4900, 		12}--battlefield front
	gvMission_TargetCameraTable13 = {8739.00, 27345.00, 212.00, 	4900, 		18}--fake for turnaround
	gvMission_TargetCameraTable14 = { 9887.00, 28119.00, 270.66, 	4900, 		10}--battlefield back
	gvMission_TargetCameraTable15 = { 9887.00, 28119.00, -90.66, 	4900, 		10}--battlefield back
	
		
	-- Duration of Cutscene
	gvMission_CameraDuration1 	= 6.5			-- Duration for part 1
	gvMission_CameraDuration2 	= 5.5			-- Duration for part 2
	gvMission_CameraDuration3 	= 6			-- Duration for part 3
	gvMission_CameraDuration4 	= 4			-- Duration for part 4
	gvMission_CameraDuration5 	= 3			-- Duration for part 5
	gvMission_CameraDuration6 	= 3			-- Duration for part 6
	gvMission_CameraDuration7 	= 2			-- Duration for part 7
	gvMission_CameraDuration8 	= 5			-- Duration for part 8
	gvMission_CameraDuration9 	= 5			-- Duration for part 9
	gvMission_CameraDuration10 	= 6			-- Duration for part 10
	gvMission_CameraDuration11 	= 3			-- Duration for part 11
	gvMission_CameraDuration12 	= 2			-- Duration for part 12
	gvMission_CameraDuration13 	= 1.5			-- Duration for part 13
	gvMission_CameraDuration14 	= 5			-- Duration for part 14
	
	gvMission_CutsceneParts	= 14			-- Single Parts of Cutscene



function MissionCamera_Init()
	-- Cutscene in progress
	gvMissionCamera_CutsceneStarted 	= 0 -- 14
	gvCamera_CutsceneStartTime	= 0
	gvMissionCamera_CutsceneEnded	 	= 0 
		
end

function Dummy_CutsceneOff()
	Interface_SetCinematicMode(0)
end

--------------------------------------------------------------------------------------
-- Camera-Functions
--------------------------------------------------------------------------------------


-- Set start camera
function MissionCamera_StartPosition(_Camera)

	local CameraLookAt_x 	= _Camera[1]
	local CameraLookAt_y 	= _Camera[2]
	local RotAngel			= _Camera[3]
	local ZoomDistance		= _Camera[4]
	local ZoomAngel			= _Camera[5]

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	
end


-- Interpolate Camera Flight from Current Position to Target Position in _Time seconds
function MissionCamera_Flyby(_Camera, _Duration)

	local CameraLookAt_x 	= _Camera[1]
	local CameraLookAt_y 	= _Camera[2]
	local RotAngel			= _Camera[3]
	local ZoomDistance		= _Camera[4]
	local ZoomAngel			= _Camera[5]
         
	Camera.ZoomSetDistanceFlight(ZoomDistance, _Duration)
	Camera.ZoomSetAngleFlight(ZoomAngel, _Duration)
	Camera.FlyToLookAt(CameraLookAt_x, CameraLookAt_y, _Duration)
	Camera.RotFlight(RotAngel, _Duration)

end


--------------------------------------------------------------------------------------
-- End Camera-Functions
--------------------------------------------------------------------------------------


-- start cutscene
function Mission_UpdateCutscene()

	if gvMissionCamera_CutsceneStarted < 14 then

		if gvMissionCamera_CutsceneStarted == 0 then
			-- Targe points of Cutscene
		
	        	
			-- start Cutscene
			-- Set camera to start position
	  		MissionCamera_StartPosition(gvMission_TargetCameraTable1)


			-- Set Cinematic mode
			Interface_SetCinematicMode(1)
			
		    	--Display.SetFarClipPlaneMinAndMax(0, 18000) 
		    	--Display.SetFogColor (152,172,182)
    			--Display.SetFogStartAndEnd (2500,22000)
    			--Display.SetRenderFog (1)

			
			--Use the light settings
			--Here because display is not loaded at GameCallback_OnGameStart
			--Display_SetSummerValues()			
	        	
			-- Start Camera flight
			gvCamera_CutsceneStartTime 	= Logic.GetTime()
			MissionCamera_Flyby(gvMission_TargetCameraTable2, gvMission_CameraDuration1)
			gvMissionCamera_CutsceneEnded 		= 0
	        	
	  		gvMissionCamera_CutsceneStarted 	= 1
	  		
	  	-- xxx Play Briefing
		-- Sound.Play2DSound( "Speech_TUTORIAL_Victory", 26 )
		--Sound.PlayFeedbackSound( Sounds.E3_COMMAND_Brief1, 0 )
		--Sound.Play2DSound( Sounds.E3_COMMAND_Brief1, 26 )
	        end
	
	
		
	    
	    	-- Cutscene-Control
	
	    	-- When Camera flight 1 finished, start flight 2
	    	if 	gvMissionCamera_CutsceneEnded 		== 0 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				-- Cutscene 1 finished?
				if (Logic.GetTime()- gvMission_CameraDuration1) >= gvCamera_CutsceneStartTime then
				
					-- start Cameraflight 2
					gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable3, gvMission_CameraDuration2)
					gvMissionCamera_CutsceneEnded = 1
					
					Sound.PlayFeedbackSound( Sounds.E3_COMMAND_Brief1, 0 )
				end
		end
			
		-- Camera flight 2 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 1 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration2) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 3
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable4, gvMission_CameraDuration3)
					gvMissionCamera_CutsceneEnded = 2
					
				end
		end	
	
		-- Camera flight 3 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 2 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration3) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 4
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable5, gvMission_CameraDuration4)
					gvMissionCamera_CutsceneEnded = 3
					Sound.PlayFeedbackSound(Sounds.E3_COMMAND_Brief5, 0 )
				end
		end	
		
		-- Camera flight 4 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 3 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration4) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 5
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable6, gvMission_CameraDuration5)
					gvMissionCamera_CutsceneEnded = 4
					
				end
		end
		
		-- Camera flight 5 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 4 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration5) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 6
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable7, gvMission_CameraDuration6)
					gvMissionCamera_CutsceneEnded = 5
				end
		end	
		
		-- Camera flight 6 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 5 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration6) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 7
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable8, gvMission_CameraDuration7)
					gvMissionCamera_CutsceneEnded = 6
					
					Sound.PlayFeedbackSound(Sounds.E3_COMMAND_Brief2, 0 )
				end
		end
		
		-- Camera flight 7 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 6 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration7) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 8
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable9, gvMission_CameraDuration8)
					gvMissionCamera_CutsceneEnded = 7
				end
		end
		
		-- Camera flight 8 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 7 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration8) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 9
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable10, gvMission_CameraDuration9)
					gvMissionCamera_CutsceneEnded = 8
					
					Sound.PlayFeedbackSound(Sounds.E3_COMMAND_Brief3, 0 )
				end
		end
		
		-- Camera flight 9 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 8 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration9) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 10
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable11, gvMission_CameraDuration10)
					gvMissionCamera_CutsceneEnded = 9
				end
		end
		-- Camera flight 10 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 9 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration10) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 11
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable12, gvMission_CameraDuration11)
					gvMissionCamera_CutsceneEnded = 10
					
					Sound.PlayFeedbackSound(Sounds.E3_COMMAND_Brief4, 0 )
				end
		end
		
		-- Camera flight 11 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 10 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration11) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 12
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable13, gvMission_CameraDuration12)
					gvMissionCamera_CutsceneEnded = 11
				end
		end	
		
		-- Camera flight 12 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 11 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration12) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 13
			   		gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		MissionCamera_Flyby(gvMission_TargetCameraTable14, gvMission_CameraDuration13)
					gvMissionCamera_CutsceneEnded = 12
				end
		end
		
		-- Camera flight 13 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 12 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration13) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 14
			   		-- gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		-- MissionCamera_Flyby(gvMission_TargetCameraTable15, gvMission_CameraDuration14)
					gvMissionCamera_CutsceneEnded = 13
				end
		end
		
		-- Camera flight 14 in progress?
	    	if 	gvMissionCamera_CutsceneEnded 		== 13 and
	    		gvMissionCamera_CutsceneStarted 	== 1 then 
				if (Logic.GetTime()- gvMission_CameraDuration14) >= gvCamera_CutsceneStartTime then
				
					-- start cutscene part 15
			   		-- gvCamera_CutsceneStartTime 	= Logic.GetTime()
			   		-- MissionCamera_Flyby(gvMission_TargetCameraTable16, gvMission_CameraDuration15)
					gvMissionCamera_CutsceneEnded = 14
				end
		end
		
		
		-- Cutscene finished?
		if 	gvMissionCamera_CutsceneEnded 		== gvMission_CutsceneParts and
			gvMissionCamera_CutsceneStarted 	== 1  then
	
			-- reset values
			gvCamera_CutsceneStartTime 	= -1
			gvMissionCamera_CutsceneStarted 	= 14
			gvMissionCamera_CutsceneEnded 		= 0

			-- disable Cutscene mode
			Interface_SetCinematicMode(0)
			return 1
		end
	end
end





--------------------------------------------------------------------------------
-- Cameras
--------------------------------------------------------------------------------

-- Cutscene 1 battlefield von hinten
function Camera_1()

	-- Set cinematic mode without black borders
	GlobalMissionScripting.CinematicMode( 1 )
    
    -- To set cinematic mode WITH black borders use: 
    -- GlobalMissionScripting.CinematicMode( 1 )
    -- To disable it:
    -- GlobalMissionScripting.CinematicMode( 0 )

    --Display.SetFogColor (182,182,152)
    --Display.SetFogStartAndEnd (200,40000)
    --Display.SetRenderFog (1)

	--Display_SetFallValues()

	-- Initialize camera
	local CameraLookAt_x 	= 9950
	local CameraLookAt_y 	= 27130
	local RotAngel			= -76.02
	local ZoomDistance		= 3400
	local ZoomAngel			= 7

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	
end

-- Cutscene 2 armee
function Camera_2()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (200,18000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 9420.44
	local CameraLookAt_y 	= 27298
	local RotAngel			= 140.40
	local ZoomDistance		= 2500
	local ZoomAngel			= 7

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end





-- Cutscene 3 castle
function Camera_3()
	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (400,25000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 20858.95
	local CameraLookAt_y 	= 33251.64
	local RotAngel			= -31.11
	local ZoomDistance		= 7100
	local ZoomAngel			= 35

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end


-- Cutscene 4 swamp
function Camera_4()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (1200,20000)
    Display.SetRenderFog (1)

	--Display_SetSpringValues()

	-- Initialize camera
	local CameraLookAt_x 	= 32043
	local CameraLookAt_y 	= 8230
	local RotAngel			= 76.47
	local ZoomDistance		= 2500
	local ZoomAngel			= 8

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	


end



-- Cutscene 5 stadt
function Camera_5()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (4000,18000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()


	-- Initialize camera
	local CameraLookAt_x 	= 33346.39
	local CameraLookAt_y 	= 28846.79
	local RotAngel			= 119.40
	local ZoomDistance		= 5700
	local ZoomAngel			= 22

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end


-- Cutscene 6 schmiede
function Camera_6()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (5000,20000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()


	-- Initialize camera
	local CameraLookAt_x 	= 25711
	local CameraLookAt_y 	= 34139
	local RotAngel			= -27.70
	local ZoomDistance		= 3600
	local ZoomAngel			= 14

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end


-- Cutscene 7 marktleben
function Camera_7()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (1500,8000)
    Display.SetRenderFog (1)

	-- Initialize camera
	local CameraLookAt_x 	= 29400
	local CameraLookAt_y 	= 32741.82
	local RotAngel			= -54.56
	local ZoomDistance		= 3500
	local ZoomAngel			= 18

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end


-- Cutscene 8 way to the castle
function Camera_8()
	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )

    --Display.SetFogColor (182,182,152)
    --Display.SetFogStartAndEnd (2600,18000)
    Display.SetRenderFog (1)

	--Display_SetSpringValues()


	-- Initialize camera
	local CameraLookAt_x 	= 24192
	local CameraLookAt_y 	= 28586
	local RotAngel			= 26.57
	local ZoomDistance		= 4400
	local ZoomAngel			= 4

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end

-- Cutscene 9 Swamp VC
function Camera_9()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )


    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (2000,10000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 25685
	local CameraLookAt_y 	= 2197
	local RotAngel			= -67
	local ZoomDistance		= 2000
	local ZoomAngel			= 20

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end

-- Camera_Pilgrim()
function Camera_Pilgrim()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )


    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (2000,10000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 15473
	local CameraLookAt_y 	= 9706
	local RotAngel			= -118.22
	local ZoomDistance		= 2300
	local ZoomAngel			= 6

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end

-- Camera_Salim()
function Camera_Salim()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )


    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (2000,10000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 21092
	local CameraLookAt_y 	= 32497
	local RotAngel			= -0.03
	local ZoomDistance		= 1700
	local ZoomAngel			= 7

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end

-- Camera_Dario()
function Camera_Dario()

	-- Set cinematic mode
    GlobalMissionScripting.CinematicMode( 1 )


    --Display.SetFogColor (152,172,182)
    --Display.SetFogStartAndEnd (2000,10000)
    Display.SetRenderFog (1)

	--Display_SetSummerValues()

	-- Initialize camera
	local CameraLookAt_x 	= 15432
	local CameraLookAt_y 	= 8246
	local RotAngel			= -85.67
	local ZoomDistance		= 1700
	local ZoomAngel			= 8

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	

end

-- Reset Camera and jump to HQ
function Camera_EndCamera()
	--Deactivate Cinamatic Mode
	GlobalMissionScripting.CinematicMode( 0 )
	--Display_LandscapeSetHighlandSummer()
	
	-- jump to HQ
	local NumberOfHQ1, Headquarters1ID= Logic.GetPlayerEntities(1,Entities.PB_Headquarters1,1)	
	if NumberOfHQ1 >= 1 then
		local HQIDPos_x, HQIDPos_y, HQIDPos_z = Logic.EntityGetPos(Headquarters1ID )
		Camera.ScrollSetLookAt(HQIDPos_x, HQIDPos_y)
	end
	
	local NumberOfHQ2, Headquarters2ID= Logic.GetPlayerEntities(1,Entities.PB_Headquarters2,1)
	if NumberOfHQ2 >= 1 then
		local HQIDPos_x, HQIDPos_y, HQIDPos_z = Logic.EntityGetPos(Headquarters2ID )
		Camera.ScrollSetLookAt(HQIDPos_x, HQIDPos_y)
	end
	
end




-- Set Camera Mode WITH GUI and WITh enabled camera control
function Camera_CinematicMode( _CinematicStatus )
	-- Save state	
	gvInterfaceCinematicFlag = _CinematicStatus

	-- On status
	if _CinematicStatus == 0 then
		
		Interface_SetCinematicMode( 0 )
		-- Enable FoW
		Display.SetRenderFogOfWar( 1 )	
		-- Disable sky box
		Display.SetRenderSky( 0 )
		-- Set back Rotation
		Camera.RotSetAngle( -45 )
		--Camera.RotSetFlipBack( 1 )
		gvCameraDefaultFlag = 1
		-- Camera mode
		Camera.ScrollUpdateZMode( 0 ) -- 1
		
	else
		-- Start cinematic mode
		
		-- Cancel current GUI State
		GUI.CancelState()
		-- Disable FoW
		Display.SetRenderFogOfWar( 0 )
		-- Enable sky box
		Display.SetRenderSky( 1 )
		-- Disable Fip Back
		Camera.RotSetFlipBack( 0 )
		-- Make camera ok
		GameCallback_Camera_CalculateZoom( 1 )
		-- Cameramode
		Camera.ScrollUpdateZMode( 1 ) 
		gvCameraDefaultFlag = 0		
	end
end