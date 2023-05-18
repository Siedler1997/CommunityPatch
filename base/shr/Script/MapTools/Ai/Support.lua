TimeLine = {}
TimeLine.Seconds = 0
TimeLine.Enter = function(_name,_time,_job)
	AI.TimeLine_AddEvent(_name,_time,_job)
	end
TimeLine.Update = function()
	AI.TimeLine_Update(TimeLine.Seconds)
	TimeLine.Seconds = TimeLine.Seconds +1
	end
TimeLine.Start = function()
	TimeLine.JobId = StartJob("TimeLineJob")
	end
TimeLine.End = function()
	EndJob(TimeLine.JobId)
	end


invalidPosition = { X=-1 , Y=-1 }

ONEMINUTE = 60

DebugOn = 0

--	global chest handling

	CHEST_CLOSED = 0
	CHEST_OPENED = 1

	chestCounter = 0

	chestControl = {}

	chestControl.counter = 0
	chestControl.list = {}

	chestOpener = {}


-------------------------------------------------------------------------------------------------------
--
--	                DisableExpanding(<playerId>)
--
-------------------------------------------------------------------------------------------------------

DisableExpanding = function(_playerId)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Literacy, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Printing, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_ChainBlock, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_GearWheel, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Alchemy, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Taxation, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Trading, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Tactics, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Laws, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_StandingArmy, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Alloying, 0)
	Logic.SetTechnologyState(_playerId,Technologies.MU_LeaderSpear, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Headquarter, 0)
	Logic.SetTechnologyState(_playerId,Technologies.B_Archery, 0)
	Logic.SetTechnologyState(_playerId,Technologies.B_Tower, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_University, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Farm, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Village, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_StoneMason, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Brickworks, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Stonemine, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP2_Residence, 0)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Beautification, 0)
	Logic.SetTechnologyState(_playerId,Technologies.UP1_Barracks, 0)

	--	initialize start technologies

		Logic.SetTechnologyState(_playerId,Technologies.B_University, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Village, 		0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Residence, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Ironmine, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Stonemine, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Sulfurmine, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Claymine, 	0)
		Logic.SetTechnologyState(_playerId,Technologies.B_Farm, 		0)

	end

-------------------------------------------------------------------------------------------------------
--
--	                EnableExpanding(<playerId>)
--
-------------------------------------------------------------------------------------------------------

EnableExpanding = function(_playerId)

	--	initialize start technologies

		Logic.SetTechnologyState(_playerId,Technologies.B_University, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Village, 		2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Residence, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Ironmine, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Stonemine, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Sulfurmine, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Claymine, 	2)
		Logic.SetTechnologyState(_playerId,Technologies.B_Farm, 		2)

	end

-------------------------------------------------------------------------------------------------------
--
--	                <entity id> CreateChest(<position>,<callback>)
--
-------------------------------------------------------------------------------------------------------

CreateChest = function(_position,_callback)
	chestCounter = chestCounter +1
	local name = "_chest_"..chestCounter
	local entityId = CreateEntity(0,Entities.XD_ChestClose,_position,name)
	local chestData = {}
	chestData.name 		= name
	chestData.state		= CHEST_CLOSED
	if _callback == nil then
		chestData.callback 	= chestDefaultCallback
	else
		chestData.callback 	= _callback
		end
	table.insert(chestControl.list,chestData)
	return entityId
	end

CreateRandomGoldChest = function(_position)
	return CreateChest(_position,chestDefaultCallbackRandomGold)
	end

CreateGoldChest = function(_position)
	return CreateChest(_position,chestDefaultCallbackGold)
	end

CreateIronChest = function(_position)
	return CreateChest(_position,chestDefaultCallbackIron)
	end

chestDefaultCallbackGold = function()
	Message(XGUIEng.GetStringTableText("Support/ChestGold1"))
	AddGold(2000)
	end

chestDefaultCallbackRandomGold = function()
	local gold = (10 + Logic.GetRandom(40)) * 10
	Message(XGUIEng.GetStringTableText("Support/ChestGold2a")..gold..XGUIEng.GetStringTableText("Support/ChestGold2b") )
	AddGold(gold)
	end

chestDefaultCallbackIron = function()
	Message(XGUIEng.GetStringTableText("Support/ChestIron1"))
	AddIron(2000)
	end

chestDefaultCallback = function()
	local rand = Logic.GetRandom(8)
	if rand == 0 then
		Message(XGUIEng.GetStringTableText("Support/ChestRandomGold"))
		AddGold(1000)
	elseif rand == 1 then
		Message(XGUIEng.GetStringTableText("Support/ChestRandomSulfur"))
		AddSulfur(1000)
	elseif rand == 2 then
		Message(XGUIEng.GetStringTableText("Support/ChestRandomIron"))
		AddIron(1000)
	elseif rand == 3 then
		Message(XGUIEng.GetStringTableText("Support/ChestRandomClay"))
		AddClay(1000)
	elseif rand == 4 then
		Message(XGUIEng.GetStringTableText("Support/ChestRandomWood"))
		AddWood(1000)
	else
		Message(XGUIEng.GetStringTableText("Support/ChestRandomEmpty"))
		end

	end

-------------------------------------------------------------------------------------------------------
--
--	                <entity id> CreateSerf(<player id>,<position>)
--
-------------------------------------------------------------------------------------------------------

CreateSerf = function(_playerId,_position,_invulnerability)
	local entityId = Logic.CreateEntity(Entities.PU_Serf,_position.X,_position.Y,0)
	if _invulnerability ~= nil then
		Logic.SetEntityInvulnerabilityFlag(entityId,_invulnerability)
		end
	return entityId

	end

-------------------------------------------------------------------------------------------------------
--
--	                EnableDebugging()
--
-------------------------------------------------------------------------------------------------------

