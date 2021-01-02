--------------------------------------------------------------------------------
-- User stuff
--------------------------------------------------------------------------------
-- Get player name

function UserTool_GetPlayerName( _PlayerID )

	-- Init name
	local PlayerName = XGUIEng.GetStringTableText("InGameMessages/GUI_Player") .. " " .. _PlayerID
		
	-- Network?
   	if XNetwork ~= nil and XNetwork.Manager_DoesExist() == 1 then
   	
   		-- Multi player: ask network
		local NetworkPlayerName = XNetwork.GameInformation_GetLogicPlayerUserName( _PlayerID )
		if NetworkPlayerName ~= "" then
			PlayerName = NetworkPlayerName
		end
		
	else

		-- Single player
		if _PlayerID == GUI.GetPlayerID() then
			if GDB.IsKeyValid( "Config\\User\\Callsign" ) then
				PlayerName = GDB.GetString( "Config\\User\\Callsign" )
			end
		end
		
	end
	
	-- Return name
	return PlayerName
	
end

----------------------------------------------------------------------------------------------------
-- Get user's sex - 0: male; 1: female

function UserTool_GetLocalPlayerSex()

	local Sex = 0
	
	if GDB.IsKeyValid( "Config\\User\\Sex" ) then
		Sex = GDB.GetValue( "Config\\User\\Sex" )
	end

	return Sex
	
end

--------------------------------------------------------------------------------
-- Combines UserTool_GetPlayerName(_PlayerID) and UserTool_GetLocalPlayerSex() to a single string

function UserTool_GetPlayerNameWithTitle(_PlayerID)

	-- Init name
	local PlayerName = UserTool_GetPlayerName(_PlayerID)
	
	if UserTool_GetLocalPlayerSex() == 1 then
		PlayerName = PlayerName .. " " .. XGUIEng.GetStringTableText("MenuGeneric/Female_Pronoun_Generic")) .. " " .. PlayerName
	else
		PlayerName = PlayerName .. " " .. XGUIEng.GetStringTableText("MenuGeneric/Male_Pronoun_Generic")) .. " " .. PlayerName
	end
	
	-- Return name
	return PlayerName
end