------------------ Quests chapter 2
Buildtimer = function()
turm = 0
TIMER = 60 * 10

GUIQuestTools.ToggleStopWatch(TIMER ,1)
StartSimpleJob("TimedBuild")

end


--------------------------------------------------------------------------------
--*******************[ timer for building things ]********

TimedBuild = function()

if TIMER == 1 then
	CheckStatus ()
	return true

	else TIMER = TIMER - 1
end

end


CheckStatus = function()

if turm == 1 then 
setupBattle()
spDef()
createBriefingMayortowers()

else Defeat()
end
end




ChapterIIFinished = function ()

	if c ==3 then createBriefingChapterIII()
	return true
	end
	
end

QuestBuildTowers = function ()
--[[
	-- Quest
	local Quest = {}
	Quest.AreaPos = "lines"
	Quest.AreaSize = 2500
	
	Quest.EntityTypes = { 	{ Entities.PB_Tower2, 4}}
	
	Quest.Callback = QuestTowers

	SetupEstablish(Quest)
	--]]
	StartSimpleJob("QuestTowersJob")
end

function QuestTowersJob()
	if Counter.Tick2("QuestTowersJob", 5) then
		if CountTowers() >= 4 then
			QuestTowers()
			return true
		end
	end
end

function CountTowers()
	local pos = GetPosition("lines")
	local towerCount1 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower2, pos.X, pos.Y, 2500, 6)}
	local towerCount2 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower2, pos.X, pos.Y, 2500, 6)}
	local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, 2500, 6)}
	local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, 2500, 6)}

	return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
end

QuestTowers = function ()
	turm = 1
	ResolveBriefing(briefingTerminatMayorChapter2)
	local x,y=Tools.GetPosition("lines")
	GUI.DestroyMinimapPulse(x,y)
	createBriefingWaiting()
end

---------------------- Sulfur payment to second city

JobTributeSulf = function()
				local job = {}		
				job.Tribute = 1
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									String.Key("demolition"),
									ResourceType.Sulfur, 
									1000 )			
				job.Callback = TributePaid1
				SetupTributePaid(job)								
				

end




TributePaid1 = function ()

	createBriefingSulfurPaid()
	ResolveBriefing(briefingTerminatMayorSulfur1)

end


------------------------------ Gold Shipment to Templars


JobTributeGold = function()
			local job = {}		
				job.Tribute = 2
				Logic.AddTribute(			1, 
									job.Tribute,
									0,
									0,
									String.Key("mercenary"),
									ResourceType.Gold, 
									1000 )			
				job.Callback = TributePaid2
				SetupTributePaid(job)								
				

end




TributePaid2 = function ()
	
	createBriefingGoldPaid()
	ResolveBriefing(briefingTerminatMayorSulfur2)

end