EnableDebugging = function()

    if Game.IsDebugVersion() == 0 then

        return

    end


	--	key bindings

    	Input.KeyBindDown(Keys.NumPad1,										"GUI.ToggleMinimapDebug()"                  ,15)
    	Input.KeyBindDown(Keys.NumPad2,										"CreateDebugTroops(GUI.GetPlayerID())"                       ,15)
		Input.KeyBindDown(Keys.NumPad3,										"Framework.RestartMap()"                    ,15)
		Input.KeyBindDown(Keys.NumPad4,										"DebugRemoveEntities()"                     ,15)
    	Input.KeyBindDown(Keys.NumPad5,										"CreateDebugTroops(2)"                       ,15)
	    Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D,	"LuaDebugger.Show()"                        ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.B, "Display.SetRenderLandscapeDebugInfo(-1)"   ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.S, "SpeedUpGame()"                             ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.W,                    "StartWinter(1000)"                         ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.S,                    "StartSummer(1000)"                         ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.R,                    "StartRain(1000)"                           ,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.F,                    "Display.SetRenderFogOfWar(-1)   GUI.MiniMap_SetRenderFogOfWar(-1)"             ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D1,					"GUI.SetControlledPlayer(1)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D2,					"GUI.SetControlledPlayer(2)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D3,					"GUI.SetControlledPlayer(3)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D4,					"GUI.SetControlledPlayer(4)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D5,					"GUI.SetControlledPlayer(5)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D6,					"GUI.SetControlledPlayer(6)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D7,					"GUI.SetControlledPlayer(7)"                ,15)
    	Input.KeyBindDown(Keys.ModifierControl + Keys.ModifierAlt + Keys.D8,					"GUI.SetControlledPlayer(8)"                ,15)
        Input.KeyBindDown(Keys.NumPad5, 									"Interface_ToggleDebugWindow1()"			,15)
		Input.KeyBindDown(Keys.NumPad6, 									"Interface_ToggleDebugWindow2()"			,15)
		Input.KeyBindDown(Keys.NumPad7, 									"DebugSetPositionOfDario()"					,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.NumPad1, 				"if Cutscenes[1] ~= nil then StartCutscene(Cutscenes[1]) end"				,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.NumPad2, 				"if Cutscenes[2] ~= nil then StartCutscene(Cutscenes[2]) end"				,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.NumPad3, 				"if Cutscenes[3] ~= nil then StartCutscene(Cutscenes[3]) end"				,15)
        Input.KeyBindDown(Keys.ModifierControl + Keys.NumPad4, 				"if Cutscenes[4] ~= nil then StartCutscene(Cutscenes[4]) end"				,15)

	--	increase speed of game

	    SpeedUpGame()

	--	global debug flag (report outputs,...)

    	DebugOn = 1

	--	resources

		-- GlobalMissionScripting.GiveResouces(GetHumanPlayer(),10000, 12000, 12000, 12000, 18000, 12000)

	--	technology stuff

		ResearchAllUniversityTechnologies(1)

    --	exploration state

    	Display.SetRenderFogOfWar(-1)

    	GUI.MiniMap_SetRenderFogOfWar(-1)

	-- 	output mouse information

    	StartJob("Modifier")

	end

-------------------------------------------------------------------------------------------------------
--
--	                DisableDegugging()
--
-------------------------------------------------------------------------------------------------------

DisableDegugging = function()
    DebugOn = 0
    Display.SetRenderFogOfWar(-1)
    GUI.MiniMap_SetRenderFogOfWar(-1)
	end

-------------------------------------------------------------------------------------------------------
--
--	                CreateDebugTroops()
--
-------------------------------------------------------------------------------------------------------

CreateDebugTroops = function(_player)

	local position = {}

	position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()

	if position.X == -1 then
		Report("invalid mouse position")
		return
		end


	local troopDescription = {

		leaderType 			= Entities.PU_Scout,
		maxNumberOfSoldiers	= 9,
		minNumberOfSolderis	= 9,
	}

	local exp = Logic.GetRandom(5)

	if 		exp == 0 then
		troopDescription.experiencePoints 	= VERYLOW_EXPERIENCE
	elseif	exp == 1 then
		troopDescription.experiencePoints 	= LOW_EXPERIENCE
	elseif	exp == 2 then
		troopDescription.experiencePoints 	= MEDIUM_EXPERIENCE
	elseif	exp == 3 then
		troopDescription.experiencePoints 	= HIGH_EXPERIENCE
	elseif	exp == 4 then
		troopDescription.experiencePoints 	= VERYHIGH_EXPERIENCE
		end

	army = {}

	army.player 	= 	_player --GUI.GetPlayerID()
	army.id			=	1
	army.position	=	position

    troopDescription.experiencePoints 	= VERYHIGH_EXPERIENCE

	CreateTroop(army,troopDescription)

	troopDescription.leaderType = Entities.PU_LeaderRifle2

	CreateTroop(army,troopDescription)
	CreateTroop(army,troopDescription)
	CreateTroop(army,troopDescription)

	troopDescription.leaderType = Entities.PV_Cannon4

	CreateTroop(army,troopDescription)
	CreateTroop(army,troopDescription)

	end

-------------------------------------------------------------------------------------------------------
--
--		DebugSetPositionOfDario()
--
-------------------------------------------------------------------------------------------------------

function DebugSetPositionOfDario()

	local position = {}

	position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()

	SetPosition("Dario", position)

end


-------------------------------------------------------------------------------------------------------
--
--		DebugRemoveEntities()
--
-------------------------------------------------------------------------------------------------------

DebugRemoveEntities = function()

	local position = {}

	position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()

	-- Destroy all entities near cursor
	local entities = { Logic.GetEntitiesInArea(0, position.X, position.Y, 100, 10, 63) }
	local i
	for i=2, entities[1] + 1 do

		DestroyEntity(entities[i])

	end
end

-------------------------------------------------------------------------------------------------------
--
--	                Report(<text>)
--
-------------------------------------------------------------------------------------------------------

Report = function(_Text)
	if DebugOn == 1 then
		GUI.AddNote("DEBUG REPORT: ".._Text)
		end
	end



-------------------------------------------------------------------------------------------------------
--
--	                SpeedUpGame()
--
-------------------------------------------------------------------------------------------------------

SpeedUpGame = function()

    for i=1,2,1 do

        Game.GameTimeSpeedUp()

        end

    end

-------------------------------------------------------------------------------------------------------
--
--	                IncludeLocals(<table of scriptnames>)
--
-------------------------------------------------------------------------------------------------------

IncludeLocals = function(_scriptNames)
    if type(_scriptNames) == "table" then
        table.foreach(_scriptNames,function(_,_value)Script.Load(Folders.Map.._value..".lua")end)
    else
        Script.Load(Folders.Map.._scriptNames..".lua")
        end
	end

-------------------------------------------------------------------------------------------------------
--
--	                IncludeGlobals(<table of scriptnames>)
--
-------------------------------------------------------------------------------------------------------

IncludeGlobals = function(_scriptNames)
	local globalFolder  = "Data\\Script\\MapTools\\"
    if type(_scriptNames) == "table" then
        table.foreach(_scriptNames,function(_,_value)Script.Load(globalFolder.._value..".lua")end)
    else
        Script.Load(globalFolder.._scriptNames..".lua")
        end
	end

-------------------------------------------------------------------------------------------------------
--
--	                FeedArmyWithWaypoints(<playerId>,<army id>,<waypoint callback>,<table with waypoint names>)
--
-------------------------------------------------------------------------------------------------------

FeedArmyWithWaypoints = function(_playerId,_armyId,_callback,_waypointFile)
    AI.Army_SetWaypointCallback(_playerId,_armyId,_callback)
    table.foreach(_waypointFile,function(_,_value)AI.Army_AddWaypoint(_playerId,_armyId,Logic.GetEntityIDByName(_value))end)
	end

-------------------------------------------------------------------------------------------------------
--
--	                <entityId> CreateTroop(<playerId>,<position>,<troop description table>)
--
-------------------------------------------------------------------------------------------------------

if 0==1 then

CreateTroop = function(_playerId,_position,_desc)

		return AI.Entity_CreateFormation(
			_playerId,
			_desc.leaderType,
			_desc.soldierType,
			_desc.maxNumberOfSoldiers,
			_position.X,_position.Y,
			0,0,
			_desc.experiencePoints,
			_desc.minNumberOfSoldiers
		)

	end
end

-------------------------------------------------------------------------------------------------------
--
--	                BuyUnit(<playerId>,<upgrade category>,<troop description table>)
--
-------------------------------------------------------------------------------------------------------

