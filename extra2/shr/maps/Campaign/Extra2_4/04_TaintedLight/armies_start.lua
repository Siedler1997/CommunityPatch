--------------- all armies on the map


spawnStartArmies = function()
---- rebels in camp
	local pos = GetPosition("rebel1")
	rebels = AI.Entity_CreateFormation(3, Entities.PU_LeaderPoleArm2,0,4,pos.X,pos.Y,0,0,3,0)
	SetEntityName(rebels, "rebels1")
	LookAt("rebels1", "capitol")

	local pos = GetPosition("rebel2")
	rebels1 = AI.Entity_CreateFormation(3, Entities.PU_LeaderBow2,0,4,pos.X,pos.Y,0,0,3,0)
	SetEntityName(rebels1, "rebels2")
	LookAt("rebels2", "capitol")

	local pos = GetPosition("rebel_leader")
	rebel = CreateEntity(3,Entities.CU_Princess,pos,"rebel_lead")
	LookAt("rebel_lead", "capitol")

---- barbarian invaders
troops	= 	{		
	Entities.PU_LeaderSword3,
	Entities.PU_LeaderSword3,
	Entities.PU_LeaderBow3,
	Entities.PU_LeaderBow3,
	Entities.PU_LeaderPoleArm3,
	Entities.PU_LeaderRifle1,
	Entities.PU_LeaderCavalry2,
	Entities.PU_LeaderHeavyCavalry1
}	

templartroops	= 	{	
	Entities.PU_LeaderSword4,
	Entities.PU_LeaderSword4,
	Entities.PU_LeaderBow4,
	Entities.PU_LeaderPoleArm4,
	Entities.PU_LeaderRifle2,
	Entities.PU_LeaderRifle2,
	Entities.PU_LeaderHeavyCavalry2,
	Entities.PU_LeaderHeavyCavalry2
}	


local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
local RandomTemplarUnit 	= 	templartroops[Logic.GetRandom(table.getn(templartroops))+1]
local soldiers = 6

if CP_Difficulty > 0 then
	soldiers = soldiers + 2
end

for i = 1,4,1 do
	local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
	local pos = GetPosition("patrol"..i)
	patrol1 = AI.Entity_CreateFormation(2, RandomUnit,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
	SetEntityName(patrol1, "patrols"..i)
	--LookAt("patrols"..i, "capitol")
	--Attack("patrols"..i,"capitol")

	local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
	local pos = GetPosition("patrol2"..i)
	patrol2 = AI.Entity_CreateFormation(2, RandomUnit,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
	SetEntityName(patrol2, "patrols2"..i)
	--LookAt("patrols2"..i, "capitol")
	--Attack("patrols2"..i,"capitol")
end

for i = 1,23,1 do
	local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
	local pos = GetPosition("patrol3"..i)
	patrol3 = AI.Entity_CreateFormation(2, RandomUnit,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
	SetEntityName(patrol3, "patrols3"..i)
	--LookAt("patrols3"..i, "capitol")
	--Attack("patrols3"..i,"capitol")
end

--
for i = 1,4,1 do 
	LookAt("patrols3"..i,"Dario")
	Attack("patrols3"..i,"patrol3"..i)
end
--

for  i = 1,8,1 do
	local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
	local pos = GetPosition("camp"..i)
	patrol3 = AI.Entity_CreateFormation(2, RandomUnit,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
	SetEntityName(patrol3, "campers"..i)
	--LookAt("campers"..i, "capitol")
	--Attack("campers"..i,"capitol")
end
--[[
for i = 1,6,1 do 
	LookAt("campers"..i, "capitol")
	Attack("campers"..i,"capitol")
end
--]]
----------- cannons 
for i = 1,4,1 do
	local pos = GetPosition("cannon"..i)
	if CP_Difficulty > 0 then
		tun = CreateEntity(2,Entities.PV_Cannon4,pos,"cannon"..i)
	else
		tun = CreateEntity(2,Entities.PV_Cannon3,pos,"cannon"..i)
	end
	LookAt("cannon"..i, "Dario")
	Attack("cannon"..i,"cannon"..i)
end

--------- cannon master guards

for i = 1,4,1 do 
	local pos = GetPosition("bribe"..i)
	bribe = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
	SetEntityName(bribe, "bribed"..i)
	--LookAt("bribed"..i, "weather3")
	--Attack("bribed"..i,"weather3")
end




------ templar insurrectors
for  i = 1,9,1 do
	local RandomTemplarUnit 	= 	templartroops[Logic.GetRandom(table.getn(templartroops))+1]
	local pos = GetPosition("templar"..i)
	patrol3 = AI.Entity_CreateFormation(4, RandomTemplarUnit,0,8,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
	SetEntityName(patrol3, "templars"..i)

	local RandomTemplarUnit 	= 	templartroops[Logic.GetRandom(table.getn(templartroops))+1]
	local pos = GetPosition("lastdef"..i)
	patrol3 = AI.Entity_CreateFormation(4, RandomTemplarUnit,0,8,pos.X,pos.Y,0,0,CP_Difficulty+1,0)
	SetEntityName(patrol3, "lastdefense"..i)
end
--[[
for i = 1,3,1 do
	LookAt("lastdefense"..i,"lookpos")
	Attack("lastdefense"..i,"lookpos")
end
for i = 4,7,1 do
	LookAt("lastdefense"..i,"lookpos")
	Attack("lastdefense"..i,"lookpos")
end
--]]
------------------------- outlaws
local pos = GetPosition("bruda")
outlw1 = CreateEntity(3,Entities.PU_Serf,pos,"brudah")
local pos = GetPosition("smuggler")
outlw2 = CreateEntity(3,Entities.PU_LeaderSword1,pos,"outlaw")



end