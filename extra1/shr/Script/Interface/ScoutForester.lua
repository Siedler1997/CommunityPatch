
function ScoutFoerster_Init( _treeSet, _abilityCosts, _abilityCooldown )
	assert(not gvScoutFoerster, "ScoutFoerster_Init: multiple initialisation!");
	assert((type(_treeSet) == "table"), "ScoutFoerster_Init: invalid tree Set!");
	_abilityCosts = _abilityCosts or {};
	assert((type(_abilityCosts) == "table"), "ScoutFoerster_Init: invalid ability costs!");
	_abilityCooldown = _abilityCooldown or 120;
	assert((type(_abilityCooldown) == "number") and (_abilityCooldown >= 0), "ScoutFoerster_Init: invalid ability cooldown!");

	ScoutFoerster_gvScoutFoerster = {
	  -- Konstanten
		ABILITY_COSTS = _abilityCosts,
		PLANT_COOLDOWN = _abilityCooldown,
		PLANT_RANGE = 1000,
		PLANT_AMOUNT = 12,
		GROWTH_LEVELS = table.getn(_treeSet),
		GROWTH_TIME_MIN = 120,
		GROWTH_TIME_MAX = 240,
		WEATHER_FACTORS = {2,3,1},
	  -- Verwaltung
		treeSet = _treeSet,
		growth = {},
		scouts = {},
	}

	StartSimpleJob("ControlCooldowns");
	StartSimpleJob("ScoutFoerster_ControlGrowth");
end

function ScoutFoerster_Action()
	local sel = {GUI.GetSelectedEntities()};
	for i = 1,table.getn(sel) do
		local EntityType = Logic.GetEntityType(sel[i])
		if EntityType == Entities.PU_Scout then
			local scout = sel[i];
			if string.find(Logic.GetCurrentTaskList(scout),"_TAVERN") then
				ActionWithCooldown( "ScoutFoerster_FeedbackDelay", 30, Sound.PlayQueuedFeedbackSound, Sounds.AOVoicesScout_Scout_NO_rnd_01 );
			elseif not ScoutFoerster_IsCooldownActive(scout) then
				local paid = PayResources( ScoutFoerster_gvScoutFoerster.ABILITY_COSTS, false, true );
				if paid then
					local successful = ScoutFoerster_PlantTrees(GetPosition(scout));
					if successful then
						Sound.PlayQueuedFeedbackSound(Sounds.AOVoicesScout_Scout_Forester_rnd_01, 127)
						PayResources( ScoutFoerster_gvScoutFoerster.ABILITY_COSTS );
						ScoutFoerster_StartCooldown(scout);
					else
						GUI.AddNote(XGUIEng.GetStringTableText("InGameMessages/Note_NoTreeStumps"))			
					end
				end
			end
		end
	end
end

function ScoutFoerster_Tooltip()
	local costString = CreateCostString(ScoutFoerster_gvScoutFoerster.ABILITY_COSTS)
	GUITooltip_AbilityButton(Technologies.T_ScoutForester,"AOMenuScout/command_forester","KeyBindings/HeroAbility4", costString)
end

function ScoutFoerster_Update()
	local PlayerID = GUI.GetPlayerID()
	local TechState = Logic.GetTechnologyState(PlayerID, Technologies.T_ScoutForester)
	
	local sel = {GUI.GetSelectedEntities()};
	for i = 1,table.getn(sel) do
		local EntityType = Logic.GetEntityType(sel[i])
		if EntityType == Entities.PU_Scout then
			local scout = sel[i];
			if not ScoutFoerster_IsCooldownActive(scout) and TechState == 4 then
				XGUIEng.DisableButton("Scout_Forester",0)
			else
				XGUIEng.DisableButton("Scout_Forester",1)
			end
		end
	end
end

function ControlCooldowns()
	local sel = GUI.GetSelectedEntity();
	for i = table.getn(ScoutFoerster_gvScoutFoerster.scouts),1,-1 do
		local scout = ScoutFoerster_gvScoutFoerster.scouts[i];
		if scout.CD < scout.CD_Max then
			scout.CD = scout.CD+1;
			if sel == scout.id then
				XGUIEng.SetProgressBarValues( "Scout_RechargeForester", scout.CD, scout.CD_Max );
			end
		else
			table.remove(ScoutFoerster_gvScoutFoerster.scouts, i);
			if sel == scout.id then
				XGUIEng.SetProgressBarValues( "Scout_RechargeForester", 0, 1 );
			end
		end
	end
end