BuyUnit = function(_army,_upgradeCategory)

	if 		_upgradeCategory == UpgradeCategories.Cannon1 then
			_upgradeCategory = Entities.PV_Cannon1
	elseif	_upgradeCategory == UpgradeCategories.Cannon2 then
			_upgradeCategory = Entities.PV_Cannon2
	elseif	_upgradeCategory == UpgradeCategories.Cannon3 then
			_upgradeCategory = Entities.PV_Cannon3
	elseif	_upgradeCategory == UpgradeCategories.Cannon4 then
			_upgradeCategory = Entities.PV_Cannon4
		end

	AI.Army_BuyLeader(_army.player,_army.id,_upgradeCategory)

	end

-------------------------------------------------------------------------------------------------------
--
--	                CountedEnlargeArmy(<army description table>,<troop description table>,<counter>)
--
-------------------------------------------------------------------------------------------------------
CountedEnlargeArmy = function(_army,_troop,_counter)
	if _counter.value < _army.strength then
		AI.Entity_ConnectLeader(CreateTroop(_army,_troop),_army.id)
		_counter.value = _counter.value +1
		end
	end

-------------------------------------------------------------------------------------------------------
--
--	                <entityId> CreateTroop(<playerId>,<position>,<troop description table>)
--
-------------------------------------------------------------------------------------------------------

CreateTroop = function(_army,_desc)

	_desc.soldierType = 0

	if _desc.position == nil then

		return AI.Entity_CreateFormation(
			_army.player,
			_desc.leaderType,
			_desc.soldierType,
			_desc.maxNumberOfSoldiers,
			_army.position.X,_army.position.Y,
			0,0,
			_desc.experiencePoints,
			_desc.minNumberOfSoldiers
		)

	else

		return AI.Entity_CreateFormation(
			_army.player,
			_desc.leaderType,
			_desc.soldierType,
			_desc.maxNumberOfSoldiers,
			_desc.position.X,_desc.position.Y,
			0,0,
			_desc.experiencePoints,
			_desc.minNumberOfSoldiers
		)

		end

	end

-------------------------------------------------------------------------------------------------------
--
--	                ResearchAllUniversityTechnologies(<playerId>)
--
-------------------------------------------------------------------------------------------------------

ResearchAllUniversityTechnologies = function(_playerId)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Mercenaries,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_StandingArmy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Tactics,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Strategies,3)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Construction,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_ChainBlock,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_GearWheel,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Architecture,3)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Alchemy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Alloying,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Metallurgy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Chemistry,3)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Taxation,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Trading,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Banking,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Gilds,3)

	Logic.SetTechnologyState(_playerId,Technologies.GT_Literacy,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Printing,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Laws,3)
	Logic.SetTechnologyState(_playerId,Technologies.GT_Library,3)

	if ResearchAllUniversityTechnologies_Extra ~= nil then
		ResearchAllUniversityTechnologies_Extra(_playerId)
	end

end

-------------------------------------------------------------------------------------------------------
--
--	                Break()
--
-------------------------------------------------------------------------------------------------------

Break = function()

	Mouse.CursorShow()

	LuaDebugger.Break()

	end

-------------------------------------------------------------------------------------------------------
--
--	                <number of soldiers> GetNumberOfSoldiers(<army description table>)
--
-------------------------------------------------------------------------------------------------------

-- there is a new function in the comfort layer, called GetNumberOfLeaders...
GetNumberOfSoldiers = function(_army)

	return AI.Army_GetNumberOfTroops(_army.player,_army.id)

	end

-------------------------------------------------------------------------------------------------------
--
--	                ClearMessages()
--
-------------------------------------------------------------------------------------------------------

ClearMessages = function()
	end

-------------------------------------------------------------------------------------------------------
--
--	                Info(<title>,<text table>,<position of camera>)
--
-------------------------------------------------------------------------------------------------------

Title = function(_text)

	Message("")
	Message("@color:255,190,0 ".._text)
	Message("---------------------------------------------------------------------------------------")

	end

Info = function(_text,_position)

	if _position ~= nil then

		Camera.ScrollUpdateZMode(0)

		Camera.FlyToLookAt(CameraLookAt_x, CameraLookAt_y, _Duration)

		Camera.ScrollSetLookAt(_position.X,_position.Y)
		Camera.ZoomSetDistance(4450)
		Camera.RotSetAngle(-58)
		Camera.ZoomSetAngle(9)

		GUI.ScriptSignal(_position.X,_position.Y,0)

		end

	if type(_text) == "table" then
		table.foreach(_text,function(_,_value)Message(_value)end)
	else
		Message(_text)
		end

	end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "Modifier"
--
-----------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------
	Condition_Modifier = function()
	-------------------------------------------------------------------------------------------------------------------

		return true

		end

	-------------------------------------------------------------------------------------------------------------------
	Action_Modifier = function()
	-------------------------------------------------------------------------------------------------------------------

		local text

		--	collect information about the current selected entity
		-- 	*****************************************************

			local selectedEntityId = GUI.GetSelectedEntity()

			local positionOfSelectedEntityId = {}

			if selectedEntityId ~= 0 then
				positionOfSelectedEntityId = GetPosition(selectedEntityId)
				end

		--	get the current mouse position
		--	******************************

			local position = {}

			position.X,position.Y = GUI.Debug_GetMapPositionUnderMouse()

		--	compute the distance between selected entity and mouse
		--	******************************************************

			local distance

			if selectedEntityId ~= 0 then
				distance = 	math.sqrt(
								(position.X - positionOfSelectedEntityId.X) * (position.X - positionOfSelectedEntityId.X) +
								(position.Y - positionOfSelectedEntityId.Y) * (position.Y - positionOfSelectedEntityId.Y)
							)
			else
				distance = 0
				end

		-- 	output the debug information
		--	****************************

			if distance == 0 then
				text = "MouseX: "..position.X.." MouseY: "..position.Y.." Seconds: "..TimeLine.Seconds
			else
				text = "MouseX: "..position.X.." MouseY: "..position.Y.." Distance: "..distance.." Seconds: "..TimeLine.Seconds
				end

			GUI.MiniMapDebug_SetText(text)

		return false

		end
-----------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "TimeLineJob"
--
-----------------------------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimeLineJob = function()
	-------------------------------------------------------------------------------------------------------------------

		return true

		end

	-------------------------------------------------------------------------------------------------------------------
	Action_TimeLineJob = function()
	-------------------------------------------------------------------------------------------------------------------

	    TimeLine.Update()

		return false

		end
-----------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ChestJob"
--
-----------------------------------------------------------------------------------------------------------------------
Condition_ChestJob = function()
	return true
	end
Action_ChestJob = function()
	for i = 1 , table.getn(chestControl.list) , 1 do
		if chestControl.list[i].state == CHEST_CLOSED then
			for j = 1 , table.getn(chestOpener) , 1 do
				if IsNear(chestOpener[j],chestControl.list[i].name,250) then
					chestControl.list[i].callback()
					chestControl.list[i].state = CHEST_OPENED
					ReplaceEntity(chestControl.list[i].name,Entities.XD_ChestOpen)

					Sound.PlayGUISound( Sounds.OnKlick_Select_erec, 0 )
