--------------------------------------------------------------------------------
-- Camera scripting
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- GameCallBack from mouse wheel to calculate the zoom and the angle of the camera
--------------------------------------------------------------------------------
function GameCallback_Camera_CalculateZoom( _ZoomFactor )

	if gvCamera.DefaultFlag == 1 then

		local ZoomFactorEx = _ZoomFactor
		
	    if ZoomFactorEx > 1 then
	      ZoomFactorEx = 1
	    end
	   
		Camera.ZoomSetFOV(gvCamera.ZoomFOVMin + (gvCamera.ZoomFOVMax - gvCamera.ZoomFOVMin) * ZoomFactorEx)
		Camera.ZoomSetAngle(gvCamera.ZoomAngleMin + (gvCamera.ZoomAngleMax - gvCamera.ZoomAngleMin) * ZoomFactorEx)
		Camera.ZoomSetDistance(gvCamera.ZoomDistanceMin + (gvCamera.ZoomDistanceMax - gvCamera.ZoomDistanceMin) * 0.45 * ( _ZoomFactor + _ZoomFactor * _ZoomFactor ) )
	end

end


--------------------------------------------------------------------------------
-- Init camera
--------------------------------------------------------------------------------

function Camera_InitParams()


	gvCamera = {}
	
	-- Variables needed for GameCallback_Camera_CalculateZoom
	gvCamera.ZoomAngleMin = 29
	gvCamera.ZoomAngleMax = 49
	gvCamera.ZoomDistanceMin = 1200
	gvCamera.ZoomDistanceMax = 6000
	gvCamera.ZoomFOVMin = 48
	gvCamera.ZoomFOVMax = 53
	
	-- Default camera flag
	gvCamera.DefaultFlag = 1
	
	-- Auto rotation flip back flag
	gvCamera.RotationFlipBackFlag = 0
	
	-- Manual camera values
	gvCamera.ManualAngle = 36
	gvCamera.ManualZoom = 3000
	gvCamera.ManualFOV = 50
	gvCamera.ManualZUpMoving = 0
	gvCamera.ManualZDownMoving = 0

	-- Set camera to the center of the map
 	local WorldSizeX, WorldSizeY = Logic.WorldGetSize() 	
	Camera.ScrollSetLookAt(WorldSizeX * 0.5, WorldSizeX * 0.5)
	
 	
	Camera.ScrollUpdateZMode(0)
	Camera.ScrollSetSpeed(2600)
	Camera.ScrollSetBorderFlag(1)
	
	Camera.RotSetSpeed(90)
	Camera.RotSetMaxAngle(315)
	Camera.RotSetFlipBack(0)
	Camera.RotSetFlipBackSpeed(250)
	
	Camera.ZoomSetFactorMax(1.4)
	Camera.ZoomSetSpeed(1)
	Camera.ZoomSetFactor(1.0)

	-- load the default camera scroll speed

	-- Try to load stored values from the GDB
	if GDB ~= nil then
		local defaultSpeedInPercent = 50
		if GDB.IsKeyValid( "Config\\Controls\\BorderSpeed" ) then
			defaultSpeedInPercent  = GDB.GetValue( "Config\\Controls\\BorderSpeed" )
		end
		OptionsControls_Menu.SetScrollSpeed(defaultSpeedInPercent)	
	end

end


--------------------------------------------------------------------------------
-- Enable/disable default camera (called by key binding)
--------------------------------------------------------------------------------

function Camera_ToggleDefault()
	
	-- Toggle
	gvCamera.DefaultFlag = 1 - gvCamera.DefaultFlag
	
	
	-- Toggle	
	gvCamera.RotationFlipBackFlag = 1 - gvCamera.RotationFlipBackFlag

	Camera.RotSetFlipBack( gvCamera.RotationFlipBackFlag )
	
	-- Info
	if gvCamera.DefaultFlag == 1 then
		GUI.AddNote( "Camera default" )
	else
		GUI.AddNote( "Camera free" )
	end
	
end


--------------------------------------------------------------------------------
-- Manual angle (called by key binding)
--------------------------------------------------------------------------------

function Camera_DecreaseAngle()

	gvCamera.ManualAngle = gvCamera.ManualAngle + 1
	
	Camera.ZoomSetAngle(gvCamera.ManualAngle)
	
end

--------------------------------------------------------------------------------

function Camera_IncreaseAngle()

	gvCamera.ManualAngle = gvCamera.ManualAngle - 1
	
	Camera.ZoomSetAngle(gvCamera.ManualAngle)
	
end


--------------------------------------------------------------------------------
-- Manual zoom (called by key binding)
--------------------------------------------------------------------------------

function Camera_DecreaseZoom()

	gvCamera.ManualZoom = gvCamera.ManualZoom + 100
	
	Camera.ZoomSetDistance(gvCamera.ManualZoom)
	
end

--------------------------------------------------------------------------------

function Camera_IncreaseZoom()

	gvCamera.ManualZoom = gvCamera.ManualZoom - 100
	
	Camera.ZoomSetDistance(gvCamera.ManualZoom)
	
end




--------------------------------------------------------------------------------
-- Manual FOV (called by key binding)
--------------------------------------------------------------------------------

function Camera_DecreaseFOV()

	gvCamera.ManualFOV = gvCamera.ManualFOV + 1
	
	Camera.ZoomSetFOV(gvCamera.ManualFOV)
	
end

--------------------------------------------------------------------------------

function Camera_IncreaseFOV()

	gvCamera.ManualFOV = gvCamera.ManualFOV - 1
	
	Camera.ZoomSetFOV(gvCamera.ManualFOV)
	
end



--------------------------------------------------------------------------------
-- Enable/disable rotation (called by key binding)
--------------------------------------------------------------------------------

function Camera_ToggleRotationFlipBack()

	
end



--------------------------------------------------------------------------------
