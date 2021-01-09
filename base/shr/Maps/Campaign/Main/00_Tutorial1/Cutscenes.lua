-----------------------------------------------------------------
-- Cutscene

function
Mission_InitCutscenes()
	
	gvCamera_CutsceneStartTime = -1
	gvMission_FirstFlyByStarted = 0
	
	gvMission_CutsceneTableCamera1 = {44251,23969,-158,2200,20}
	gvMission_CutsceneTableCamera2 = {45096,20562,-158,2200,20}	
	gvMission_CutsceneTableCamera3 = {43666,19492,-237,2200,20}	
	gvMission_CutsceneTableCamera4 = {40945,17675,-237,2200,20}
	gvMission_CutsceneTableCamera5 = {43740,18008,-80,3500,6}
end

function 
Mission_StartCutscene1()
	
	-- Cutscene already started?
	if gvCamera_CutsceneStartTime >= 0 then
		return
	end	
	
	-- Fog stuff		
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (3000, 18000)
    Display.SetRenderFog (1)		
	-- Set View distance
	Display.SetFarClipPlaneMinAndMax(0, 10000) 

	-- start Cutscene
	-- Set camera to start position	  		
	Mission_SetCamera(gvMission_CutsceneTableCamera1)

	-- Set Cinematic mode
	Interface_SetCinematicMode(1)
	
	-- THIS MAKES THE CAMERA BE OK!
	GameCallback_Camera_CalculateZoom( 1 )
	
    	
	-- Start Camera flight
	gvCamera_CutsceneStartTime 	= Logic.GetTime()
	
end

function Mission_UpdateCutscene1()

	-- Started?
	if gvCamera_CutsceneStartTime < 0 then
		return
	end
	
	-- Get time since start
	local InCutSceneSecond = Logic.GetTime() - gvCamera_CutsceneStartTime

	-- Duration of Cutscene
	local FlightDuration1 	= 10			-- Duration for part 1
	local FlightDuration2 	= 7			-- Duration for part 2
	local FlightDuration3 	= 7			-- Duration for part 2
	local WaitAtTheEndDuration = 8
	
	local CutsceneLength = FlightDuration1 + FlightDuration2 + FlightDuration3 + WaitAtTheEndDuration
	
	-- Cut scene done?	
	if InCutSceneSecond > CutsceneLength then
		Mission_EndCutscene1()
		return
	end
	
	--update camera
	do
		if 	InCutSceneSecond >= 0
		and gvMission_FirstFlyByStarted == 0 then
			--LuaDebugger.Break()
			Mission_CameraFlyby(gvMission_CutsceneTableCamera2, FlightDuration1)
			gvMission_FirstFlyByStarted = 1
		end
		
		if 	InCutSceneSecond >= FlightDuration1
		and gvMission_FirstFlyByStarted == 1 then
			--LuaDebugger.Break()
			Mission_CameraFlyby(gvMission_CutsceneTableCamera3, FlightDuration2)
			gvMission_FirstFlyByStarted = 2
		end
		
		if 	InCutSceneSecond >= FlightDuration1 + FlightDuration2
		--and InCutSceneSecond <= CutsceneLength - FlightDuration3
		and gvMission_FirstFlyByStarted == 2 then
			--LuaDebugger.Break()
			Mission_CameraFlyby(gvMission_CutsceneTableCamera4, FlightDuration3)
			gvMission_FirstFlyByStarted = 3
		end
		
		if 	InCutSceneSecond >= FlightDuration1 + FlightDuration2 + FlightDuration3
		--and InCutSceneSecond <= CutsceneLength
		and gvMission_FirstFlyByStarted == 3 then
			--LuaDebugger.Break()
			Mission_CameraFlyby(gvMission_CutsceneTableCamera5,WaitAtTheEndDuration-4)
			gvMission_FirstFlyByStarted = 4
		end
		
	
	end

end


function Mission_EndCutscene1()
	
	
	-- Cut scene really started?
	if gvCamera_CutsceneStartTime < 0 then
		return
	end
	
	-- disable Cutscene mode
	Interface_SetCinematicMode(0)
	
	Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 0) 
	-- Reset camera
	Camera.RotSetAngle( -45 )                
	--Camera.RotSetFlipBack( 1 )

	gvMission_FirstFlyByStarted = 0
	-- Invalidate start time
	gvCamera_CutsceneStartTime = -1
end


-- Interpolate Camera Flight from Current Position to Target Position in _Time seconds
function Mission_CameraFlyby(_CameraTable, _Duration)

	local CameraLookAt_x 	= _CameraTable[1]
	local CameraLookAt_y 	= _CameraTable[2]
	local RotAngel			= _CameraTable[3]
	local ZoomDistance		= _CameraTable[4]
	local ZoomAngel			= _CameraTable[5]
         
	Camera.ZoomSetDistanceFlight(ZoomDistance, _Duration)
	Camera.ZoomSetAngleFlight(ZoomAngel, _Duration)
	Camera.FlyToLookAt(CameraLookAt_x, CameraLookAt_y, _Duration)
	Camera.RotFlight(RotAngel, _Duration)

end


-- Set start camera
function Mission_SetCamera(_CameraTable)

	local CameraLookAt_x 	= _CameraTable[1]
	local CameraLookAt_y 	= _CameraTable[2]
	local RotAngel			= _CameraTable[3]
	local ZoomDistance		= _CameraTable[4]
	local ZoomAngel			= _CameraTable[5]

	Camera.ScrollUpdateZMode(0)
	Camera.ZoomSetDistance(ZoomDistance)
	Camera.RotSetAngle(RotAngel)	
	Camera.ZoomSetAngle(ZoomAngel)			
	Camera.ScrollSetLookAt(CameraLookAt_x, CameraLookAt_y)	
end