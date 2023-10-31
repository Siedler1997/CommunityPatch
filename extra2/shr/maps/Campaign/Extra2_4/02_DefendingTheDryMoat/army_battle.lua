------------------------- Battlegrounds
AAtacking = 0



------------------------------------- Armyspawns

setupBattle = function()
StartSimpleJob("AreSiegersDeadBeforeLastLine")
	local p = 0 
	local pos = 0
	local i = 0 
	local u= 0
		for i = 1,2,1 do
		
		p = GetRandom(1,6)
	
		pos = GetPosition("spawn"..p)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, pos.X+i*10, pos.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "battle"..i) 
		Attack("battle"..i,"secret")
		end
	
		for i = 3,5,1 do
		
		p = GetRandom(1,6)
	
		pos = GetPosition("spawn"..p)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, pos.X+i*10, pos.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "battle"..i) 
		Attack("battle"..i,"secret")

		end

		for i = 6,8,1 do
		p = GetRandom(1,6)
		
		pos = GetPosition("spawn"..p)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderPoleArm3, 0, 8, pos.X+i*10, pos.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "battle"..i) 
		Attack("battle"..i,"secret")
		
		end

		for i = 9,11,1 do
		p = GetRandom(1,6)
		
		pos = GetPosition("spawn"..p)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderHeavyCavalry1, 0, 3, pos.X+i*10, pos.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "battle"..i) 
		Attack("battle"..i,"secret")
	
		end

		for i = 12,19,1 do
		p = GetRandom(1,6)
	
		pos = GetPosition("spawn"..p)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderBow3, 0, 8, pos.X+i*10, pos.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "battle"..i) 
		Attack("battle"..i,"secret")
	
		end


if AAtacking == 0 then 	

StartJob("TimerAttack1")
else return true
end
end

QUESTTimerAttack_DELAY1 			=       5
QUESTTimerAttack_COUNTER1 		=	QUESTTimerAttack_DELAY1  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTTimerAttack_COUNTER1 > 0 then

                   QUESTTimerAttack_COUNTER1 = QUESTTimerAttack_COUNTER1 - 1

                   return false

                	elseif QUESTTimerAttack_COUNTER1==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

		SecondForceAttack1()

		QUESTTimerAttack_DELAY1 			=       5
		QUESTTimerAttack_COUNTER1 		=	QUESTTimerAttack_DELAY1

		StartJob("TimerAttack1")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------

function SecondForceAttack1()

for i = 1,19,1 do 

		if IsAlive("battle"..i) then
		Attack("battle"..i,"secret")
		end

end

end

AreSiegersDeadBeforeLastLine = function()


	if IsDead("battle1") and
	IsDead("battle1") and
	IsDead("battle2") and
	IsDead("battle3") and
	IsDead("battle4") and
	IsDead("battle5") and
	IsDead("battle6") and
	IsDead("battle7") and
	IsDead("battle8") and
	IsDead("battle9") and
	IsDead("battle10") and
	IsDead("battle11") and
	IsDead("battle12") and
	IsDead("battle13") and
	IsDead("battle14") and
	IsDead("battle15") and
	IsDead("battle16") and
	IsDead("battle17") and
	IsDead("battle18") and
	IsDead("battle19") and
	IsAlive("lastline")
	then 
AAtacking = 1
setupBattle()
return true
end


end
--[[purgeBarbs = function()


if  m == 30 then return true
	elseif IsAlive("battle"..m) then DestroyEntity("battle"..m)
	m=m+1
	
end
end]]
spDef = function()

local l = 0
local c= 0
	for l = 1,8,1 do
	p = 1+GetRandom(6)
	pos = GetPosition("spawn"..p)
	battle = Tools.CreateGroup(8, Entities.PU_LeaderSword4, 6,pos.X+l*10, pos.Y+l*10 , 90)
	SetEntityName(battle, "defense"..l) 
	Attack("defense"..l,"spawn"..p)
	
	end
end

spawnSiegers = function()
StartSimpleJob("leaderDead")
	local leaderPos = GetPosition("leaderpos")
	leader = AI.Entity_CreateFormation(6,Entities.CU_VeteranCaptain,0,0,leaderPos.X,leaderPos.Y,0,0,3,0)
	SetEntityName(leader, "leader") 
LookAt("leader","keep")

camps = {	Entities.CB_Camp14,
		Entities.CB_Camp13,
		Entities.CB_Camp14,
		Entities.PB_LeaderSword2,
		Entities.PB_LeaderSword2,
		Entities.PB_LeaderBow2
	}

