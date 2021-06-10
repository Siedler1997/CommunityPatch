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
	end

	Quest2towers = function()
	
	t = t+1
		if t==4 then createEndChapter4Briefing()
	else
	return true
	end

	end






createEndChapter4Briefing = function()

CreateNPCMayor5()

end