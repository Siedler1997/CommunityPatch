CARAVAN_NO_1 = 0
-------------------------------------------------------

RandomSpawner1 = function()

if IsDead("bridge5") then
return true
end

if SPAWN_TIME1 <= 0 then
SpawnCaravans1()
SPAWN_TIME1 = Logic.GetRandom(CARAVAN_SPAWN_TIME1) + 4*60
return true
else
SPAWN_TIME1 = SPAWN_TIME1 - 1

end

end

SpawnCaravans1 = function()

CARAVAN_NO_1 = CARAVAN_NO_1 + 1
createCaravan1()
ControlCaravan1()

end


--*************************************************************************************
-----------------------------------------Caravan Units and support troops--------------

createCaravan1 = function()


	local troops1	= 	{
				Entities.PU_LeaderPoleArm2,
				Entities.PU_LeaderRifle1,
				Entities.PU_LeaderCavalry1,
				}
	local troops1_1	= 	{	Entities.PU_BattleSerf,
				Entities.PU_Travelling_Salesman,
				Entities.PU_Serf,
				Entities.PU_Serf,
				Entities.PU_Travelling_Salesman,
				--Entities.PU_Merchant,
				--Entities.PU_Wanderer,
				Entities.PU_Travelling_Salesman,
				}

	if CP_Difficulty == 0 then
		table.insert(troops1, Entities.PU_LeaderBow1)
	else
		table.insert(troops1, Entities.PU_LeaderBow2)
		table.insert(troops1, Entities.PU_LeaderSword2)
	end
	
	points = 8

	RandomUnit1 = {}
	RandomUnit1_1={}
	RandomUnit1[1] 		= 	troops1[Logic.GetRandom(table.getn(troops1))+1]
	RandomUnit1_1 [1]		= 	troops1_1[Logic.GetRandom(table.getn(troops1_1))+1]
	RandomSupportNum1		=       Logic.GetRandom(table.getn(troops1)) + 1


		local pos1 = GetPosition("traderoute1_1")

		local i=1
		
		while i <= 2 do
		local RaidAttack1 = Tools.CreateGroup(2, RandomUnit1[i], 8, pos1.X+i*5, pos1.Y+i*5, 180)
		RandomUnit1[i+1] 	= 	troops1[Logic.GetRandom(table.getn(troops1))+1]
		SetEntityName(RaidAttack1, "support1_"..CARAVAN_NO_1.."_"..i)
		i=i+1
		end

		local i=1

		while i <= RandomSupportNum1 do
		
		local caravan = CreateEntity(2,RandomUnit1_1[i],pos1,"caravan1_"..i)
		RandomUnit1_1[i+1] 		= 	troops1_1[Logic.GetRandom(table.getn(troops1_1))+1]
		SetEntityName(caravan, "caravan1_"..i)
		i=i+1
		
		end 
	

	StartSimpleJob("ControlArmySupport1")

end


--**********************************************************************************************************		
-------------------------------Caravan support armies behaviour---------------------------------------------
ControlArmySupport1 = function()

if Counter.Tick2("MoveArmySupport1",8)==true then

MoveArmySupport1()

end

end

------------------

MoveArmySupport1 = function()

for  i=1,2,1 do
for  j=1,RandomSupportNum1,1 do 

if IsAlive("support1_"..CARAVAN_NO_1.."_"..i)  then
 if IsAlive("caravan1_"..j) then
 Attack("support1_"..CARAVAN_NO_1.."_"..i,"caravan1_"..j)
 end
end


end
end

end

--************************************************************************************************************
-------------------------------------Setup Caravan------------------------------------------------------------

ControlCaravan1 = function()

if MAX < MAX_CARAVANS then

local caravan = {}
caravan.Unit ="caravan1_"
caravan.Waypoint 	= {}


	for w=1,points,1 do
	caravan.Waypoint[w] = { Name = "traderoute1_"..w, WaitTime = 12 }
	end



caravan.Remove = true
caravan.Callback 	= QuestCaravanDone1
caravan.ArrivedCallback = QuestCaravanDone1_1

SetupCaravan(caravan)

else

EndJob("RandomSpawner1")

end


end
-----------------------------
QuestCaravanDone1 = function()


EndJob("ControlArmySupport1")

if IsAlive("bridge5") or IsAlive("bridge4") or IsAlive("bridge2") then

	if IsAlive("bridge3") or IsAlive("bridge1") then

	for  i=1,2,1 do   
	if IsAlive("support1_"..CARAVAN_NO_1.."_"..i)  then   
	Attack("support1_"..CARAVAN_NO_1.."_"..i,"my_castle")      
	end
	end

	end

StartSimpleJob("RandomSpawner1")

end

end

------------------------------------
QuestCaravanDone1_1 = function()

MAX = MAX + 1  --how many carravans survive
GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_CARAVANS )

end

