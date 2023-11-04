createQuestBuildUpPlateau = function()

t=0
createQuestBarr1()
createQuestArchery()
createQueststables()
createQuest2towers()

end



-----------------------------------------
----BuildUp barracks ------------------



	createQuestBarr1 = function()

		-- Quest
		local Quest = {}
		--Quest.AreaPos = "newclay1"
		--Quest.AreaSize = 2000

		local entitytype = Entities.PB_Barracks1
		if CP_Difficulty > 0 then
			entitytype = Entities.PB_Barracks2
		end

		Quest.EntityTypes = { 	{ entitytype, 2}}
	
		Quest.Callback = QuestBarr1

		SetupEstablish(Quest)
	end

	QuestBarr1 = function()
	
	t = t+1
	if t==4 then createEndChapter4Briefing()
	else
	return true
	end
	
	end


-----------------------------------------
----BuildUp archery ------------------




	createQuestArchery = function()

		-- Quest
		local Quest = {}
		--Quest.AreaPos = "newclay2"
		--Quest.AreaSize = 2000

		local entitytype = Entities.PB_Archery1
		if CP_Difficulty > 0 then
			entitytype = Entities.PB_Archery2
		end

		Quest.EntityTypes = { 	{ entitytype, 2}}
	
		Quest.Callback = QuestArchery

		SetupEstablish(Quest)
	end

	QuestArchery = function()

	t = t+1
		if t==4 then createEndChapter4Briefing()
	else
	return true
	end

	end

-------------------------------------
---- build stables -------


	createQueststables = function()

		-- Quest
		local Quest = {}
		--Quest.AreaPos = "sulphur"
		--Quest.AreaSize = 2000

		local entitytype = Entities.PB_Stable1
		if CP_Difficulty > 0 then
			entitytype = Entities.PB_Stable2
		end

		Quest.EntityTypes = { 	{ entitytype, 1}}
	
		Quest.Callback = Queststables

		SetupEstablish(Quest)
	end

	Queststables = function()
	
	t = t+1
		if t==4 then createEndChapter4Briefing()
	else
	return true
	end
	
	end


--------------------------------------
---- build up 2 towers 


	createQuest2towers = function()
		--[[
		-- Quest
		local Quest = {}
		Quest.AreaPos = "towers"
		Quest.AreaSize = 5000

		local entitytype = Entities.PB_Tower2
		if CP_Difficulty > 0 then
			entitytype = Entities.PB_Tower3
		end

		Quest.EntityTypes = { 	{ entitytype, 2}}
	
		Quest.Callback = Quest2towers

		SetupEstablish(Quest)
		--]]
		StartSimpleJob("Quest2TowersJob")
	end
	
	function Quest2TowersJob()
		if Counter.Tick2("Quest2TowersJob", 5) then
			if Count2Towers() >= 2 then
				Quest2towers()
				return true
			end
		end
	end

	function Count2Towers()
		local pos = GetPosition("towers")
		local towerCount1 = {0}
		local towerCount2 = {0}
		local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, 5000, 4)}
		local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, 5000, 4)}
		
		if CP_Difficulty == 0 then
			towerCount1 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower2, pos.X, pos.Y, 5000, 4)}
			towerCount2 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower2, pos.X, pos.Y, 5000, 4)}
		end

		return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
	end

	Quest2towers = function()
		t = t+1
		if t == 4 then 
			createEndChapter4Briefing()
		else
			return true
		end
	end






createEndChapter4Briefing = function()

CreateNPCMayor5()

end