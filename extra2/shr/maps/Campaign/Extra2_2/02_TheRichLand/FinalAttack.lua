function CreateFinalAttacks()
	local experience = CP_Difficulty + 1	
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(7, true)
	end

	local pos = GetPosition("Attack1Spawn1")
	Attack1Pos1 = AI.Entity_CreateFormation(2, Entities.CU_VeteranCaptain, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty + 1	, 0)
	SetEntityName(Attack1Pos1, "Attack1Army1")

	local pos = GetPosition("Attack1Spawn2")
	Attack1Pos2 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack1Pos2, "Attack1Army2")

	local pos = GetPosition("Attack1Spawn3")
	Attack1Pos3 = AI.Entity_CreateFormation(2, Entities.CU_Barbarian_LeaderClub2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack1Pos3, "Attack1Army3")

	local pos = GetPosition("Attack1Spawn4")
	Attack1Pos4 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack1Pos4, "Attack1Army4")



	local pos = GetPosition("Attack2Spawn1")
	Attack2Pos1 = AI.Entity_CreateFormation(2, Entities.CU_VeteranCaptain, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty + 1	, 0)
	SetEntityName(Attack2Pos1, "Attack2Army1")

	local pos = GetPosition("Attack2Spawn2")
	Attack2Pos2 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack2Pos2, "Attack2Army2")

	local pos = GetPosition("Attack2Spawn3")
	Attack2Pos3 = AI.Entity_CreateFormation(2, Entities.CU_Barbarian_LeaderClub2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack2Pos3, "Attack2Army3")

	local pos = GetPosition("Attack2Spawn4")
	Attack2Pos4 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack2Pos4, "Attack2Army4")



	local pos = GetPosition("Attack3Spawn1")
	Attack3Pos1 = AI.Entity_CreateFormation(2, Entities.CU_VeteranCaptain, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty + 1	, 0)
	SetEntityName(Attack3Pos1, "Attack3Army1")

	local pos = GetPosition("Attack3Spawn2")
	Attack3Pos2 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack3Pos2, "Attack3Army2")

	local pos = GetPosition("Attack3Spawn3")
	Attack3Pos3 = AI.Entity_CreateFormation(2, Entities.CU_Barbarian_LeaderClub2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack3Pos3, "Attack3Army3")

	local pos = GetPosition("Attack3Spawn4")
	Attack3Pos4 = AI.Entity_CreateFormation(2, Entities.CU_BanditLeaderSword2, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
	SetEntityName(Attack3Pos4, "Attack3Army4")

	StartJob("TimerEnsurance")

end

-------------------------------------------------------------------------------------------

QUESTEnsurance_DELAY 		=       5
QUESTEnsurance_COUNTER 		=	QUESTEnsurance_DELAY  

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerEnsurance"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerEnsurance = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if QUESTEnsurance_COUNTER > 0 then

                   QUESTEnsurance_COUNTER = QUESTEnsurance_COUNTER - 1

                   return false

                	elseif QUESTEnsurance_COUNTER==0 then 

			return true

			end

		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerEnsurance = function()
	-------------------------------------------------------------------------------------------------------------------

		Ensurance()

		QUESTEnsurance_DELAY 		=       5
		QUESTEnsurance_COUNTER 		=	QUESTEnsurance_DELAY

		StartJob("TimerEnsurance")

		return true

	end

-----------------------------------------------------------------------------------------------------------------------	

function Ensurance()

	if IsAlive("Attack1Army1") then
	Attack("Attack1Army1","AditionalTarget")
	end

	if IsAlive("Attack1Army2") then
	Attack("Attack1Army2","AditionalTarget")
	end

	if IsAlive("Attack1Army3") then
	Attack("Attack1Army3","AditionalTarget")
	end

	if IsAlive("Attack1Army4") then
	Attack("Attack1Army4","AditionalTarget")
	end


	if IsAlive("Attack2Army1") then
	Attack("Attack2Army1","AttackTarget3")
	end

	if IsAlive("Attack2Army2") then
	Attack("Attack2Army2","AttackTarget3")
	end

	if IsAlive("Attack2Army3") then
	Attack("Attack2Army3","AttackTarget3")
	end

	if IsAlive("Attack2Army4") then
	Attack("Attack2Army4","AttackTarget3")
	end


	if IsAlive("Attack3Army1") then
	Attack("Attack3Army1","AttackTarget2")
	end

	if IsAlive("Attack3Army2") then
	Attack("Attack3Army2","AttackTarget2")
	end

	if IsAlive("Attack3Army3") then
	Attack("Attack3Army3","AttackTarget2")
	end

	if IsAlive("Attack3Army4") then
	Attack("Attack3Army4","AttackTarget2")
	end


end