--------------------------------------------------------------------------------
-- Cinematics
--------------------------------------------------------------------------------
-- Set cinematic mode

function Interface_SetCinematicMode( _CinematicStatus )

	-- Save state	
	gvInterfaceCinematicFlag = _CinematicStatus
	
	-- On status
	if _CinematicStatus == 0 then

		-- Stop camera flight
		Camera.StopCameraFlight()

		-- Quit cinematic mode

		-- Set camera mode
		Camera.SetControlMode( _CinematicStatus )
	
		
		-- Disable sky box
		Display.SetRenderSky( 0 )
					
		-- Reactivate Selection
		GUI.ActivateSelectionState()	
			
		-- Set back Rotation
		Camera.RotSetAngle( -45 )
		--Camera.RotSetFlipBack( 1 )
		gvCamera.DefaultFlag = 1
		
		-- Camera mode
		Camera.ScrollUpdateZMode( 0 ) -- 1
		
		XGUIEng.ShowWidget("Cinematic",0)
		XGUIEng.ShowWidget("Cinematic_Text",0)
		XGUIEng.ShowWidget("Normal",1)
		XGUIEng.ShowWidget("3dOnScreenDisplay",1)
	
		-- toggle FoW
		Display.SetRenderFogOfWar(1) 
		GUI.MiniMap_SetRenderFogOfWar(1)
		
		-- Reselect entities
		do
			for i=1, 20, 1 do
				local SelectedEntityID = gvInterfaceCinematicSelectedEntites[ i ]
				if SelectedEntityID ~= nil and SelectedEntityID > 0 then
					GUI.SelectEntity( SelectedEntityID )
				end
			end
		end
		
	else
		-- Sets the "Silver Border"-Color to the player color
		local ColorR, ColorG, ColorB = GUI.GetPlayerColor(GUI.GetPlayerID())
		XGUIEng.SetMaterialColor(XGUIEng.GetWidgetID("CinematicBar00"),0, ColorR,ColorG,ColorB,190)
		XGUIEng.SetMaterialColor(XGUIEng.GetWidgetID("CinematicBar01"),0, ColorR,ColorG,ColorB,190)
		XGUIEng.SetMaterialColor(XGUIEng.GetWidgetID("CinematicFrame"),0, ColorR,ColorG,ColorB,190)
		XGUIEng.SetMaterialColor(XGUIEng.GetWidgetID("CinematicFrameBG"),0, ColorR,ColorG,ColorB,190)
	
		-- Start cinematic mode
		Camera.SetControlMode( _CinematicStatus )
		
		-- Save selected entities
		gvInterfaceCinematicSelectedEntites = { GUI.GetSelectedEntities() }
		
		-- toggle FoW
		Display.SetRenderFogOfWar(0) 
		GUI.MiniMap_SetRenderFogOfWar(0)
		
		-- Clear selection 
		GUI.ClearSelection()

		-- Cancel current GUI State
		GUI.CancelState()
		
		XGUIEng.ShowWidget("Cinematic",1)
		XGUIEng.ShowWidget("Normal",0)
		XGUIEng.ShowWidget("3dOnScreenDisplay",0)
		
		-- Enable sky box
		Display.SetRenderSky( 1 )
					
		-- Disable Selection 
		GUI.ActivateCutSceneState()		
				
		-- Disable Fip Back
		--Camera.RotSetFlipBack( 0 )
		
		-- Make camera ok
		GameCallback_Camera_CalculateZoom( 1 )
		
		-- Cameramode
		Camera.ScrollUpdateZMode( 1 ) 

		-- Init camera flight
		Camera.InitCameraFlight()

		--	close menus
		XGUIEng.ShowAllSubWidgets("Windows",0)
		
		-- Reset game speed
		Game.GameTimeReset()
		XGUIEng.SetText("GameSpeedButton", "@center x" .. Game.GameTimeGetFactor())

		gvCamera.DefaultFlag = 0		
		
	end
end

function
GUIAction_DisplayCinematicText(_TextKey)
	XGUIEng.ShowWidget("Cinematic_Text",1)
	XGUIEng.SetText( "Cinematic_Text", XGUIEng.GetStringTableText(_TextKey) )
end