--					Sound.PlayGUISound(Sounds.Misc_Chat,65)
					end
				end
			end
		end
	return false
	end


-------------------------------------------------------------------------------------------------------
--
--	                <player id> GetHumanPlayer()
--
-------------------------------------------------------------------------------------------------------

GetHumanPlayer = function()

	return GUI.GetPlayerID()

	end

ApproachTask = function(_MovingEntity,_TargetEntity,_Distance)

	-- Entities valid
	if 		_MovingEntity == 0 or IsDead(_MovingEntity)
		or	_TargetEntity == 0 or IsDead(_TargetEntity) then

		return true
	end

	-- Is entity near target
	if IsNear(_MovingEntity,_TargetEntity,_Distance) then

		-- Stop moving entity and destroy task
		if Logic.IsEntityMoving(_MovingEntity) then
			Move(_MovingEntity, _MovingEntity)
		end

		return true

	else

		return false

	end
end

-------------------------------------------------------------------------------------------------------
--					GetID(<entity>)
-------------------------------------------------------------------------------------------------------

GetID = function(_entity)

	if type(_entity) == "string" then

		if Logic.IsEntityDestroyed(_entity) then
			return 0
		end

		return Logic.GetEntityIDByName(_entity)

	elseif type(_entity) == "number" then


		return _entity

	end

	return 0
end

-------------------------------------------------------------------------------------------------------
--
--	                EnableNpcMarker(<entity>)
--
-------------------------------------------------------------------------------------------------------

EnableNpcMarker = function(_entity)

	Logic.SetOnScreenInformation(GetEntityId(_entity),1)

	end

-------------------------------------------------------------------------------------------------------
--
--	                DisableNpcMarker(<entity>)
--
-------------------------------------------------------------------------------------------------------

DisableNpcMarker = function(_entity)

	if IsDead(_entity) then

		return

		end

	Logic.SetOnScreenInformation(GetEntityId(_entity),0)

	end

-------------------------------------------------------------------------------------------------------
--
--	                <amount> Get<Resource>(<playerId>)
--
--	if playerId is nil, function use human player id
--	return amount of raw and refined resource
--
-------------------------------------------------------------------------------------------------------
function GetGold(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Gold ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.GoldRaw)
end
function GetSulfur(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Sulfur ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.SulfurRaw)
end
function GetStone(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Stone ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.StoneRaw)
end
function GetIron(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Iron ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.IronRaw)
end
function GetClay(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Clay ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.ClayRaw)
end
function GetWood(_playerId)

	if _playerId == nil then
		_playerId = GetHumanPlayer()
	end
	return Logic.GetPlayersGlobalResource( _playerId, ResourceType.Wood ) + Logic.GetPlayersGlobalResource( _playerId, ResourceType.WoodRaw)
end

-------------------------------------------------------------------------------------------------------
--
--	                Add<Resource>(<playerId>,<amount>)
--
-------------------------------------------------------------------------------------------------------

AddGold = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Gold,_amount)
	end

AddSulfur = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Sulfur,_amount)
	end

AddStone = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Stone,_amount)
	end

AddIron = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Iron,_amount)
	end

AddClay = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Clay,_amount)
	end

AddWood = function(_playerId,_amount)
	if _amount == nil then
		_amount = _playerId
		_playerId = GetHumanPlayer()
		end
	Logic.AddToPlayersGlobalResource(_playerId,ResourceType.Wood,_amount)
	end


GetPoleArm = function(_strength)
	if _strength <= 0 then
		return Entities.PU_LeaderPoleArm1
	elseif _strength <= 1 then
		return Entities.PU_LeaderPoleArm2
	elseif _strength <= 2 then
		return Entities.PU_LeaderPoleArm3
	else
		return Entities.PU_LeaderPoleArm4
		end
	end

GetSword = function(_strength)
	if _strength <= 0 then
		return Entities.PU_LeaderSword1
	elseif _strength <= 1 then
		return Entities.PU_LeaderSword2
	elseif _strength <= 2 then
		return Entities.PU_LeaderSword3
	else
		return Entities.PU_LeaderSword4
		end
	end

GetBow = function(_strength)
	if _strength <= 0 then
		return Entities.PU_LeaderBow1
	elseif _strength <= 1 then
		return Entities.PU_LeaderBow2
	elseif _strength <= 2 then
		return Entities.PU_LeaderBow3
	else
		return Entities.PU_LeaderBow4
		end
	end

GetHeavyCavalry = function(_strength)
	if _strength <= 0 then
		return Entities.PU_LeaderHeavyCavalry1
	elseif _strength <= 1 then
		return Entities.PU_LeaderHeavyCavalry1
	elseif _strength <= 2 then
		return Entities.PU_LeaderHeavyCavalry2
	else
		return Entities.PU_LeaderHeavyCavalry2
		end
	end

GetLightCavalry = function(_strength)
	if _strength <= 0 then
		return Entities.PU_LeaderCavalry1
	elseif _strength <= 1 then
		return Entities.PU_LeaderCavalry1
	elseif _strength <= 2 then
		return Entities.PU_LeaderCavalry2
	else
		return Entities.PU_LeaderCavalry2
		end
	end

GetCannon = function(_strength)
	if _strength <= 0 then
		return Entities.PV_Cannon1
	elseif _strength <= 1 then
		return Entities.PV_Cannon2
	elseif _strength <= 2 then
		return Entities.PV_Cannon3
	else
		return Entities.PV_Cannon4
		end
	end


StartSpeech = function(_key)

		if _key ~= nil then

			local tablePos = string.find(_key, "/")
			if tablePos ~= nil then
				Stream.Start("Voice\\"..string.sub(_key, 1, tablePos-1).."\\"..string.sub(_key, tablePos + 1, -1)..".mp3", 127)
			end
		end

end



-----------------------------------------------------------------------------------------------------------
-- Get number of entities by name
-- Start with name1 to namen and return max number
-----------------------------------------------------------------------------------------------------------
GetNumberOfEntities = function(_Name)
	-- Start with zero count
	local Index = 1

	-- Is target valid
	if _Name ~= nil then

		-- Count existing entities
		while true do
			-- Is entity alive
			if IsDead(_Name..Index) then
				return Index - 1
			end
			-- Increase Index
			Index = Index + 1
		end
	end
	-- No name
	return 0
end


-----------------------------------------------------------------------------------------------------------
-- Setup tribute paid: Task that should be executed after tribute is paid
--
-- Tribute = Tribute ID that we are listening
--
-- Spawn = Table of to spawn units
--
--	Element:
--		Pos = Position where a group should spawn...optional
-- 		LeaderType = Type of leader
-- 		Soldiers = Amount of attached soldiers
--		RalleyPoint = Position where spawned soldiers should move...is optional and prefered before global ralleypoint
-- SpawnPlayer = Player ID for spawning units
--
-- Ralleypoint = Position where spawned soldiers or joined entities should move to...optional
--
-- Technologies = Technologies that are allowed after tribute is paid...optional
--
-- Resources = Table of resources that are hand out to player for this tribute...optional
--		gold, clay, wood, stone, iron, sulfur
--
-- Entities = Name of entities who joins player and move to optional ralleypoint...optional
-- Entity = Name of entity who joins player and move to optional ralleypoint...optional
--
-- Callback = Callback is called after tribute was paid...optional
-----------------------------------------------------------------------------------------------------------

