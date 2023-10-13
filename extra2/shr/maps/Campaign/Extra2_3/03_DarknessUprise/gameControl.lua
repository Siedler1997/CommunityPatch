CARAVAN_SPAWN_TIME = 60
Q2Dead = false

----------------------------Q1: Destroy 7 mines---------------------
--******************************************************************

start1stQuest = function()


--setup Q1
destroyMines()


--create market west briefing
checkMarket3()

--create intro briefing
StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)  --Cutscenes[MISSIONCOMPLETECUTSCENE]

--init NPC on map
InitNPCs()

--create armies
createArmyPilgrim()

createArmyDefend()
createArmySpawn()



end

end1stQuest = function()

ResolveBriefing(briefing_p)
start2ndQuest()

end

------------------------Q2: Cutoff traderoutes(destroy3 marketplaces)----
--***********************************************************************

checkQ2Dead = function()

if IsDead("q2_m1") and IsDead("q2_m2") and IsDead("q2_m3") then
Q2Dead = true
end

end

start2ndQuest = function()

checkQ2Dead()

if Q2Dead == true then 
start3rdQuest()
else
createBriefingQ2()
destroyMarkets()
end

end

end2ndQuest = function()

ResolveBriefing(briefing_Q2)
start3rdQuest()

end

------------------------Q3: occupy city----------------------------------
--***********************************************************************

start3rdQuest = function()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(3, true)
		ResearchAllMilitaryTechsAddOn(4, true)
		ResearchAllMilitaryTechsAddOn(5, true)
		ResearchAllMilitaryTechsAddOn(6, true)
		ResearchAllMilitaryTechsAddOn(7, true)
	end

	MinimapTavernKeeperPulse()

	createBriefingQ3()
	DestroyNPC(NPCkeeper)
		NPCkeeper1			=	{}
		NPCkeeper1.name 		=	"tavernkeeper"
		NPCkeeper1.callback		=	createBriefingTavernkeeper1
		CreateNPC(NPCkeeper1)

	occupyCity()

end

end3rdQuest = function()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
	ResolveBriefing(briefing_Q3)
	StartCutscene(Cutscenes[MISSIONCOMPLETECUTSCENE],Victory)


end


--------------------------------------------------------------------------
function InitNPCs()

	NPCkeeper			=	{}
	NPCkeeper.name 			=	"tavernkeeper"
	NPCkeeper.callback		=	createBriefingTavernkeeper
	CreateNPC(NPCkeeper)

	NPCbandit			=	{}
	NPCbandit.name 			=	"bandit"
	NPCbandit.callback		=	createBriefingBandit
	CreateNPC(NPCbandit)

end

createBriefingTavernkeeper = function()

createGeneralBriefing("tavernkeeper","tavernkeeper.help")

end

--------------------------------------------
function MinimapTavernKeeperPulse()

	local x, y = Tools.GetPosition("tavernkeeper")
	GUI.CreateMinimapPulse(x, y)

end