function ScoutFoerster_ControlGrowth()
  -- Wettereinfluss
	local weather = Logic.GetWeatherState();
	local progress = ScoutFoerster_gvScoutFoerster.WEATHER_FACTORS[weather];
  -- verwalten
	for i = table.getn(ScoutFoerster_gvScoutFoerster.growth),1,-1 do
		local tree = ScoutFoerster_gvScoutFoerster.growth[i];
		if IsExisting(tree.id) then
			tree.count = tree.count - progress;
			if tree.count <= 0 then
				tree.count = 0;
				ScoutFoerster_TreeGrow(i);
			end
		else
			table.remove(ScoutFoerster_gvScoutFoerster.growth,i);
		end
	end
end

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ### Scout-Forester RELATED FUNCS ###
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function ScoutFoerster_StartCooldown( _eID )
	table.insert( ScoutFoerster_gvScoutFoerster.scouts, {
		id = _eID,
		CD = 0,
		CD_Max = ScoutFoerster_gvScoutFoerster.PLANT_COOLDOWN,
	});
end

function ScoutFoerster_IsCooldownActive( _eID )
	for i = 1,table.getn(ScoutFoerster_gvScoutFoerster.scouts) do
		if ScoutFoerster_gvScoutFoerster.scouts[i].id == _eID then
			return i;
		end
	end
	return false;
end

function ScoutFoerster_PlantTrees( _pos )
    local treestumps = {Logic.GetEntitiesInArea( Entities.XD_TreeStump1, _pos.X, _pos.Y, ScoutFoerster_gvScoutFoerster.PLANT_RANGE, ScoutFoerster_gvScoutFoerster.PLANT_AMOUNT )};
    for i = 2,treestumps[1]+1 do
		local pos = GetPosition(treestumps[i]);
		Logic.CreateEffect( GGL_Effects.FXSalimHeal, pos.X, pos.Y, 0 );
	  -- Init und go!
		local t = {
			id = treestumps[i],
			level = 0,
			count = 0,
		}
		table.insert( ScoutFoerster_gvScoutFoerster.growth, t );
		ScoutFoerster_TreeGrow( table.getn(ScoutFoerster_gvScoutFoerster.growth) );
	end
	return (treestumps[1] > 0);
end

function ScoutFoerster_CheckGrowthStep( _tree, _pos )
	local typesLower = ScoutFoerster_gvScoutFoerster.treeSet[_tree.level];
	local typesUpper = ScoutFoerster_gvScoutFoerster.treeSet[_tree.level+1];
	if (not typesLower) or (not typesUpper) then -- keine Überprüfung bei "Randextrema"
		return true;
	elseif (not typesUpper.nonBlockingDoodad) and typesLower.nonBlockingDoodad then -- Einheiten-Check nur bei Wachstum von Pflanzen zu echten Bäumen
		for i = 1,8 do
			if AreEntitiesInArea( i, 0, _pos, 150, 1 ) then
				return false;
			end
		end
	end
	return true;
end

function ScoutFoerster_TreeGrow( _index )
	local tree = ScoutFoerster_gvScoutFoerster.growth[_index];
	assert(tree);
	if tree.level >= ScoutFoerster_gvScoutFoerster.GROWTH_LEVELS then -- ausgewachsen, -> raus
		table.remove( ScoutFoerster_gvScoutFoerster.growth, _index );
	else
		local pos = GetPosition(tree.id);
		if ScoutFoerster_CheckGrowthStep(tree, pos) then -- Bereich frei, Wachstum möglich!
		  -- Wachsen!
			tree.level = tree.level+1;
		  -- Entity
			local treeEntities = ScoutFoerster_gvScoutFoerster.treeSet[tree.level];
			local randomType = GetRandom(1, table.getn(treeEntities));
			DestroyEntity(tree.id);
			tree.id = CreateEntity( 0, Entities[ treeEntities[randomType] ], pos );
		  -- count
			local randomCount = GetRandom( ScoutFoerster_gvScoutFoerster.GROWTH_TIME_MIN, ScoutFoerster_gvScoutFoerster.GROWTH_TIME_MAX );
			tree.count = randomCount;
		end
	end