SetupTributePaid = function(_Job)
	-- Remember data
	local Index = AddData(_Job)

	-- Hostage trigger
	Trigger.RequestTrigger( Events.LOGIC_EVENT_TRIBUTE_PAID,
				nil,
				"TributePaid_Action",
				1,
				nil,
				{Index})
end

TributePaid_Action = function(_Index)

	-- Is same tribute
	if Event.GetTributeUniqueID() == DataTable[_Index].Tribute then

		-- Is Spawn table valid
		if DataTable[_Index].Spawn ~= nil then

			-- Get spawn player
			local PlayerID = gvMission.PlayerID
			if DataTable[_Index].SpawnPlayer ~= nil then
				PlayerID = DataTable[_Index].SpawnPlayer
			end

			-- For every element in table
			local i
			for i=1,table.getn(DataTable[_Index].Spawn) do
				-- Get position
				local PosX, PosY = Tools.GetPosition(DataTable[_Index].Spawn[i].Pos)

				-- Create troop
				local LeaderID = AI.Entity_CreateFormation(
					PlayerID,
					DataTable[_Index].Spawn[i].LeaderType,
					0,
					DataTable[_Index].Spawn[i].Soldiers,
					PosX,PosY,
					0,0,
					LOW_EXPERIENCE,
					0
				)

				-- Valid local ralley point
				if DataTable[_Index].Spawn[i].Ralleypoint ~= nil then

					-- Send group to this position
					Move(LeaderID, DataTable[_Index].Spawn[i].Ralleypoint)

				-- Valid ralley point
				elseif DataTable[_Index].Ralleypoint ~= nil then
					-- Send group to this position
					Move(LeaderID, DataTable[_Index].Ralleypoint)
				end

				-- Valid local ralley point
				if DataTable[_Index].Spawn[i].AttackRalleypoint ~= nil then

					-- Send group to this position
					Attack(LeaderID, DataTable[_Index].Spawn[i].AttackRalleypoint)

				-- Valid ralley point
				elseif DataTable[_Index].AttackRalleypoint ~= nil then
					-- Send group to this position
					Attack(LeaderID, DataTable[_Index].AttackRalleypoint)
				end

			end
		end

		-- Any technologies there
		if DataTable[_Index].Technologies ~= nil then

			-- Give technologies
			local i
			for i = 1, table.getn(DataTable[_Index].Technologies) do
				-- Research tech
				Logic.SetTechnologyState(gvMission.PlayerID, DataTable[_Index].Technologies[i], 3)
			end

		end

		-- Resource table
		if DataTable[_Index].Resources ~= nil then

			-- Give resources
			Tools.GiveResouces(	gvMission.PlayerID,
						DataTable[_Index].Resources.gold,
						DataTable[_Index].Resources.clay,
						DataTable[_Index].Resources.wood,
						DataTable[_Index].Resources.stone,
						DataTable[_Index].Resources.iron,
						DataTable[_Index].Resources.sulfur)

		end

		-- Any entities
		if DataTable[_Index].Entities ~= nil then

			-- Change player
			local i = 1
			while true do

				-- Get name
				local Name = DataTable[_Index].Entities..i

				-- Is existing
				if not ChangeAndMove(Name,DataTable[_Index]) then

					-- no entity there, stop searching
					break

				end

				-- Next entity
				i = i + 1
			end
		end

		-- Any entity
		if DataTable[_Index].Entity ~= nil then
			ChangeAndMove(DataTable[_Index].Entity, DataTable[_Index])
		end

		return QuestCallback(_Index)

	end
end

ChangeAndMove = function(_Name, _Job)

	-- Is existing
	if IsAlive(_Name) then

		ChangePlayer(_Name, gvMission.PlayerID)

		-- Valid ralley point
		if _Job.Ralleypoint ~= nil and Logic.IsSettler(GetID(_Name)) == 1 then

			-- Send group to this position
			Move(_Name, _Job.Ralleypoint)
		end

		-- done
		return true

	else
		return false
	end
end

-----------------------------------------------------------------------------------------------------------
-- Give player resources: Set start resources for player
-- Parameter1:	Amount Type	1 = minimum
--				2 = normal
--				3 = much
-- Parameter2:	Player ID	this parameter is optional, gvMission.PlayerID is taken if nil
-----------------------------------------------------------------------------------------------------------

GeneratePlayerResources = function(_Type, _Player)

	-- Get player id
	local PlayerID = gvMission.PlayerID
	if _Player ~= nil then
		PlayerID = _Player
	end

	-- On Type
	if _Type == 1 then

		-- Give minimum resources
		Tools.GiveResouces(PlayerID, 100, 200, 200, 200, 0, 0)

	elseif _Type == 2 then

		-- Give normal resources
		Tools.GiveResouces(PlayerID, 200, 400, 400, 400, 200, 0)

	elseif _Type == 3 then

		-- Give much resources
		Tools.GiveResouces(PlayerID, 400, 800, 800, 800, 400, 200)

	end

end

-----------------------------------------------------------------------------------------------------------
-- Offensive AI Controler
--
-- .id = Army ID
-- .player = Player ID
-- .position = defensePosition
-- .strength = attack if this strength reached
-- .retreatStrength = stop attack and retreat for refreshing
-- .baseDefenseRange = until fully refreshed stay in this distance near defenseposition
-- .outerDefenseRange = if fully refreshed but no attack allowed stay in this distance
-- .AttackAllowed = if true army attacks neares enemy if stron enough
-- .AttackPos = using attack position if any there..optional, can also be a table
-- .pulse = army is starting frontal attack for some seconds and returning then back to their defend positions...optional
--			is good to protect against cannon attacks
-----------------------------------------------------------------------------------------------------------

TickOffensiveAIController = function(_army)

	---
	--- collect important information
	---------------------------------
	local army				= _army.id
	local player			= _army.player
	local numberOfTroops	= AI.Army_GetNumberOfTroops(player,army)
	local position			= _army.position

-------------------------------------------------------------
-- Init
-------------------------------------------------------------
	if _army.offensiveAIControllerState == nil then

	    Retreat(_army,_army.outerDefenseRange)
		_army.rodeLength = _army.outerDefenseRange

		_army.offensiveAIControllerState = 0

		Report(	"Initialize Army P:"..player..
				" A: "..army.." into defensive mode")
	end


-------------------------------------------------------------
-- Defensive
-------------------------------------------------------------
	if _army.offensiveAIControllerState == 0 then

		-- enough soldiers
		if numberOfTroops > _army.retreatStrength and not AI.Army_IsRefreshing(player, army) then

			_army.offensiveAIControllerState = 1

			_army.rodeLength = _army.outerDefenseRange
			AI.Army_SetAnchorRodeLength(player, army, _army.rodeLength)

			Report(	"Army P:"..player..
					" A: "..army..
					" has enuogh soldiers("..numberOfTroops..
					") and switch into Offensive Defense")
		else

			AIController_Defensive( _army, _army.baseDefenseRange )

		end
