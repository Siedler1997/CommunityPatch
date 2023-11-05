---------------------- Quests Chapter III



---------------- Q1: Build 2 cannon towers
createQuestBuild2cannon = function()
	--local pos = GetPosition("towers2")
	if CountTowers2(GetPosition("towers2"), 2000) >= 2 then 
		QuestTowers2()
	else 
--[[
		-- Quest
		local Quest = {}
		Quest.AreaPos = "towers2"
		Quest.AreaSize = 2000
	
		Quest.EntityTypes = { 	{ Entities.PB_Tower3, 2}}
	
		Quest.Callback = QuestTowers2

		SetupEstablish(Quest)
--]]
		StartSimpleJob("QuestBuildCannonJob")
	end
end

function QuestBuildCannonJob()
	if Counter.Tick2("QuestBuildCannonJob", 5) then
		if CountTowers2(GetPosition("towers2"), 2000) >= 2 then
			QuestTowers2()
			return true
		end
	end
end

QuestTowers2 = function()
	spawnDrake()
	createBriefingSpawnDrake()
	ResolveBriefing(briefingTerminatTemplarChapter3)
	local x,y=Tools.GetPosition("towers2")
			GUI.DestroyMinimapPulse(x,y)
			GUI.DestroyMinimapPulse(x,y)
end






----------------- Q2 : Build 8 cannon towers near the walls
--------------------------------
---- Quest : Build towers

QuestBuildUpDefense = function ()
	y = 0
	createQuestDefense1()
	createQuestDefense2()
	if y==2 then CreateNpcTemplar2()
		local x,y = GetPosition("Templaru")
		GUI.CreateMinimapPulse(x,y)
	
		ResolveBriefing(briefingTerminatMayorChapter3)
	else
		return true
	end
end

---------------------- tower 1
createQuestDefense1 = function()
	--local pos = GetPosition("cannon1")
	if CountTowers2(GetPosition("cannon1"), 3800) >= 4 then 
		y=y+1
		return true
	end
	--[[
	-- Quest
	local Quest = {}
	Quest.AreaPos = "cannon1"
	Quest.AreaSize = 3800
	
	Quest.EntityTypes = { 	{ Entities.PB_Tower3, 4}}
	
	Quest.Callback = QuestDefense1

	SetupEstablish(Quest)
	--]]
	StartSimpleJob("QuestDefense1Job")
end

function QuestDefense1Job()
	if Counter.Tick2("QuestDefense1Job", 5) then
		if CountTowers2(GetPosition("cannon1"), 3800) >= 4 then
			QuestDefense1()
			return true
		end
	end
end

QuestDefense1 = function ()
	y=y+1
	if y==2 then 
		CreateNpcTemplar2()
		local x,y=Tools.GetPosition("Templaru")
		GUI.CreateMinimapPulse(x,y)
		ResolveBriefing(briefingTerminatMayorChapter3)
	else
		return true
	end
end

---------------------- tower 2
createQuestDefense2 = function()
	local pos = GetPosition("cannon2")
	if CountTowers2(GetPosition("cannon2"), 3800) >= 4 then 
		y=y+1
		return true
	end
	--[[
	-- Quest
	local Quest = {}
	Quest.AreaPos = "cannon2"
	Quest.AreaSize = 3800
	
	Quest.EntityTypes = { 	{ Entities.PB_Tower3, 4}}
	
	Quest.Callback = QuestDefense2

	SetupEstablish(Quest)
	--]]
	StartSimpleJob("QuestDefense2Job")
end

function QuestDefense2Job()
	if Counter.Tick2("QuestDefense2Job", 5) then
		if CountTowers2(GetPosition("cannon2"), 3800) >= 4 then
			QuestDefense2()
			return true
		end
	end
end

QuestDefense2 = function ()
	y=y+1

	if y==2 then 
		CreateNpcTemplar2()
		local x,y=Tools.GetPosition("Templaru")
		GUI.CreateMinimapPulse(x,y)
		ResolveBriefing(briefingTerminatMayorChapter3)
	else
		return true
	end
end

function CountTowers2(_pos, _range)
	local pos = _pos
	local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, _range, 10)}
	local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, _range, 10)}

	return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
end