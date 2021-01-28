destroyedmilitary = 0
MILITARY = 8

------------------------------Q3 STUFF--------------------------------
--********************************************************************

function occupyCity()

--StartJob("LowerBridge2")
StartJob("cityRevolt1")
StartJob("cityRevolt2")
StartJob("cityRevolt3")
StartJob("cityRevolt4")
StartJob("cityRevolt5")


GUIQuestTools.StartQuestInformation("Ruin", "CM05_04_DarknessUprise/militarybuildings", 1, 1)
GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

militaryBuildings()


end

--------------------------------------

Condition_LowerBridge2 = function()
return IsDead("b2_tower")
end

Action_LowerBridge2 = function()

--ReplaceEntity("bridge2",Entities.PB_DrawBridgeClosed2)
createGeneralBriefing("bridge2","bridge.lowered")

return true
end


-------------------------------------

Condition_cityRevolt1 = function()

return IsDead("p2_1") or IsDead("p2_2") or IsDead("p2_3") or IsDead("p2_4") or IsDead("p2_5") or IsDead("p2_6") or IsDead("p2_7") 

end

Action_cityRevolt1 = function()

cityAttack("ra1")

return true
end

-------------------------------------

Condition_cityRevolt2 = function()

return IsDead("p2_8") or IsDead("p2_9") or IsDead("p2_10") or IsDead("p2_11") or IsDead("p2_12") 

end

Action_cityRevolt2 = function()

cityAttack("ra2")

return true
end

------------------------------------

Condition_cityRevolt3 = function()
return IsDead("b8") 
end

Action_cityRevolt3 = function()
	for d2 = 1,4,1 do
		ChangePlayer("cannon"..d2,2)
	end
	if CP_Difficulty == 1 then
		for d2_2 = 15,18,1 do
			ChangePlayer("cannon"..d2_2,2)
		end
	end
	return true
end

------------------------------------

Condition_cityRevolt4 = function()
return IsDead("b9") 
end

Action_cityRevolt4 = function()
	for d3 = 5,7,1 do
		ChangePlayer("cannon"..d3,2)
	end
	if CP_Difficulty == 1 then
		for d3_2 = 8,14,1 do
			ChangePlayer("cannon"..d3_2,2)
		end
	end
	return true
end

-------------------------------------

Condition_cityRevolt5 = function()

return IsDead("p2_13") or IsDead("p2_14") or IsDead("p2_15") or IsDead("p2_16") or IsDead("p2_17")

end

Action_cityRevolt5 = function()

cityAttack("ra3")

return true
end

---------------------------------------

function militaryBuildings()

	local Quest1 =	{}

	Quest1.Targets = {"b6"}
	Quest1.Position = GetPosition("b6")
	Quest1.Callback = BuildingsDestroyed1
			
	SetupDestroy(Quest1)

	local Quest2 =	{}

	Quest2.Targets = {"b7"}
	Quest2.Position = GetPosition("b7")
	Quest2.Callback = BuildingsDestroyed2
			
	SetupDestroy(Quest2)

	local Quest3 =	{}

	Quest3.Targets = {"b8"}
	Quest3.Position = GetPosition("b8")
	Quest3.Callback = BuildingsDestroyed3
			
	SetupDestroy(Quest3)

	local Quest4 =	{}

	Quest4.Targets = {"b9"}
	Quest4.Position = GetPosition("b9")
	Quest4.Callback = BuildingsDestroyed4
			
	SetupDestroy(Quest4)

	local Quest5 =	{}

	Quest5.Targets = {"b22"}
	Quest5.Position = GetPosition("b22")
	Quest5.Callback = BuildingsDestroyed7
			
	SetupDestroy(Quest5)

	local Quest6 =	{}

	Quest6.Targets = {"b25"}
	Quest6.Position = GetPosition("b25")
	Quest6.Callback = BuildingsDestroyed8
			
	SetupDestroy(Quest6)

	local Quest7 =	{}

	Quest7.Targets = {"b15"}
	Quest7.Position = GetPosition("b15")
	Quest7.Callback = BuildingsDestroyed5
			
	SetupDestroy(Quest7)

	local Quest8 =	{}

	Quest8.Targets = {"b17"}
	Quest8.Position = GetPosition("b17")
	Quest8.Callback = BuildingsDestroyed6
			
	SetupDestroy(Quest8)

	for z = 1,8,1 do
	local x,y = Tools.GetPosition("mark"..z)
	GUI.CreateMinimapMarker(x,y,1)
	end


end

BuildingsDestroyed1 = function()

	if IsDead("b6") then
	local x,y = Tools.GetPosition("mark1")
	GUI.DestroyMinimapPulse(x,y,1)
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end

BuildingsDestroyed2 = function()
	
	if IsDead("b7") then
	local x,y = Tools.GetPosition("mark2")
	GUI.DestroyMinimapPulse(x,y,1)
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end

BuildingsDestroyed3 = function()
	
	if IsDead("b8") then
	local x,y = Tools.GetPosition("mark3")
	GUI.DestroyMinimapPulse(x,y,1)

	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end


BuildingsDestroyed4 = function()
	
	if IsDead("b9") then
	local x,y = Tools.GetPosition("mark4")
	GUI.DestroyMinimapPulse(x,y,1)
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end

BuildingsDestroyed5 = function()

	if IsDead("b15") then
	local x,y = Tools.GetPosition("mark5")
	GUI.DestroyMinimapPulse(x,y,1)
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end

BuildingsDestroyed6 = function()

	if IsDead("b17") then
	local x,y = Tools.GetPosition("mark6")
	GUI.DestroyMinimapPulse(x,y,1)
	
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end
BuildingsDestroyed7 = function()

	if IsDead("b22") then
	local x,y = Tools.GetPosition("mark7")
	GUI.DestroyMinimapPulse(x,y,1)
	
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end

BuildingsDestroyed8 = function()
	
	if IsDead("b25") then
	local x,y = Tools.GetPosition("mark8")
	GUI.DestroyMinimapPulse(x,y,1)
	end

	destroyedmilitary = destroyedmilitary + 1
	GUIQuestTools.UpdateQuestInformationString(destroyedmilitary .. "/" ..MILITARY )

	if destroyedmilitary == MILITARY then
	GUIQuestTools.DisableQuestInformation()
	end3rdQuest()
	end


end
--------------------------------------

--[[function PilgrimDie()   

	local position3 = GetPosition("pilgrim_briefing")
	local Troops4 = {Logic.GetEntitiesInArea(Entities.PU_LeaderBow1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow3,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderBow4,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderCavalry1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderCavalry2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderHeavyCavalry1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderHeavyCavalry2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm3,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderPoleArm4,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderRifle1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderRifle2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword3,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PU_LeaderSword4,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon1,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon3,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.PV_Cannon4,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BlackKnight_LeaderMace2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BanditLeaderSword2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_Barbarian_LeaderClub2,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_Barbarian_Hero,position3.X,position3.Y,1000,1,1),
			Logic.GetEntitiesInArea(Entities.CU_BlackKnight,position3.X,position3.Y,1000,1,1)                    
			}

for g = 1,27,1 do
    if Troops4[g] ~=  0 then

	createGeneralBriefing("pilgrim_end","pilgrim.lost")
	ChangePlayer("pilgrim",2)

    return true
    end

end

end   ]]