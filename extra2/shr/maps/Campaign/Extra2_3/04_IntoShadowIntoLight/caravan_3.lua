MAX_CARAVANS = 35
MAX = 0
CARAVAN_NO_3 = 0
-------------------------------------------------------

RandomSpawner3 = function()

if IsDead("bridge2") then

return true
end

if SPAWN_TIME3 <= 0 then
SpawnCaravans3()
SPAWN_TIME3 = Logic.GetRandom(CARAVAN_SPAWN_TIME3) + 5*60
return true
else
SPAWN_TIME3 = SPAWN_TIME3 - 1

end

end

SpawnCaravans3 = function()

CARAVAN_NO_3 = CARAVAN_NO_3 + 1
createCaravan3()
ControlCaravan3()

end


--*************************************************************************************
-----------------------------------------Caravan Units and support troops--------------

createCaravan3 = function()


	local troops3	= 	{
				Entities.PU_LeaderPoleArm2,
				Entities.PU_LeaderRifle1
				}
	local troops3_1	= 	{	Entities.PU_BattleSerf,
				Entities.PU_Travelling_Salesman,
				Entities.PU_Serf,
				Entities.PU_Serf,
				Entities.PU_Travelling_Salesman,
				--Entities.PU_Merchant,
				--Entities.PU_Wanderer,
				Entities.PU_Travelling_Salesman,
				}

	if CP_Difficulty == 0 then
		table.insert(troops3, Entities.PU_LeaderBow1)
		table.insert(troops3, Entities.PU_LeaderSword1)
	else
		table.insert(troops3, Entities.PU_LeaderBow2)
		table.insert(troops3, Entities.PU_LeaderSword2)
		table.insert(troops3, Entities.PU_LeaderCavalry1)
	end
	
	points = 8

	RandomUnit3 = {}
	RandomUnit3_1={}
	RandomUnit3[1] 		= 	troops3[Logic.GetRandom(table.getn(troops3))+1]
	RandomUnit3_1 [1]		= 	troops3_1[Logic.GetRandom(table.getn(troops3_1))+1]
	RandomSupportNum3		=       Logic.GetRandom(table.getn(troops3)) + 1


		local pos3 = GetPosition("traderoute3_1")

		local m=1

		while m <= 2 do

		local RaidAttack1 = Tools.CreateGroup(2, RandomUnit3[m], 8, pos3.X+m*5, pos3.Y+m*5, 180)
		RandomUnit3[m+1] 	= 	troops3[Logic.GetRandom(table.getn(troops3))+1]
		SetEntityName(RaidAttack1, "support3_"..CARAVAN_NO_3.."_"..m)
		m=m+1
		end

		local m=1
		
		while m <= RandomSupportNum3 do
		
		local caravan = CreateEntity(2,RandomUnit3_1[m],pos3,"caravan3_"..m)
		RandomUnit3_1[m+1] 		= 	troops3_1[Logic.GetRandom(table.getn(troops3_1))+1]
		SetEntityName(caravan, "caravan3_"..m)
		m=m+1
		
		end 
	

	StartSimpleJob("ControlArmySupport3")

end


--**********************************************************************************************************		
-------------------------------Caravan support armies behaviour---------------------------------------------
ControlArmySupport3 = function()

if Counter.Tick2("MoveArmySupport3",8)==true then

MoveArmySupport3()

end

end

------------------

MoveArmySupport3 = function()

for  i=1,2,1 do
for  j=1,RandomSupportNum3,1 do 

if IsAlive("support3_"..CARAVAN_NO_3.."_"..i)  then
 if IsAlive("caravan3_"..j) then
 Attack("support3_"..CARAVAN_NO_3.."_"..i,"caravan3_"..j)
 end
end


end
end

end

--************************************************************************************************************
-------------------------------------Setup Caravan------------------------------------------------------------

ControlCaravan3 = function()

if MAX < MAX_CARAVANS then

local caravan = {}
caravan.Unit ="caravan3_"
caravan.Waypoint 	= {}


	for w=1,points,1 do
	caravan.Waypoint[w] = { Name = "traderoute3_"..w, WaitTime = 12 }
	end



caravan.Remove = true
caravan.Callback 	= QuestCaravanDone3
caravan.ArrivedCallback = QuestCaravanDone3_1

SetupCaravan(caravan)

else

EndJob("RandomSpawner3")

end


end
-----------------------------
QuestCaravanDone3 = function()


EndJob("ControlArmySupport3")

if IsAlive("bridge5") or IsAlive("bridge4") or IsAlive("bridge2") then

	if IsAlive("bridge3") or IsAlive("bridge1") then

	for  i=1,2,1 do   
	if IsAlive("support3_"..CARAVAN_NO_3.."_"..i)  then   
	Attack("support3_"..CARAVAN_NO_3.."_"..i,"my_castle")      
	end
	end

	end

StartSimpleJob("RandomSpawner3")

end

end

------------------------------------
QuestCaravanDone3_1 = function()

MAX = MAX + 1  --how many carravans survive
GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_CARAVANS )

end

