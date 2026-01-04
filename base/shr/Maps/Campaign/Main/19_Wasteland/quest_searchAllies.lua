createQuestSearchAllies = function()
	local localvillagesRemain = table.getn(VillagesRemainNames)
	local villageDoneText = " "
	for i = 1, localvillagesRemain do
		villageDoneText = villageDoneText .. VillagesRemainNames[i]
		if i < localvillagesRemain then
			villageDoneText = villageDoneText .. ", "
		end
	end

	-- Add new quest
	Logic.AddQuest(
		1,									
		6,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest006_name_SearchAllies",
		(XGUIEng.GetStringTableText("CM01_19_Wasteland_Txt/mainquest006_desc_SearchAllies") .. villageDoneText),	
		1	
	)
	--	Subquests löschen
	--[[
			Logic.SetSubQuestDoneFlag(	1,	6,	0,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	1,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	2,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	3,	0,	0) 
	--]]
end

UpdateSearchAllies = function(_additionalText)
	Logic.RemoveQuest(1, 6)
	-- Add new quest
	createQuestSearchAllies()
end

SearchAlliesDone = function()


	-- Quest done
	Logic.SetQuestType(
		1, 					
		6,
		MAINQUEST_OPEN +1,
		1
	)


end