
CARAVAN_NO_2 = 0
-------------------------------------------------------

RandomSpawner2 = function()

if IsDead("bridge4") then

return true
end

if SPAWN_TIME2 <= 0 then
SpawnCaravans2()
SPAWN_TIME2 = Logic.GetRandom(CARAVAN_SPAWN_TIME2) + 5*60
return true
else
SPAWN_TIME2 = SPAWN_TIME2 - 1

end

end

SpawnCaravans2 = function()

CARAVAN_NO_2 = CARAVAN_NO_2 + 1
createCaravan2()
ControlCaravan2()

end


--*************************************************************************************
-----------------------------------------Caravan Units and support troops--------------

createCaravan2 = function()


	local troops2	= 	{
				Entities.PU_LeaderPoleArm2,
				Entities.PU_LeaderCavalry1
				}
	local troops2_1	= 	{	Entities.PU_BattleSerf,
				Entities.PU_Travelling_Salesman,
				Entities.PU_Serf,
				Entities.PU_Serf,
				Entities.PU_Travelling_Salesman,
				--Entities.PU_Merchant,
				--Entities.PU_Wanderer,
				Entities.PU_Travelling_Salesman,
				}

	if CP_Difficulty == 0 then
		table.insert(troops2, Entities.PU_LeaderBow1)
		table.insert(troops2, Entities.PU_LeaderSword1)
	else
		table.insert(troops2, Entities.PU_LeaderBow2)
		table.insert(troops2, Entities.PU_LeaderRifle1)
		table.insert(troops2, Entities.PU_LeaderSword2)
	end
	
	points = 8

	RandomUnit2 = {}
	RandomUnit2_1={}
	RandomUnit2[1] 		= 	troops2[Logic.GetRandom(table.getn(troops2))+1]
	RandomUnit2_1 [1]		= 	troops2_1[Logic.GetRandom(table.getn(troops2_1))+1]
	RandomSupportNum2		=       Logic.GetRandom(table.getn(troops2)) + 1


		local pos2 = GetPosition("traderoute2_1")

		local k=1
		
		while k<=2 do

		local RaidAttack2 = Tools.CreateGroup(2, RandomUnit2[k], 8, pos2.X+k*5, pos2.Y+k*5, 180)
		RandomUnit2[k+1] 	= 	troops2[Logic.GetRandom(table.getn(troops2))+1]
		SetEntityName(RaidAttack2, "support2_"..CARAVAN_NO_2.."_"..k)
		k=k+1
		end

		local k = 1

		while k <= RandomSupportNum2 do
				
		local caravan = CreateEntity(2,RandomUnit2_1[k],pos2,"caravan2_"..k)
		RandomUnit2_1[k+1] 		= 	troops2_1[Logic.GetRandom(table.getn(troops2_1))+1]
		SetEntityName(caravan, "caravan2_"..k)
		k=k+1
		
		end 
	

	StartSimpleJob("ControlArmySupport2")

end


--**********************************************************************************************************		
-------------------------------Caravan support armies behaviour---------------------------------------------
ControlArmySupport2 = function()

if Counter.Tick2("MoveArmySupport2",8)==true then

MoveArmySupport2()

end

end

------------------

MoveArmySupport2 = function()

for  i=1,2,1 do
for  j=1,RandomSupportNum2,1 do 

if IsAlive("support2_"..CARAVAN_NO_2.."_"..i)  then
 if IsAlive("caravan2_"..j) then
 Attack("support2_"..CARAVAN_NO_2.."_"..i,"caravan2_"..j)
 end
end


end
end

end

--************************************************************************************************************
-------------------------------------Setup Caravan------------------------------------------------------------

ControlCaravan2 = function()

if MAX < MAX_CARAVANS then

local caravan = {}
caravan.Unit ="caravan2_"
caravan.Waypoint 	= {}


	for w=1,points,1 do
	caravan.Waypoint[w] = { Name = "traderoute2_"..w, WaitTime = 12 }
	end



caravan.Remove = true
caravan.Callback 	= QuestCaravanDone2
caravan.ArrivedCallback = QuestCaravanDone2_1

SetupCaravan(caravan)

else

EndJob("RandomSpawner2")

end


end
-----------------------------
QuestCaravanDone2 = function()


EndJob("ControlArmySupport2")

if IsAlive("bridge5") or IsAlive("bridge4") or IsAlive("bridge2") then

	if IsAlive("bridge3") or IsAlive("bridge1") then

	for  i=1,2,1 do   
	if IsAlive("support2_"..CARAVAN_NO_2.."_"..i)  then   
	Attack("support2_"..CARAVAN_NO_2.."_"..i,"my_castle")      
	end
	end

	end

StartSimpleJob("RandomSpawner2")

end

end

------------------------------------
QuestCaravanDone2_1 = function()

MAX = MAX + 1  --how many carravans survive
GUIQuestTools.UpdateQuestInformationString(MAX .. "/" ..MAX_CARAVANS )

end

