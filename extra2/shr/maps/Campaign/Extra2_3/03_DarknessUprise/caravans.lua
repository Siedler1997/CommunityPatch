MAX_CARAVANS = 20  --max num of caravans to be spawned
MAX = 0
marketDead = false
firsttime = true
adi = 0
RandomWay = 1

NO_DEAD_CARAVANS = 0

WAIT = 60

-------------------------------------------------------

RandomSpawner = function()

adi = 0

if marketDead == true then
return true
end

if SPAWN_TIME <= 0 then
SpawnCaravans()
SPAWN_TIME = Logic.GetRandom(CARAVAN_SPAWN_TIME) + 2*60
return true
else
SPAWN_TIME = SPAWN_TIME - 1

end

end

SpawnCaravans = function()

createCaravan()
ControlCaravan()

end


--*************************************************************************************
-----------------------------------------Caravan Units and support troops--------------

createCaravan = function()
	troops = { }
	
	if CP_Difficulty == 0 then	
		table.insert(troops, Entities.PU_LeaderSword1)
		table.insert(troops, Entities.PU_LeaderBow1)
		table.insert(troops, Entities.PU_LeaderPoleArm1)
		table.insert(troops, Entities.PU_LeaderCavalry1)
	elseif CP_Difficulty == 1 then	
		table.insert(troops, Entities.PU_LeaderSword2)
		table.insert(troops, Entities.PU_LeaderBow2)
		table.insert(troops, Entities.PU_LeaderPoleArm2)
		table.insert(troops, Entities.PU_LeaderCavalry2)
		table.insert(troops, Entities.PU_LeaderRifle1)
	else
		table.insert(troops, Entities.PU_LeaderSword3)
		table.insert(troops, Entities.PU_LeaderBow3)
		table.insert(troops, Entities.PU_LeaderPoleArm3)
		table.insert(troops, Entities.PU_LeaderCavalry2)
		table.insert(troops, Entities.PU_LeaderRifle1)
	end
	
	
	reward ={}
	points = 8

		
	local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
	RandomSupportNum		=       Logic.GetRandom(table.getn(troops)) + 1

	if IsAlive("q2_m1") and IsAlive("q2_m2") and IsAlive("q2_m3") then

		if firsttime == true then
	--	RandomWay = 1
		firsttime = false
		createGeneralBriefing("traderoute1_1","caravan.spoted")
		else
		RandomWay =  Logic.GetRandom(4) + 1
		end

	else 
		marketDead = true
	end
		




		local pos = GetPosition("traderoute"..RandomWay.."_1")


		for i = 1,RandomSupportNum,1 do
				
		local RaidAttack1 = Tools.CreateGroup(2, RandomUnit, 8, pos.X+i*5, pos.Y+i*5, 180)
		local RandomUnit 	= 	troops[Logic.GetRandom(table.getn(troops))+1]
		SetEntityName(RaidAttack1, "support"..i)

		local caravan = CreateEntity(2,Entities.PU_Travelling_Salesman,pos,"caravan"..i)
		SetEntityName(caravan, "caravan"..i)

		reward[i] = 0          -----------reward received when caravan killed

		end
	

	StartSimpleJob("ControlArmySupport")
	StartSimpleJob("CaravanReward")

end


--**********************************************************************************************************		
-------------------------------Caravan support armies behaviour---------------------------------------------
ControlArmySupport = function()

if Counter.Tick2("MoveArmySupport",6)==true then

MoveArmySupport()

end

end

------------------

MoveArmySupport = function()

for  i=1,RandomSupportNum,1 do
for  j=1,RandomSupportNum,1 do 

if IsAlive("support"..i)  then
 if IsAlive("caravan"..j) then
 Attack("support"..i,"caravan"..j)
 end
end


end
end

end

--************************************************************************************************************
-------------------------------------Setup Caravan------------------------------------------------------------

ControlCaravan = function()

if MAX < MAX_CARAVANS then

caravan = {}
caravan.Unit ="caravan"
caravan.Waypoint 	= {}


	for w=1,points,1 do
	caravan.Waypoint[w] = { Name = "traderoute"..RandomWay.."_"..w, WaitTime = 12 }
	end



caravan.Remove = true
caravan.Callback 	= QuestCaravanDone
caravan.ArrivedCallback = QuestCaravanDone1

SetupCaravan(caravan)

MAX = MAX + 1

else

EndJob("RandomSpawner")

end


end
-----------------------------
QuestCaravanDone = function()


EndJob("ControlArmySupport")
--EndJob("CaravanReward")  



--	for  i=1,RandomSupportNum,1 do    --  destroy support troops for previous caravan
--	if IsAlive("support"..i)  then    --
	StartSimpleJob("waitSupport")
--	DestroyEntity("support"..i) 
--	end
--	end

StartSimpleJob("RandomSpawner")

end
-----------------
waitSupport = function()
if WAIT > 0 then
WAIT = WAIT - 1
else
	for  i=1,RandomSupportNum,1 do    --  destroy support troops for previous caravan
	if IsAlive("support"..i)  then    --
	DestroyEntity("support"..i) 
	end
	end
WAIT = 60
return true
end
end
------------------------------------
QuestCaravanDone1 = function()

adi = 1

end

--**************************************************************************************************************
---------------------------Reward received for killing one of the caravan units---------------------------------
CaravanReward = function()

if adi == 1 then
--adi = 0
return true
end

for k=1,RandomSupportNum,1 do

if IsDead("caravan"..k) and reward[k]==0 then 
NO_DEAD_CARAVANS = NO_DEAD_CARAVANS + 1
GiveReward()
reward[k] = 1
end

end

end
----------------------------
GiveReward = function()

if NO_DEAD_CARAVANS == 5 or NO_DEAD_CARAVANS == 9 or NO_DEAD_CARAVANS == 12 or NO_DEAD_CARAVANS == 15 or NO_DEAD_CARAVANS == 18 or  NO_DEAD_CARAVANS == 20 or NO_DEAD_CARAVANS == 23 then
baseAttack("my_castle")
end

resource = Logic.GetRandom(6) + 1
amount =  Logic.GetRandom(250) + 250
if resource == 1 then
AddGold(amount)
elseif resource == 2 then
AddClay(amount)
elseif resource == 3 then
AddWood(amount)
elseif resource == 4 then
AddStone(amount)
elseif resource == 5 then
AddIron(amount)
elseif resource == 6 then
AddSulfur(amount)
end

end
--****************************************************************************************************************