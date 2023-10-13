

marySafe = false
Q1finished = false
TIMER = 0			
w = 0 				-- used with wolves
ingredient3 = false
ingredient3Taken = false
ingredient3Retrieved = false
ingredient3TakenKerberos = false

firsttime = true

--------------------------------------------->>CONQUER THE VILLAGE<<------------------------

function start1stQuest()

Report("start 1st quest")
	
CreateArmyVillage()
createArmySpawn ()
createBattleserfDef()
createArmyDefend() 


InitNPCs()

StartSimpleJob("DarioStatue")
StartSimpleJob("Archery")
StartSimpleJob("SerfRun")
StartSimpleJob("createFarmDef")
StartSimpleJob("ruinsBriefing")

StartCutscene(Cutscenes[INTROCUTSCENE],createBriefingPrelude)

startQuestDefeat()



end




function end1stQuest()

for i=1,17,1 do
ChangePlayer("p7_"..i,1)
end

ReplaceEntity("gate1", Entities.XD_WallStraightGate)
ReplaceEntity("gate2", Entities.XD_WallStraightGate)
ReplaceEntity("gate3", Entities.XD_WallStraightGate)

--Report("end 1st quest")

Q1finished = true

ResolveBriefing(briefing_p)

start2ndQuest()

end

------------------------------------->>FREE MARY<<--------------------------------------

function start2ndQuest()

--Report("start 2nd quest")

StartJob("FreeMary")

end

function end2ndQuest()

ResolveBriefing(briefing_archery)

start3rdQuest()

end

---------------------------------->>PROTECT MARY<<-------------------------------------

function start3rdQuest()

------------------------------------------------------------------------
--------Mary will now follow kerberos until reaches the monastery ruins-
------------------------------------------------------------------------

ReplaceEntity("bridge1",Entities.PB_DrawBridgeClosed1)
ReplaceEntity("bridge2",Entities.PB_DrawBridgeClosed2)

StartSimpleJob("MaryFollow")
	
--StartJob("ProtectMary")
StartJob("SafeMary")
StartJob("HuntMary1")
StartJob("HuntMary2")
StartJob("HuntMary3")
	
end


function end3rdQuest()

ResolveBriefing(briefing_mary)

start4thQuest()

end

-------------------------------->>KILL WOLF<<--------------------------------------------

function start4thQuest()

DestroyNPC(NPCvarg)

	NPCvarg1			=	{}
	NPCvarg1.name 			=	"varg"
	NPCvarg1.callback		=	createBriefingVarg1
	CreateNPC(NPCvarg1)


CreateEntity(6, Entities.CU_AggressiveWolf_White, GetPosition("wolf_run0"), "wolf")

--CreateEntity(3, Entities.CU_Barbarian_Hero_wolf, GetPosition("wolf_run0"), "wolf")
StartSimpleJob("lup") 
StartJob("WolfHunt")
StartSimpleJob("WolfArea")

end

function end4thQuest()

ResolveBriefing(briefing_ingredient1)

start5thQuest()

end


---------------------------->>FIND NEPHILIM FLOWER<<------------------------------------

function start5thQuest()

StartJob("NephilimFlower")

end

function end5thQuest()

ResolveBriefing(briefing_ingredient2)

start6thQuest()

end

------------------------------------->>TAKE A FEATHER FROM DARIO'S EAGLE<<---------------

function start6thQuest()


	DestroyNPC(NPCthief)	

	NPCthief1				=	{}
	NPCthief1.name 				=	"thief"
	NPCthief1.callback			=	createBriefingThief1
	CreateNPC(NPCthief1)

StartSimpleJob("HardWay")   -- take ingredient 3 by force( the easy way is using the thief,triggered by thiefbriefing)
sparks_effect = CreateEntity(0,Entities.XD_Sparkles,GetPosition("sparkle"),"sparks_effect")

end

function end6thQuest()

ResolveBriefing(briefing_ingredient3)


start7thQuest()

end

--------------------------------->>TAKE A DROP OF WATER FROM THE LAKE OF TEARS<<------------

function start7thQuest()

StartJob("HolyWater")

end

function end7thQuest()

ResolveBriefing(briefing_ingredient4)

end