end

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ### Scout-FöForester BAUM-SETS ###
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--by Noigi
ScoutFoerster_SET_DarkTree = {
	{ -- Setzling 1
		nonBlockingDoodad = true,
		"XD_GreeneryBush1",
		"XD_GreeneryBush2",
		"XD_GreeneryBush3",
		"XD_GreeneryBush5",
	},
	{ -- Setzling 2
		nonBlockingDoodad = true,
		"XD_GreeneryBushHigh1",
		"XD_GreeneryBushHigh2",
	},
	{ -- Wachstumsstufe 1
		"XD_DarkTree3",
	},
	{ -- Wachstumsstufe 2
		"XD_DarkTree1",
		"XD_DarkTree4",
		"XD_DarkTree6",
		"XD_DarkTree7",
		"XD_DarkTree8",
	},
	{ -- Wachstumsstufe 2
		"XD_DarkTree1",
		"XD_DarkTree2",
		"XD_DarkTree4",
		"XD_DarkTree5",
		"XD_DarkTree6",
		"XD_DarkTree7",
		"XD_DarkTree8",
	},
}

--by Noigi
ScoutFoerster_SET_Pine = {
	{ -- Setzling 1
		nonBlockingDoodad = true,
		"XD_GreeneryBush1",
		"XD_GreeneryBush2",
		"XD_GreeneryBush3",
		"XD_GreeneryBush5",
	},
	{ -- Setzling 2
		nonBlockingDoodad = true,
		"XD_GreeneryBushHigh1",
		"XD_GreeneryBushHigh2",
	},
	{ -- Wachstumsstufe 1
		"XD_Pine3",
	},
	{ -- Wachstumsstufe 2
		"XD_Pine1",
		"XD_Pine4",
		"XD_Pine5",
		"XD_Pine6",
	},
	{ -- Wachstumsstufe 3
		"XD_Pine1",
		"XD_Pine2",
		"XD_Pine4",
		"XD_Pine5",
		"XD_Pine6",
	},
}

--by Noigi
ScoutFoerster_SET_Fir = {
	{ -- Setzling 1
		nonBlockingDoodad = true,
		"XD_GreeneryBushHigh3",
	},
	{ -- Setzling 2
		nonBlockingDoodad = true,
		"XD_GreeneryBushHigh4",
	},
	{ -- Wachstumsstufe 1
		"XD_Fir1_small",
		"XD_Fir2_small",
	},
	{ -- Wachstumsstufe 2
		"XD_Fir1_small",
		"XD_Fir1",
		"XD_Fir1",
		"XD_Fir2",
		"XD_Fir2",
	},
}

--by warrior1024 (edited by Pat97xd)
ScoutFoerster_SET_Moor = {
	{
		"XD_BushMoor1",
		nonBlockingDoodad = true,
	},
	{
		"XD_BushMoor2",
		nonBlockingDoodad = true,
	},
	{
		"XD_TreeMoor1",
		"XD_TreeMoor2",
		"XD_TreeMoor3",
	},
	{
		"XD_TreeMoor4",
		"XD_TreeMoor5",
		"XD_TreeMoor6",
	},
}

--by Pat97xd
ScoutFoerster_SET_Evelance = {
	{
		"XD_DeadBush2",
		"XD_DeadBush5",
		nonBlockingDoodad = true,
	},
	{
		"XD_DeadBush1",
		"XD_DeadBush6",
		nonBlockingDoodad = true,
	},
	{
		"XD_DeadTree01",
		"XD_DeadTree02",
	},
	{
		"XD_TreeEvelance1",
	},
}

function round( _n )
	return math.floor( _n + 0.5 );
end

function ActionWithCooldown( _key, _cooldown, _action, _params )
	assert( type(_key) == "string", "ActionWithCooldown: _key must be a string!" );
	assert( type(_cooldown) == "number", "ActionWithCooldown: _cooldown must be a number!" );
	assert( type(_action) == "function", "ActionWithCooldown: _action must be a function!" );
	if type(_params) ~= "table" then
		_params = {_params};
	end

	if not CooldownActions_List then -- Liste initiieren
		CooldownActions_List = {};
		CooldownSystem_Job = function()
			for k,v in pairs(CooldownActions_List) do
				if v.CD > 0 then
					v.CD = (v.CD - 1);
				end
			end
		end
		StartSimpleHiResJob("CooldownSystem_Job");
	end

	if CooldownActions_List[_key] then -- Kategorie existiert bereits
		if CooldownActions_List[_key].CD == 0 then -- kein Cooldown
			CooldownActions_List[_key].CD = _cooldown;
			return true, _action( unpack(_params) );
		else -- Cooldown aktiv
			return false;
		end
	else -- Kategorie existiert noch nicht
		CooldownActions_List[_key] = {
			CD = _cooldown,
		};
		return true, _action( unpack(_params) );
	end
end