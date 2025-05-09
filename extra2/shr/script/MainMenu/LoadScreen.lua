----------------------------------------------------------------------------------------------------
-- Init load screen
function LoadScreen_Init( _LoadSaveGameFlag, _MapName, _MapType, _MapCampaignName )

	-- Set texture
	local PictureNumber = 1 + XGUIEng.GetRandom( 7 )
	local PictureName = "data\\graphics\\textures\\gui\\mainmenu\\loadscreen0" .. PictureNumber .. ".png"
	XGUIEng.SetMaterialTexture( "LoadScreenPic01", 0, PictureName )

	-- Show load screen
	XGUIEng.ShowAllSubWidgets( "Screens", 0 )
	XGUIEng.ShowWidget( "LoadScreen", 1 )
	
	-- Set mouse
	Mouse.CursorSet( 2 )
		
	-- Set headline and text
	-- Loading save game
	if _LoadSaveGameFlag == 0 then
		-- Nope: get map name and description
		local MapNameString, MapDescString = Framework.GetMapNameAndDescription( _MapName, _MapType, _MapCampaignName )
		XGUIEng.ShowWidget( "LoadScreen_RandomInfo", 1 )
		XGUIEng.SetText( "LoadScreen_MapInfo", MapNameString )
		XGUIEng.SetText( "LoadScreen_RandomInfo", MapDescString )
	else
		-- Yes: get save game name and random info
		local Description = Framework.GetSaveGameString( _MapName )
		XGUIEng.SetText( "LoadScreen_MapInfo", Description )
		
		XGUIEng.ShowWidget( "LoadScreen_RandomInfo", 0 )
		--[[
		local FunFactNumber = 1 + XGUIEng.GetRandom( 18 )
		local FunFactString = XGUIEng.GetStringTableText("LoadScreenTipps/LoadScreen_Header") .. ": @cr @cr "
		XGUIEng.SetText("LoadScreen_RandomInfo", FunFactString .. XGUIEng.GetStringTableText("LoadScreenTipps/LoadScreen_Tipp" .. FunFactNumber))
		--]]
	end

	-- Set dev news
	XGUIEng.SetTextFromFile( "LoadScreen_ReadMe", "00DevNews.txt", false )
	XGUIEng.LimitTextLines( "LoadScreen_ReadMe", 40, 0 )
end

----------------------------------------------------------------------------------------------------
