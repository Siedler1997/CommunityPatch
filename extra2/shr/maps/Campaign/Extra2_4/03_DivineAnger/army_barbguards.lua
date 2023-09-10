----------------- Armies



spawnBarbArmy = function()

	local i = 0
	local guards = 0
	for i = 2,11,2 do
		guards = GetPosition("guard"..i)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderBow3, 0, 8, guards.X+i*10, guards.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "guards"..i) 
		--LookAt("guards"..i,"p2")
		--Attack("guards"..i,"p2")
	end


	for i = 1,11,2 do
		guards = GetPosition("guard"..i)
		battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, guards.X+i*10, guards.Y+i*10, 0, 0, CP_Difficulty, 0)
		SetEntityName(battle, "guards"..i) 
		--LookAt("guards"..i,"p2")
		--Attack("guards"..i,"p2")
	end

	ReplaceEntity("palGate1", Entities.XD_PalisadeGate2)
	ReplaceEntity("palGate2", Entities.XD_PalisadeGate2)
end



spawnChasers = function()

for i = 1,4,1 do
hunt = GetPosition("spawn"..i)
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, hunt.X+i*10, hunt.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "hunters"..i) 
LookAt(battle,"p2")
Attack("hunters"..i,"step1")
end

hunter = GetPosition("keep1")
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, hunter.X+i*10, hunter.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "possy") 
LookAt(battle,"p2")
Attack("possy","Ragnar")

briefingSpawnChasers()
end





briefingSpawnChasers = function()

BriefingSpawnChasers= {}
BriefingSpawnChasers.finished = BriefingSpawnChasersFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingSpawnChasers[page] 						= 	{}
		BriefingSpawnChasers[page].title					= 	String.Key("BriefingSpawnChasers[1].title") 
		BriefingSpawnChasers[page].text						=	String.Key("BriefingSpawnChasers[1].text")
		BriefingSpawnChasers[page].position					=	GetPosition("possy")
		--BriefingSpawnChasers[page].explore					=	1000


	
	
		
briefingTerminatSpawnChasers = BriefingSpawnChasers[page]

StartBriefing(BriefingSpawnChasers)


end

BriefingSpawnChasersFinished = function()

end


createDefenders = function()


for i = 1,4,1 do
hunt = GetPosition("spawn"..i)
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, hunt.X+i*10, hunt.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "defenders"..i) 
LookAt(battle,"p2")
Attack("defenders"..i,"bam21")
end

for i = 1,4,1 do
hunt = GetPosition("spawn"..i)
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, hunt.X+i*10, hunt.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "defenders1"..i) 
LookAt(battle,"p2")
Attack("defenders1"..i,"step22")
end

varg = CreateEntity(2,Entities.CU_Barbarian_Hero,GetPosition("step1"),"Varg")

StartSimpleJob("IsVargDead")

end


IsVargDead = function()

	if IsDead("Varg") then createBriefingVargDead()
	return true
	end
end

createBriefingVargDead = function()

BriefingVargDead= {}
BriefingVargDead.finished = BriefingVargDeadFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingVargDead[page] 						= 	{}
		BriefingVargDead[page].title					= 	String.Key("BriefingVargDead[1].title") 
		BriefingVargDead[page].text					=	String.Key("BriefingVargDead[1].text")
		BriefingVargDead[page].position					=	GetPosition("Drake")
		BriefingVargDead[page].explore					=	1000


		BriefingVargDead[page].quest					=	{}
		BriefingVargDead[page].quest.id					=	6
		BriefingVargDead[page].quest.type	    			=	MAINQUEST_OPEN
		BriefingVargDead[page].quest.title				=	String.MainKey.."BriefingVargDead.quest.title"
		BriefingVargDead[page].quest.text	    			=	String.MainKey.."BriefingVargDead.quest.text"
	
		
briefingTerminatVargDead = BriefingVargDead[page]

StartBriefing(BriefingVargDead)

end


BriefingVargDeadFinished = function ()

Move("Drake","keep1")
StartSimpleJob("IsDrakeNearKeep")
ResolveBriefing(briefingTerminatStrategyHo)
local x,y=Tools.GetPosition("keep1")
		GUI.CreateMinimapPulse(x,y)

end


IsDrakeNearKeep = function ()
if IsNear("Drake","keep1",200) and IsNear("Dario","keep1",400) then
	DestroyEntity("Drake")
ResolveBriefing(briefingTerminatVargDead)
	createBriefingDrakeEnter()
	local x,y=Tools.GetPosition("keep1")
		GUI.DestroyMinimapPulse(x,y)
	return true
end

end
createBriefingDrakeEnforce = function ()

BriefingDrakeEnforce= {}
BriefingDrakeEnforce.finished = BriefingDrakeEnforceFinished


	local page=0	

	--	page 1
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[1].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[1].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000


	--	page 2
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[2].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[2].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000

	--	page 3
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[3].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[3].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000

	--	page 4
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[4].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[4].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000

	--	page 5
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[5].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[5].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000
	
	--	page 6
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[6].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[6].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000

	--	page 7
	
		page = page +1
	
		BriefingDrakeEnforce[page] 						= 	{}
		BriefingDrakeEnforce[page].title					= 	String.Key("BriefingDrakeEnforce[7].title") 
		BriefingDrakeEnforce[page].text						=	String.Key("BriefingDrakeEnforce[7].text")
		BriefingDrakeEnforce[page].position					=	GetPosition("VargKeep")
		--BriefingDrakeEnforce[page].explore					=	1000
		
briefingTerminatDrakeEnforce = BriefingDrakeEnforce[page]

StartBriefing(BriefingDrakeEnforce)

end


BriefingDrakeEnforceFinished = function ()

Drake = CreateEntity(8,Entities.PU_Hero10,GetPosition("keep1"),"Drake")
createNpcDrakeLast()
end



spawnAttackers = function()

for i = 1,4,1 do
hunt = GetPosition("spawn"..i)
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderBow3, 0, 8, hunt.X+i*10, hunt.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "attackers"..i) 
LookAt(battle,"p2")
Attack("attackers"..i,"p2")
end

for i = 1,4,1 do
hunt = GetPosition("spawn"..i)
battle = AI.Entity_CreateFormation(2, Entities.PU_LeaderSword3, 0, 8, hunt.X+i*10, hunt.Y+i*10, 0, 0, CP_Difficulty, 0)
SetEntityName(battle, "attackers1"..i) 
LookAt(battle,"p2")
Attack("attackers1"..i,"p8")
end
end