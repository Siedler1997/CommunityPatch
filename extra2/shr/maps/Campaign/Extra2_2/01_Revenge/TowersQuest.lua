
createQuestTowers = function()
--[[
	local quest = {}
	
	quest.AreaPos 		= 	"BuildTowers"
	quest.AreaSize 		= 	4000	
	quest.EntityTypes 	=	{ {Entities.PB_Tower2,2} }
	quest.Callback 		= 	TowersEstablished

	SetupEstablish(quest)
--]]
	StartSimpleJob("QuestTowersJob")
end

TowersEstablished = function()

	endQuest2()
	
	return true

	end
	
function QuestTowersJob()
	if Counter.Tick2("QuestTowersJob", 5) then
		if CountTowers() >= 2 then
			endQuest2()
			return true
		end
	end
end

function CountTowers()
	local pos = GetPosition("BuildTowers")
	local towerCount1 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower2, pos.X, pos.Y, 4000, 4)}
	local towerCount2 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower2, pos.X, pos.Y, 4000, 4)}
	local towerCount3 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_Tower3, pos.X, pos.Y, 4000, 4)}
	local towerCount4 = {Logic.GetPlayerEntitiesInArea(1, Entities.PB_DarkTower3, pos.X, pos.Y, 4000, 4)}

	return (towerCount1[1] + towerCount2[1] + towerCount3[1] + towerCount4[1])
end