campos = {	"e",
		"ne",
		"n",
		"nw",
		"w",
		"sw"
	}

local t = 0
local c = 1
-------------------------- sieger camps
	for t = 1,6,1 do
		
		
		campbuild = CreateEntity(2,camps[c],GetPosition(campos[t]..c),campos[t]..c)
		
	end
		
c =c +1

	for t = 1,6,1 do
		
		
		campbuild = CreateEntity(2,camps[c],GetPosition(campos[t]..c),campos[t]..c)
		
	end


c = c+1

	for t = 1,6,1 do
		
		
		campbuild = CreateEntity(2,camps[c],GetPosition(campos[t]..c),campos[t]..c)
		
	end

-------------------------------- sieger troops
c = c + 1

	for t = 1,6,1 do
		local pos = GetPosition(campos[t]..c)
		local siegerType = Entities.PU_LeaderSword2
		if CP_Difficulty == 2 then
			siegerType = Entities.PU_LeaderSword3
		end

		sieger = AI.Entity_CreateFormation(2, siegerType, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(sieger, campos[t]..c) 
		--LookAt(campos[t]..c,"keep")
		--Attack(campos[t]..c,"keep")
	end

c = c + 1

	for t = 1,6,1 do
		local pos = GetPosition(campos[t]..c)
		local siegerType = Entities.PU_LeaderSword2
		if CP_Difficulty == 2 then
			siegerType = Entities.PU_LeaderSword3
		end
		
		sieger = AI.Entity_CreateFormation(2, siegerType, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(sieger, campos[t]..c) 
		--LookAt(campos[t]..c,"keep")
		--Attack(campos[t]..c,"keep")
	end

c = c + 1

	for t = 1,6,1 do
		local pos = GetPosition(campos[t]..c)
		local siegerType = Entities.PU_LeaderBow2
		if CP_Difficulty == 2 then
			siegerType = Entities.PU_LeaderBow3
		end
		
		sieger = AI.Entity_CreateFormation(2, siegerType, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(sieger, campos[t]..c) 
		--LookAt(campos[t]..c,"keep")
		--Attack(campos[t]..c,"keep")
	end

c = c + 1

	for t = 1,6,1 do
		local pos = GetPosition(campos[t]..c)
		local siegerType = Entities.PU_LeaderCavalry1
		if CP_Difficulty == 2 then
			siegerType = Entities.PU_LeaderCavalry2
		end
		
		sieger = AI.Entity_CreateFormation(2, siegerType, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(sieger, campos[t]..c) 
		--LookAt(campos[t]..c,"keep")
		--Attack(campos[t]..c,"keep")
	end


c = c + 1

	for t = 1,6,1 do
		
		local pos = GetPosition(campos[t]..c)
		sieger = AI.Entity_CreateFormation(2, Entities.PU_LeaderHeavyCavalry1, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(sieger, campos[t]..c) 
		--LookAt(campos[t]..c,"keep")
		--Attack(campos[t]..c,"keep")
	end


c = c + 1

	for t = 1,6,1 do
		
		campbuild = CreateEntity(2,Entities.XD_LargeCampFire,GetPosition(campos[t]..c),campos[t]..c)
		
	end



end


leaderDead = function()

if IsDead("leader") and capture == 0 then Defeat()
return true
end
end


spawnTemplarArmy = function ()
--StartSimpleJob("relentless")
local f = 0 

for f = 1,30,1 do
	local p = GetRandom(1,5)
	local pos = GetPosition("templarsarrive"..p)
		templarone = Tools.CreateGroup(4, Entities.PU_LeaderHeavyCavalry2 , 6, pos.X+f*10, pos.Y+f*10, 90)
		SetEntityName(templarone, "templarcav"..f) 
	Attack("templarcav"..f,"e6")
end
StartJob("TimerAttack")
end



QUESTTimerAttack_DELAY 			=       5
QUESTTimerAttack_COUNTER 		=	QUESTTimerAttack_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerAttack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerAttack = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTTimerAttack_COUNTER > 0 then

                   QUESTTimerAttack_COUNTER = QUESTTimerAttack_COUNTER - 1

                   return false

                	elseif QUESTTimerAttack_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerAttack = function()
	-------------------------------------------------------------------------------------------------------------------

		SecondForceAttack()

		QUESTTimerAttack_DELAY 			=       5
		QUESTTimerAttack_COUNTER 		=	QUESTTimerAttack_DELAY

		StartJob("TimerAttack")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------

function SecondForceAttack()

for i = 1,30,1 do 

		if IsAlive("templarcav"..i) then
		Attack("templarcav"..i,"leaderpos")
		end

end

end