CampArmy_DELAY 			=       300
CampArmy_COUNTER 	        =	CampArmy_DELAY
CampArmyOne_DELAY 		=       300
CampArmyOne_COUNTER 	        =	CampArmyOne_DELAY
---------------------------------------------------------------------------------------------------------------------------

createCampArmy = function()


	StartJob("TimerCampArmy")
	StartJob("TimerCampArmyOne")

end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerCampArmy"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerCampArmy = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmy_COUNTER > 0 and IsAlive("Tent8") and IsAlive("Tent5") then

			CampArmy_COUNTER = CampArmy_COUNTER - 1

			return false

                elseif CampArmy_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerCampArmy = function()
	-------------------------------------------------------------------------------------------------------------------

		GenerateArmy2()

		CampArmy_DELAY 		=       240
		CampArmy_COUNTER	=	CampArmy_DELAY

		StartJob("TimerCampArmy")		

		return true


	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerCampArmyOne"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerCampArmyOne = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if CampArmyOne_COUNTER > 0 and IsAlive("Tent1") and IsAlive("Tent4") then

			CampArmyOne_COUNTER = CampArmyOne_COUNTER - 1

			return false

                elseif CampArmyOne_COUNTER==0 then 

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerCampArmyOne = function()
	-------------------------------------------------------------------------------------------------------------------

		GenerateArmy3()

		CampArmyOne_DELAY 	=       180
		CampArmyOne_COUNTER	=	CampArmyOne_DELAY

		StartJob("TimerCampArmyOne")		

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy2 = function()
	local troops	= 	{ }

	if CP_Difficulty == 0 then
		table.insert(troops, Entities.CU_BanditLeaderSword1)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troops, Entities.CU_BanditLeaderBow1)
	else
		table.insert(troops, Entities.CU_BanditLeaderSword2)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troops, Entities.CU_BanditLeaderBow2)
	end

	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]


	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


		local pos = GetPosition("CampSpawn1")
		RaidAttack3 = AI.Entity_CreateFormation(2, RandomUnit, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(RaidAttack3, "RandAttack3")


		Attack("RandAttack3",RandomAttackPoint)

end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy3 = function()
	local troops	= 	{ }

	if CP_Difficulty == 0 then
		table.insert(troops, Entities.CU_BanditLeaderSword1)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub1)
		table.insert(troops, Entities.CU_BanditLeaderBow1)
	else
		table.insert(troops, Entities.CU_BanditLeaderSword2)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub2)
		table.insert(troops, Entities.CU_BanditLeaderBow2)
	end


	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]

	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


		local pos = GetPosition("CampSpawn3")
		RaidAttack4 = AI.Entity_CreateFormation(2, RandomUnit, 0, 8, pos.X, pos.Y, 0, 0, CP_Difficulty, 0)
		SetEntityName(RaidAttack4, "RandAttack4")


		Attack("RandAttack4",RandomAttackPoint)

end