-------------------------------------------------------------
-- Offensive Defense
-------------------------------------------------------------
	elseif _army.offensiveAIControllerState == 1 then

		if numberOfTroops <= _army.retreatStrength then

			_army.offensiveAIControllerState = 0

			_army.rodeLength = _army.baseDefenseRange
			AI.Army_SetAnchorRodeLength(player, army, _army.rodeLength)

			Report(	"Army P:"..player..
					" A: "..army..
					" has not enuogh soldiers("..numberOfTroops..
					") and switch back to Defense")

		elseif numberOfTroops >= _army.strength and _army.AttackAllowed and not AI.Army_IsRefreshing(player, army) then

			_army.offensiveAIControllerState = 2

			Report(	"Army P:"..player..
					" A: "..army..
					" has enuogh soldiers("..numberOfTroops..
					") and switch to attack")

			if _army.AttackPos ~= nil then

				if table.getn(_army.AttackPos) ~= 0 then

					local Index = Logic.GetRandom(table.getn(_army.AttackPos))+1

					AI.Army_SetAnchor(player, army, _army.AttackPos[Index].X, _army.AttackPos[Index].Y, 0)

					Report( "Attacking Position X(".._army.AttackPos[Index].X..") Y(".._army.AttackPos[Index].Y..")")

				else

					AI.Army_SetAnchor(player, army, _army.AttackPos.X, _army.AttackPos.Y, 0)

					Report( "Attacking Position X(".._army.AttackPos.X..") Y(".._army.AttackPos.Y..")")

				end
			end

			_army.Attack = true

		else

			if _army.pulse ~= nil and not AI.Army_IsRefreshing(player, army) then

				if _army.pulseCounter == nil or _army.pulseCounter == 0 then
					_army.pulseCounter = Logic.GetTime() + 61 + Logic.GetRandom(60)
				end

				if Logic.GetTime() > _army.pulseCounter then

					_army.pulseCounter = 0
					_army.offensiveAIControllerState = 3

					Report(	"Army P:"..player..
							" A: "..army..
							" is not refreshing and starting to pulse")
				end

			end

			AIController_Defensive( _army, _army.outerDefenseRange )

		end
-------------------------------------------------------------
-- Attack
-------------------------------------------------------------
	elseif _army.offensiveAIControllerState == 2 then

		if numberOfTroops <= _army.retreatStrength then

			_army.offensiveAIControllerState = 0

			_army.Attack = false

			 Retreat(_army,_army.baseDefenseRange)
			_army.rodeLength = _army.baseDefenseRange

			Report(	"Army P:"..player..
					" A: "..army..
					" has not enuogh soldiers("..numberOfTroops..
					") and switch back to Defense")

		elseif not _army.AttackAllowed then

			_army.offensiveAIControllerState = 1

			 _army.Attack = false

			 Retreat(_army,_army.outerDefenseRange)
			_army.rodeLength = _army.outerDefenseRange

			Report(	"Army P:"..player..
					" A: "..army..
					" has enuogh soldiers("..numberOfTroops..
					") but attack was forbidden switch back to Offensive Defense")

		else

			Advance(_army)

		end

-------------------------------------------------------------
-- Start Pulse
-------------------------------------------------------------
	elseif _army.offensiveAIControllerState == 3 then

		-- Start frontal attack
		FrontalAttack(_army)
		_army.offensiveAIControllerState = 4
		_army.pulseCounter = Logic.GetTime() + 11 + Logic.GetRandom(10)

		Report(	"Army P:"..player..
				" A: "..army..
				" get pulse(frontal attack) command for ".._army.pulseCounter-Logic.GetTime()..
				" seconds")

-------------------------------------------------------------
-- Pulse active
-------------------------------------------------------------
	elseif _army.offensiveAIControllerState == 4 then

		if Logic.GetTime() > _army.pulseCounter then

			_army.offensiveAIControllerState = 1

			 Retreat(_army,_army.outerDefenseRange)

			_army.rodeLength = _army.outerDefenseRange

			_army.pulseCounter = 0

			Report(	"Army P:"..player..
					" A: "..army..
					" pulse(frontal attack) command is done, back to Offensive Defense")

		end

	end

end


AIController_Defensive = function(_army, _range)

		if AI.Army_GetAnchorRodeLength(_army.player, _army.id) > _range then

		    Retreat(_army,_range)
			_army.rodeLength = _range

		else

			Defend(_army)

		end
end

function ResetOffensiveAIController(_army)

	_army.offensiveAIControllerState = nil

end

-----------------------------------------------------------------------------------------------------------
-- Create ai troop generator: Spawn all troops at the beginning and refill every respawn
--
-- .strength = spawn up to this troops
--
-- .spawnTypes = Table of to spawn units,    one element { Leader Type, soldier amount }
-- .endless = restart at table start if end of list reached, else destroy generator
--
-- .spawnPos = Where should be the units spawned
-- .spawnGenerator = Which object is spawning units...optional
--
-- .respawnTime = time to respawn to full strength...spawn missing troops
--
-- .refresh = refresh soldiers to full strength if group is damaged...optional, true on default
-- .maxSpawnAmount = optional...if not given, all missings units respawned, will be ignored at first spawn
--
-- .noEnemy = if true it will spawn troops only if no enemy near...optional
-- .noEnemyDistance = check for enemies in this distance
-----------------------------------------------------------------------------------------------------------

SetupAITroopSpawnGenerator = function(_Name, _army)

	local Index = AddData(_army)

	-- Setup trigger
	assert(_army.generatorID==nil, "There is already a generator registered")
	_army.generatorID = Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
					"AITroopSpawnGenerator_Condition",
					"AITroopSpawnGenerator_Action",
					1,
					{_Name, Index},
					{_Name, Index})
end

AITroopSpawnGenerator_Condition = function(_Name, _Index)

	-- Not enough troops
	if Counter.Tick2(_Name,10) then

		-- First spawn done
		if DataTable[_Index].firstSpawnDone == nil or DataTable[_Index].firstSpawnDone == false then

			return true

		else
			if 	AI.Army_GetNumberOfTroops(DataTable[_Index].player,DataTable[_Index].id) < DataTable[_Index].strength
				and
				( DataTable[_Index].noEnemy == nil or DataTable[_Index].noEnemy == false or GetClosestEntity(DataTable[_Index], DataTable[_Index].noEnemyDistance) == 0)
			then

				return Counter.Tick2(_Name.."_Respawn",DataTable[_Index].respawnTime/10)

			end
		end
	end
end

