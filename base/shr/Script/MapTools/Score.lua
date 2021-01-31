--------------------------------------------------------------------------------
-- Calculate Scores
--------------------------------------------------------------------------------
Score = {}

Score.Player ={}							

for i=1,8,1
do
	Score.Player[i] = {}
	Score.Player[i]["all"] = 0
	Score.Player[i]["resources"] = 0
	Score.Player[i]["buildings"] = 0
	Score.Player[i]["technology"] = 0
	Score.Player[i]["settlers"] = 0
	Score.Player[i]["battle"] = 0
end

Score.WinPoints = 200
Score.ResearchPoints = 5
Score.UpgradePoints = 5
Score.BattleSettlersPoints = 2
Score.BattleBuildingPoints = 5
Score.SettlersPoints = 2 
Score.ResourcePoints  = 0.2
Score.ConstructionPoints = 5
							
--------------------------------------------------------------------------------
-- Get Player Score
function
Score.GetPlayerScore(_PlayerID, _ScoreType)
	
	return math.floor(Score.Player[_PlayerID][_ScoreType])
end


--------------------------------------------------------------------------------
-- Get Team Score. Carefull: This needs the MP Table MultiplayerTools.Teams
function
Score.GetTeamScore(_TeamID)
	
	local PlayerTeamTable = {MultiplayerTools.Teams[ _TeamID ]}
	
	--local PlayerAmountInTeam = table.getn(PlayerTeamTable)
	local Points = 0
	
	for i=1, 8, 1
	do
		if MultiplayerTools.Teams[ _TeamID ][i] ~= nil then
			Points = Points + Score.GetPlayerScore(MultiplayerTools.Teams[ _TeamID ][i],"all")
		end
	end

	return Points

end

--------------------------------------------------------------------------------
-- Calculate technology score
function
Score.CallBackResearched( _PlayerID, _TechnologyType )	
	
	Score.Player[_PlayerID]["technology"] = Score.Player[_PlayerID]["technology"] + Score.ResearchPoints
	
	Score.Player[_PlayerID]["all"] 	= Score.Player[_PlayerID]["all"] 
									+ Score.ResearchPoints
									
end

--------------------------------------------------------------------------------
-- Calculate building score
function
Score.CallBackUpgrade(_OldID, _NewID)		
	
	local PlayerID = Logic.EntityGetPlayer( _NewID )
	
	Score.Player[PlayerID]["buildings"] = Score.Player[PlayerID]["buildings"] + Score.UpgradePoints
	
	Score.Player[PlayerID]["all"] 	= Score.Player[PlayerID]["all"] 
									+ Score.UpgradePoints
		
end

--------------------------------------------------------------------------------
-- Calculate battle score: settlers
function
GameCallback_SettlerKilled( _HurterPlayerID, _HurtPlayerID )
	
	--update music
	LocalMusic.CallbackSettlerKilled(_HurterPlayerID, _HurtPlayerID)
	
	--calculate battle score	
	
	Score.Player[_HurterPlayerID]["battle"] = Score.Player[_HurterPlayerID]["battle"] + Score.BattleSettlersPoints
	
	Score.Player[_HurterPlayerID]["all"] 	= Score.Player[_HurterPlayerID]["all"] 
											+ Score.BattleSettlersPoints
	
end

--------------------------------------------------------------------------------
-- Calculate battle  score: buildings
function GameCallback_BuildingDestroyed( _HurterPlayerID, _HurtPlayerID )
	Score.Player[_HurterPlayerID]["battle"] = Score.Player[_HurterPlayerID]["battle"] + Score.BattleBuildingPoints
	Score.Player[_HurterPlayerID]["all"] 	= Score.Player[_HurterPlayerID]["all"] + Score.BattleBuildingPoints
	
	Sound.PlayGUISound(Sounds.Military_SO_Cannon_rnd_1,50)
end

--------------------------------------------------------------------------------
-- Calculate settlers score
function
GameCallback_SettlerSpawned( _PlayerID, _EntityType )
	
	local k
	
	if _EntityType ~= Entities.PU_BattleSerf and _EntityType ~= Entities.PU_Serf then
		Score.Player[_PlayerID]["settlers"] = Score.Player[_PlayerID]["settlers"] + Score.SettlersPoints 
	
		Score.Player[_PlayerID]["all"] 	= Score.Player[_PlayerID]["all"] 
										+ Score.SettlersPoints 
	end					
	
end

--------------------------------------------------------------------------------
-- Calculate resources score
function
GameCallback_GainedResources( _PlayerID, _ResourceType, _Amount )
	
	local ResourcePoints = _Amount * Score.ResourcePoints 
	
	Score.Player[_PlayerID]["resources"] = Score.Player[_PlayerID]["resources"] + ResourcePoints
	
	Score.Player[_PlayerID]["all"] 	= Score.Player[_PlayerID]["all"] 
									+ ResourcePoints
	
end

--------------------------------------------------------------------------------
-- Calculate constrcution score
function Score.OnBuildingConstructionComplete(_BuildingID, _PlayerID)
	if _PlayerID ~= 0 then
		Score.Player[_PlayerID]["buildings"] = Score.Player[_PlayerID]["buildings"] + Score.ConstructionPoints 
		Score.Player[_PlayerID]["all"] 	= Score.Player[_PlayerID]["all"] 
										+ Score.ConstructionPoints 
	end
end


--------------------------------------------------------------------------------
-- Callback from local script, when player has won
function
Score.CallBackGameWon(_PlayerID, _State)

	--player has won
	if _State == 2 then
	
		Score.Player[_PlayerID]["all"] 	= Score.Player[_PlayerID]["all"] 
										+ Score.WinPoints
	end

end

--------------------------------------------------------------------------------
-- Callback from game logic to access scores

function
GameCallback_GetPlayerScore( _PlayerID, _ScoreType )

	if _ScoreType == 0 then
		return Score.GetPlayerScore( _PlayerID, "all" )
	elseif _ScoreType == 1 then
		return Score.GetPlayerScore( _PlayerID, "resources" )
	elseif _ScoreType == 2 then
		return Score.GetPlayerScore( _PlayerID, "buildings" )
	elseif _ScoreType == 3 then
		return Score.GetPlayerScore( _PlayerID, "technology" )
	elseif _ScoreType == 4 then
		return Score.GetPlayerScore( _PlayerID, "settlers" )
	elseif _ScoreType == 5 then
		return Score.GetPlayerScore( _PlayerID, "battle" )
	end

	return 0
	
end

--------------------------------------------------------------------------------
