Q1 = 0
createBriefingOldman = function()

	BriefingOldman = 	{}

		BriefingOldman.finished = BriefingOldmanFinished

		local page = 0



		page = page +1
	
		BriefingOldman[page] 				= 	{}
		BriefingOldman[page].title			= 	String.Key("oldman")
		BriefingOldman[page].position 			= 	GetPosition("oldman")	
		BriefingOldman[page].text			=	String.Key("oldman.text[1]")
		BriefingOldman[page].dialogCamera 		= 	true

		page = page +1
	

		BriefingOldman[page] 				= 	{}
		BriefingOldman[page].title			= 	String.Key("Pilgrim")
		BriefingOldman[page].position 			= 	GetPosition("pilgrim")	
		BriefingOldman[page].text			=	String.Key("oldman.text[2]")
		BriefingOldman[page].dialogCamera 		= 	true  
		
		BriefingOldman[page].quest			=	{}
		BriefingOldman[page].quest.id			=	4
		BriefingOldman[page].quest.type			=	SUBQUEST_OPEN
		BriefingOldman[page].quest.title		=	String.Key("subquest1.title")
		BriefingOldman[page].quest.text			=	String.Key("subquest1.text")   
		

		briefing_SQ1=BriefingOldman[page]

		StartBriefing(BriefingOldman)

end

BriefingOldmanFinished = function()

WolfCave1()
WolfCave2()
WolfCave3()
WolfCave4()
StartSimpleJob("CoverCave1")
StartSimpleJob("CoverCave2")
StartSimpleJob("CoverCave3")
StartSimpleJob("CoverCave4")
StartSimpleJob("SQ1_Done")

end


--------------
SQ1_Done = function()

if Q1 == 4 then
end2ndQuest()
return true
end

end



--------------------------------------cave1
WolfCave1 = function()

for j = 1,5,1 do
wolf = CreateEntity(7,Entities.CU_AggressiveWolf,GetPosition("spawn1"),"wolf1_"..j)
SetEntityName(wolf, "wolf1_"..j)
Move("wolf1_"..j,"cave1")
end

end

CoverCave1 = function()

if  IsNear("dario","spawn1",1000) then
createBriefingExplosion("rock1","blow1")
Q1 = Q1 + 1
return true 
end

if IsDead("wolf1_1") and IsDead("wolf1_2") and IsDead("wolf1_3") and IsDead("wolf1_4") and IsDead("wolf1_5") then
	if Counter.Tick2("WolfCave1",60) == true then
	WolfCave1()
	end
end

end

-------------------------------------

--------------------------------------cave2
WolfCave2 = function()

for j = 1,6,1 do
wolf = CreateEntity(7,Entities.CU_AggressiveWolf,GetPosition("spawn2"),"wolf2_"..j)
SetEntityName(wolf, "wolf2_"..j)
Move("wolf2_"..j,"cave2")
end

end

CoverCave2 = function()

if  IsNear("dario","spawn2",1000) then
createBriefingExplosion("rock2","blow2")
Q1 = Q1 + 1
return true 
end

if IsDead("wolf2_1") and IsDead("wolf2_2") and IsDead("wolf2_3") and IsDead("wolf2_4") and IsDead("wolf2_5") and IsDead("wolf2_6") then
	if Counter.Tick2("WolfCave2",60) == true then
	WolfCave2()
	end
end

end

-------------------------------------

--------------------------------------cave3
WolfCave3 = function()

for j = 1,5,1 do
wolf = CreateEntity(7,Entities.CU_AggressiveWolf,GetPosition("spawn3"),"wolf3_"..j)
SetEntityName(wolf, "wolf3_"..j)
Move("wolf3_"..j,"cave3")
end

end

CoverCave3 = function()

if  IsNear("dario","spawn3",1000) then
createBriefingExplosion("rock3","blow3")
Q1 = Q1 + 1
return true 
end

if IsDead("wolf3_1") and IsDead("wolf3_2") and IsDead("wolf3_3") and IsDead("wolf3_4") and IsDead("wolf3_5") then
	if Counter.Tick2("WolfCave3",60) == true then
	WolfCave3()
	end
end

end

-------------------------------------

--------------------------------------cave4
WolfCave4 = function()

for j = 1,6,1 do
wolf = CreateEntity(7,Entities.CU_AggressiveWolf,GetPosition("spawn4"),"wolf4_"..j)
SetEntityName(wolf, "wolf4_"..j)
Move("wolf4_"..j,"cave4")
end

end

CoverCave4 = function()

if IsNear("dario","spawn4",1000) then
createBriefingExplosion("rock4","blow4")
Q1= Q1 + 1
return true 
end

if IsDead("wolf4_1") and IsDead("wolf4_2") and IsDead("wolf4_3") and IsDead("wolf4_4") and IsDead("wolf4_5") and IsDead("wolf4_6") then
	if Counter.Tick2("WolfCave4",60) == true then
	WolfCave4()
	end
end

end

-------------------------------------