AITroopSpawnGenerator_Action = function(_Name, _Index)

	-- Any current spawn index? No Create one
	if DataTable[_Index].spawnIndex == nil then
		DataTable[_Index].spawnIndex = 1
	end

	-- Is any generator building there and dead...destroy this generator
	if DataTable[_Index].spawnGenerator ~= nil and IsDead(DataTable[_Index].spawnGenerator) then
		return true
	end

	-- Get missing army count
	local missingTroops = DataTable[_Index].strength - AI.Army_GetNumberOfTroops(DataTable[_Index].player,DataTable[_Index].id)

	-- Is max spawn amount set
	if DataTable[_Index].firstSpawnDone ~= nil and DataTable[_Index].maxSpawnAmount ~= nil then
		-- Set to max
		if missingTroops > DataTable[_Index].maxSpawnAmount then
			missingTroops = DataTable[_Index].maxSpawnAmount
		end
	end

	-- Spawn missing army
	local i
	for i=1,missingTroops do

		-- Any data there
		if DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex] == nil then

			-- End of queue reached, destroy job or restart
			if DataTable[_Index].endless ~= nil and DataTable[_Index].endless then

				Report("Spawn Generator ".._Name.." reach end of list and restart with first leader type")

				-- restart
				DataTable[_Index].spawnIndex = 1

			else

				Report("Spawn Generator ".._Name.." is empty and was destroyed")

				-- stop job
				DataTable[_Index].generatorID = nil
				return true
			end
		end

		-- Min number...if should not refresh, number is zero
		local minNumber = DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex][2]
		if DataTable[_Index].refresh ~= nil and not DataTable[_Index].refresh then
				minNumber = 0
		end
			
		-- Leader experience
		local leaderExperience = 0
		if DataTable[_Index].experiencePoints ~= nil and DataTable[_Index].experiencePoints > 0 and DataTable[_Index].experiencePoints <= 3 then
			leaderExperience = DataTable[_Index].experiencePoints
		end

		Report	("Spawn Generator ".._Name..
				" spawns "..DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex][2]..
				" soldiers for player "..DataTable[_Index].player..
				" of type "..Logic.GetEntityTypeName(DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex][1]))

		-- Enlarge army
		AI.Entity_ConnectLeader(AI.Entity_CreateFormation(
									DataTable[_Index].player,
									DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex][1],
									0,
									DataTable[_Index].spawnTypes[DataTable[_Index].spawnIndex][2],
									DataTable[_Index].spawnPos.X,DataTable[_Index].spawnPos.Y,
									0,0,
									leaderExperience,
									minNumber
								), DataTable[_Index].id )

		-- Next index
		DataTable[_Index].spawnIndex = DataTable[_Index].spawnIndex + 1

	end

	-- First spawn done
	DataTable[_Index].firstSpawnDone = true

	return false

end

IsAITroopGeneratorDead = function(_army)
	-- Is army dead
	if IsDead(_army) then
		-- Is generator dead
		return Trigger.IsTriggerEnabled(_army.generatorID) == 0
	end
	return false
end

DestroyAITroopGenerator = function(_army)
	Trigger.UnrequestTrigger(_army.generatorID)
	_army.generatorID = nil
end
-----------------------------------------------------------------------------------------------------------
-- Move an entity to position and remove if it moves into fog
--
-- Param1:	Entity
-- Param2:	Position
-----------------------------------------------------------------------------------------------------------

MoveAndVanish = function(_Entity,_Position)

	Move(_Entity, _Position)
	Tools.RemoveEntityInFogOrDestination(gvMission.PlayerID, GetID(_Entity), _Position)
end

-----------------------------------------------------------------------------------------------------------
-- Display text in tribute widget
--
-- Param1:	Text
-----------------------------------------------------------------------------------------------------------

TributeMessage = function(_Text)

	XGUIEng.SetText("TradeWindowInfoWidget", _Text)

end

-----------------------------------------------------------------------------------------------------------
-- Start cutscene
--
-- Param1:	Cutscene Name
-- Param2:	Callback
-----------------------------------------------------------------------------------------------------------

StartCutscene = function(_Name, _Callback)

	-- Remember callback
	CutsceneCallback = _Callback

	-- Stop trigger system
	Trigger.DisableTriggerSystem(1)

	-- Invulnerability for all entities
	Logic.SetGlobalInvulnerability(1)

	--	forbid feedback sounds

	GUI.SetFeedbackSoundOutputState(0)

	-- no shapes during cutscene
	Display.SetProgramOptionRenderOcclusionEffect(0)

	-- cutscene input mode
	Input.CutsceneMode()

	-- Start cutscene
	Cutscene.Start(_Name)

	assert(cutsceneIsActive ~= true)
	cutsceneIsActive = true

	LocalMusic_UpdateMusic()

	--	backup
	Cutscene.Effect = Sound.GetVolumeAdjustment(3)
	Cutscene.Ambient = Sound.GetVolumeAdjustment(5)
	Cutscene.Music = Music.GetVolumeAdjustment()

	--	half volume
	Sound.SetVolumeAdjustment(3, Cutscene.Effect * 0.5)
	Sound.SetVolumeAdjustment(5, Cutscene.Ambient * 0.5)
	Music.SetVolumeAdjustment(Cutscene.Music * 0.5)

	--	stop feedback sounds
	Sound.PlayFeedbackSound(0,0)
end

-----------------------------------------------------------------------------------------------------------
-- Cutscene Done must be called in cutscene finished and cancel
-----------------------------------------------------------------------------------------------------------

CutsceneDone = function()

	-- Enable trigger system again
	Trigger.DisableTriggerSystem(0)

	-- Vulnerability for all entities
	Logic.SetGlobalInvulnerability(0)

	--	allow feedback sounds

	GUI.SetFeedbackSoundOutputState(1)

	-- show shapes after cutscene
	Display.SetProgramOptionRenderOcclusionEffect(1)

	-- game input mode
	Input.GameMode()

	--	full volume
	Sound.SetVolumeAdjustment(3, Cutscene.Effect)
	Sound.SetVolumeAdjustment(5, Cutscene.Ambient)
	Music.SetVolumeAdjustment(Cutscene.Music)

	--	stop speech
	Stream.Stop()

	cutsceneIsActive = false

	-- Back to game control
	if CutsceneCallback ~= nil then
		CutsceneCallback()
	end

end

-----------------------------------------------------------------------------------------------------------
--	<bool>	Is Cutscene Active
-----------------------------------------------------------------------------------------------------------

IsCutsceneActive = function()

	return cutsceneIsActive == true

end

-----------------------------------------------------------------------------------------------------------
--	SetupAITroopGenerator: Buy troops until army is stron enough
--
--	.strength = spawn up to this troops
--
--  .AllowedTypes = table of types that can be produced, use upgrade categories for soldiers and entity types for cannons
--
--  .ignoreAttack = refresh army even if attacking else wait until attack finished
-----------------------------------------------------------------------------------------------------------

SetupAITroopGenerator = function(_Name, _army)

	local Index = AddData(_army)

	-- Setup trigger
	assert(_army.generatorID==nil, "There is already a generator registered")
	_army.generatorID = Trigger.RequestTrigger( Events.LOGIC_EVENT_EVERY_SECOND,
												"AITroopGenerator_Condition",
												"AITroopGenerator_Action",
												1,
												{_Name, Index},
												{Index})

end
AITroopGenerator_Condition = function(_Name, _Index)

	-- Not enough troops
	if 	Counter.Tick2(_Name.."Generator",10) == false
		or
		(
			(
				DataTable[_Index].ignoreAttack == nil
				or	not DataTable[_Index].ignoreAttack
			)
			and	DataTable[_Index].Attack
		) then
		return false
	end

	-- Already enough
	if AI.Army_GetNumberOfTroops(DataTable[_Index].player, DataTable[_Index].id) < DataTable[_Index].strength then

		-- Connect unemployed leader
		AI.Entity_ConnectUnemployedLeaderToArmy(DataTable[_Index].player, DataTable[_Index].id, 12)

	end

	return AI.Army_GetNumberOfTroops(DataTable[_Index].player, DataTable[_Index].id) < DataTable[_Index].strength

