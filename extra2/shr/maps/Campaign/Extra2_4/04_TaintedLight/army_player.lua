spawnScouts = function()
	local pos = 0

	pos = GetPosition("scout1")
	battle = Tools.CreateGroup(3, Entities.PU_Scout, 1, pos.X,pos.Y, 270)
	SetEntityName(battle, "scouts1") 
	LookAt("Dario","scouts1")
	LookAt("scouts1","Dario")
end





spawnTown2Defenders = function()
	troops	= 	{		
		Entities.PU_LeaderSword2,
		Entities.PU_LeaderSword2,
		Entities.PU_LeaderBow2,
		Entities.PU_LeaderBow2,
		Entities.PU_LeaderPoleArm2,
		Entities.PU_LeaderPoleArm2,
		Entities.PU_LeaderRifle1,
		Entities.PU_LeaderCavalry1
	}	

	for i = 1,4,1 do
		local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
		local pos = GetPosition("patrol"..i)
		patrol1 = AI.Entity_CreateFormation(3, RandomUnit,0,4,pos.X,pos.Y,0,0,CP_Difficulty,0)
		SetEntityName(patrol1, "defenders"..i)
	end
end


spawnTown3Defenders = function()
	troops	= 	{		
		Entities.PU_LeaderSword2,
		Entities.PU_LeaderSword2,
		Entities.PU_LeaderBow2,
		Entities.PU_LeaderBow2,
		Entities.PU_LeaderPoleArm2,
		Entities.PU_LeaderPoleArm2,
		Entities.PU_LeaderRifle1,
		Entities.PU_LeaderCavalry1
	}	

	for i = 1,4,1 do
		local RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]
		local pos = GetPosition("patrol2"..i)
		patrol1 = AI.Entity_CreateFormation(3, RandomUnit,0,4,pos.X,pos.Y,0,0,CP_Difficulty,0)
		SetEntityName(patrol1, "defenders1"..i)
	end
end




armyTemplarAllied = function ()
	local pos = GetPosition("lidah")
	lidah = CreateEntity(4,Entities.PU_LeaderHeavyCavalry2,pos,"tlidah")

	armyTemplar1 = {}
	local troops = {
		Entities.PU_LeaderSword4,
		Entities.PU_LeaderSword4,
		Entities.PU_LeaderSword4,
		Entities.PU_LeaderBow4,
		Entities.PU_LeaderPoleArm4,
		Entities.PU_LeaderRifle2
    	}    

	if CP_Difficulty == 0 then
        createArmy(4,1,armyTemplar1,6,"lidah",HIGH_EXPERIENCE,troops)
    else
        createArmy(4,1,armyTemplar1,6,"lidah",VERYHIGH_EXPERIENCE,troops)
    end
	armyTemplar1.control.job = 1

    StartSimpleJob("controlArmyTemplar1")
end

function controlArmyTemplar1()
    if armyTemplar1.control.job == 1 then
        Defend(armyTemplar1)
    elseif armyTemplar1.control.job == 2 then
        if IsDead("Dario") == false then
            Redeploy(armyTemplar1,GetPosition("Dario"))
        end
    elseif armyTemplar1.control.job == 3 then
        FrontalAttack(armyTemplar1)
    end
end