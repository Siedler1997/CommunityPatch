
--------------------------------------Q1--------------------
function start1stQuest() 

	CreateArmyKerberos()
	StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)	

	local bridge3 = Logic.GetEntityIDByName("bridge3")
	Logic.SetEntityInvulnerabilityFlag(bridge3,1)
	local bridge1 = Logic.GetEntityIDByName("bridge1")
	Logic.SetEntityInvulnerabilityFlag(bridge1,1)

	InitNPCs()
	bridge_npc =GetID("bridge_npc")  
	Logic.SetEntitySelectableFlag(bridge_npc, 0)
	createArmyDefend()
	createArmySpawn()

	Refugees()
	StartJob("briefingWaterfall")
	StartJob("briefingFishing")
	StartJob("briefingCastle")

	startQuestDefeat()

	--IncludeGlobals("MapEditorTools")
	--StartCountdown(15, createBriefingFight, false)
end

-------------------------------------
function end1stQuest() 
	if CP_Difficulty > 0 then
		for i = 1, 2 do
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 4)
			Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 4)
		end

		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderRifle, 4)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierRifle, 4)
	end

	ResolveBriefing(briefing_p)
	start2ndQuest()
end
-------------------------------------Q2---------------------

function start2ndQuest()

if IsDead("b1") and IsDead("b2") and IsDead("b3") and IsDead("b4") then
Logic.SetTechnologyState(gvMission.PlayerID,Technologies.B_MasterBuilderWorkshop, 2)
--Logic.SetTechnologyState(gvMission.PlayerID,Technologies.GT_Arhitecture, 2)
thief = CreateEntity(1,Entities.PU_Thief,GetPosition("thief_spawn"),"thief")
createGeneralBriefing("thief_spawn","thief.bridges")
start3rdQuest()
else
createBriefingQ2()
end

end

function end2ndQuest()

ResolveBriefing(briefing_Q2)
start3rdQuest()

end

--------------------------------------Q3----------------------

function start3rdQuest()

createBriefingQ3()
conquerCity()

end
function end3rdQuest()

StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)
end



---------------------------------------------------
---------------------------------------------------

Condition_briefingWaterfall = function()

return IsNear("kerberos","b_w",300)

end

Action_briefingWaterfall = function()

createGeneralBriefing("waterfall","kerberos.hate")
return true

end

--------------------------------------------------
Condition_briefingFishing = function()

return IsNear("kerberos","fishing_point",800) or IsNear("varg","fishing_point",800) or IsNear("mary","fishing_point",800)

end

Action_briefingFishing = function()

createGeneralBriefing("fishing_point","kerberos.fishing")
return true

end

--------------------------------------------------
Condition_briefingCastle = function()
return IsDead("D_cas")
end

Action_briefingCastle = function()

createGeneralBriefing("br_castle_D","castle.distroyed")
return true

end



-------------------------------------------
function InitNPCs()

	NPCwolfmaster			=	{}
	NPCwolfmaster.name 			=	"wolfmaster"
	NPCwolfmaster.callback		=	createBriefingWolfmaster
	CreateNPC(NPCwolfmaster)

	NPCbridge			=	{}
	NPCbridge.name 			=	"bridge_npc"
	NPCbridge.callback		=	createBriefingThief_Bridge
	CreateNPC(NPCbridge)

--[[	NPCwolf1			=	{}
	NPCwolf1.name 			=	"wolf1"
	CreateNPC(NPCwolf1)
	DisableNpcMarker("wolf1")

	NPCwolf2			=	{}
	NPCwolf2.name 			=	"wolf2"
	CreateNPC(NPCwolf2)
	DisableNpcMarker("wolf2")

	NPCwolf3			=	{}
	NPCwolf3.name 			=	"wolf3"
	CreateNPC(NPCwolf3)
	DisableNpcMarker("wolf3")

	NPCwolf4			=	{}
	NPCwolf4.name 			=	"wolf4"
	CreateNPC(NPCwolf4)
	DisableNpcMarker("wolf4")

	NPCwolf5			=	{}
	NPCwolf5.name 			=	"wolf5"
	CreateNPC(NPCwolf5)
	DisableNpcMarker("wolf5")

	NPCwolf6			=	{}
	NPCwolf6.name 			=	"wolf6"
	CreateNPC(NPCwolf6)
	DisableNpcMarker("wolf6")   ]]

end

createBriefingThief_Bridge = function()

createGeneralBriefing("bridge_npc","bridge_npc.text","thief")
Logic.SetEntitySelectableFlag(bridge_npc, 1)

end