end
AITroopGenerator_Action = function(_Index)

	-- Get table size
	local UpgradeCategoryCount = table.getn(DataTable[_Index].AllowedTypes)

	-- Get random category
	local UpgradeCategoryIndex = Logic.GetRandom(UpgradeCategoryCount)+1

	AI.Army_BuyLeader(DataTable[_Index].player, DataTable[_Index].id, DataTable[_Index].AllowedTypes[UpgradeCategoryIndex])

	return false

end

-----------------------------------------------------------------------------------------------------------
-- <ID>	AddDefeatEntity <Name>, <UpdatePosFlag>
-- If entity dies, player has lost, show entity to player before EndScreen
-----------------------------------------------------------------------------------------------------------
AddDefeatEntity = function(_Name, _UpdatePos)

	assert(IsAlive(_Name))

	return AddDefeatCondition(	function(_Index) return IsDead(DataTable[_Index].posList[1].name) end,
								{ { name = _Name, updatePos = _UpdatePos } })
end
-----------------------------------------------------------------------------------------------------------
-- <ID>	AddDefeatCondition <Function>, <List of Position elements>
--										Element:{ <name>, <updatePos> }
-- if updatePos is set, position is updated every second else it is stored in first function call
-- after <Function> returns true, a briefing shows the position of first dead element in list
-- before game endscreen is displayed
-- if only one position in list, this position is used even if entity representing this pos is alive (scriptentity)
-----------------------------------------------------------------------------------------------------------
AddDefeatCondition = function(_function, _posList)

	-- Setup table
	local	Defeat		=	{}

	Defeat.condition	=	_function
	Defeat.posList		=	_posList

	local i
	for i=1, table.getn(Defeat.posList) do

		if IsAlive(Defeat.posList[i].name) then

			Defeat.posList[i].pos = GetPosition(Defeat.posList[i].name)

		end
	end

	local Index = AddData(Defeat)

	return Trigger.RequestTrigger(	Events.LOGIC_EVENT_EVERY_SECOND,
									"DefeatCon_Condition",
									"DefeatCon_Action",
									1,
									{Index},
									{Index})

end
DefeatCon_Condition = function(_Index)

	--	not during briefing
	if IsBriefingActive() then
		return false
	end

	--	Should update position
	local i
	for i=1, table.getn(DataTable[_Index].posList) do

		if DataTable[_Index].posList[i].updatePos ~= nil and DataTable[_Index].posList[i].updatePos then

			if IsAlive(DataTable[_Index].posList[i].name) then

				DataTable[_Index].posList[i].pos = GetPosition(DataTable[_Index].posList[i].name)

			end
		end
	end

	return DataTable[_Index].condition(_Index)
end
DefeatCon_Action = function(_Index)

	--	Get dead entity pos
	local position
	local i
	for i=1, table.getn(DataTable[_Index].posList) do

		if IsDead(DataTable[_Index].posList[i].name) or table.getn(DataTable[_Index].posList) == 1 then

			position = DataTable[_Index].posList[i].pos
			break

		end
	end

	--	Create briefing
	briefingDefeated 				= 	{}
	briefingDefeated.finished		=	DefeatBreifingFinished

	briefingDefeated[1] 			= 	{}
	briefingDefeated[1].title		= 	String.GenericKey("PlayerLost.title")
	briefingDefeated[1].text		=	String.GenericKey("PlayerLost")
	briefingDefeated[1].position 	= 	position

	if Logic.IsMapPositionExplored(1, position.X, position.Y) == 0 then
		briefingDefeated[1].explore		=	1000
	end

	StartBriefing(briefingDefeated)

	return true
end
DefeatBreifingFinished = function()
	Defeat()
end

-----------------------------------------------------------------------------------------------------------
-- RemoveDefeatCondition <ID>
-----------------------------------------------------------------------------------------------------------
RemoveDefeatCondition = function(_ID)
	Trigger.UnrequestTrigger(_ID)
end







----------------------------------------------------------------------------------------
-- Start Countdown
----------------------------------------------------------------------------------------
function MapLocal_StartCountDown(_time)

	GUIAction_ToggleStopWatch(_time, 1)

end


----------------------------------------------------------------------------------------
-- Stop Countdown
----------------------------------------------------------------------------------------
function MapLocal_StopCountDown(_time)

	GUIAction_ToggleStopWatch(_time, 0)

end


----------------------------------------------------------------------------------------
-- Backup Camera position
----------------------------------------------------------------------------------------
function MapLocal_CameraPositionBackup()

	CameraPositionBackup_x, CameraPositionBackup_y = Camera.ScrollGetLookAt()

end


----------------------------------------------------------------------------------------
-- Restore Camera position
----------------------------------------------------------------------------------------
function MapLocal_CameraPositionRestore()

	assert(CameraPositionBackup_x ~= nil)
	Camera.ScrollSetLookAt(CameraPositionBackup_x, CameraPositionBackup_y)

end

----------------------------------------------------------------------------------------
-- Start Bink Video < video name without extension>
----------------------------------------------------------------------------------------
function StartBinkVideo(_name)
	Mouse.CursorHide()
	Sound.PauseAll(true)
	Framework.PlayVideo( "Videos\\".._name..".bik" )
	Sound.PauseAll(false)
	Mouse.CursorShow()
end

----------------------------------------------------------------------------------------
-- Setup jingle trigger for tributes  < video name without extension>
----------------------------------------------------------------------------------------

SetupTributeJingle = function()

	assert(tributeJingleTriggerId==nil)
	tributeJingleTriggerId = Trigger.RequestTrigger( 	Events.LOGIC_EVENT_TRIBUTE_PAID,
														"TributeJingleCondition",
														"TributeJingleAction",
														1)
end

TributeJingleCondition = function()

	return Event.GetSourcePlayerID() == GetHumanPlayer()

end

TributeJingleAction = function()

	--play sound
	Sound.PlayGUISound( Sounds.OnKlick_Select_helias, 127 )
	XGUIEng.ShowWidget("TradeWindow",0)

	return false
end

----------------------------------------------------------------------------------------
-- spoken message <string key>
----------------------------------------------------------------------------------------

SpokenMessage = function(_key)

	Message(XGUIEng.GetStringTableText(_key))

	StartSpeech(_key)

end

----------------------------------------------------------------------------------------
-- spoken cinematic text <string key>
----------------------------------------------------------------------------------------

SpokenCinematicText = function(_key)

	GUIAction_DisplayCinematicText(_key)

	StartSpeech(_key)

end

----------------------------------------------------------------------------------------
-- Add periodic weather element, min time is 5
----------------------------------------------------------------------------------------

AddWeatherElement = function(_time, _weatherType,_isPeriodic)

	assert(_weatherType~=nil)
	assert(_isPeriodic~=nil)
	assert(_weatherType>0 and _weatherType <4)

	if _time == nil or _time < 5 then
		_time = 5
		end

	Logic.AddWeatherElement(_weatherType, _time, _isPeriodic, _weatherType, 5, 10)	    -- Summer

end

IncludeGlobals("Ai\\Support_Extra")
