-------------------------------------------------
---------------- Divine anger - map 03 of Vision of Light



------------- Chapter I  - development-------------------------
---------------------------------------------------------------
quest1 = 0
quest2= 0 
quest3 = 0


Start1stChapter = function ()
StartSimpleJob("defeating")

spawnBarbArmy()

local o = 0

for o = 1,14,1 do
	SetHealth("burn"..o, 10)
end
--SpawnWolves()
--StartSimpleJob("RespawnWolves")

SpawnCh1NPC()	

end

SpawnWolves = function()
local k = 0
for k = 1,8,1 do
	wolf = CreateEntity(5,Entities.CU_AggressiveWolf,GetPosition("wolf"..k),"wolfie"..k)
	Move("wolfie"..k,"wolf"..k)
end

for k = 1,8,1 do 
	wolf = CreateEntity(5,Entities.CU_AggressiveWolf,GetPosition("wolf"..k),"wolfie1"..k)
	Move("wolfie1"..k,"wolf"..k)
end


end

defeating = function()

if IsDead("p2") then Defeat()
return true
end
end

RespawnWolves = function()

p = 0 
for p = 1,8,1 do
	if IsDead("wolf"..p) and IsDead("wolf1"..p) then
		wolf = CreateEntity(5,Entities.CU_AggressiveWolf,GetPosition("wolf"..p),"wolfie"..p)
		wolf1 = CreateEntity(5,Entities.CU_AggressiveWolf,GetPosition("wolf"..p),"wolfie1"..p)
		Move("wolfie"..p,"wolf"..p)
		Move("wolfie1"..p,"wolf"..p)
	end
end


end


SpawnCh1NPC = function()

spawnDario ()
spawnDrake()
spawnHelias()
Mayor = CreateEntity(3,Entities.CU_Major01Idle,GetPosition("tehmayor"),"Mayor")

Priest = CreateEntity(1,Entities.CU_BishopIdle,GetPosition("CUTSCENE_INTRO_P1"),"Priest")
Thief = CreateEntity(3,Entities.PU_Thief,GetPosition("thiefden"),"Ragnar")
LookAt("Priest","Dario")
LookAt("Dario","Priest")
createBriefingIntro ()

end


Start2ndChapter = function()
createBriefingChapter2Start()
end


Start4thChapter = function()
minor = 10
Logic.SetShareExplorationWithPlayerFlag(1, 3, 0)
createTemplarArmy()
createTemplarArmy1()
createDefenders()
StartSimpleJob("MinorDelay")

end