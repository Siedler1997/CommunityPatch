EasyAttacks_DELAY 		=       300
EasyAttacks_COUNTER 	        =	EasyAttacks_DELAY
---------------------------------------------------------------------------------------------------------------------------

createEasyAttacks = function()


	StartJob("TimerEasyAttacks")

	end


---------------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "TimerEasyAttacks"
--
---------------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_TimerEasyAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

                
                if EasyAttacks_COUNTER > 0 and SpawnAttacksStatus==0 then

			EasyAttacks_COUNTER = EasyAttacks_COUNTER - 1

			return false

                elseif EasyAttacks_COUNTER == 0 then

			return true
                      
                                 
		end

	end


		
	-------------------------------------------------------------------------------------------------------------------
	Action_TimerEasyAttacks = function()
	-------------------------------------------------------------------------------------------------------------------

		GenerateArmy()

		EasyAttacks_DELAY 		=       300
		EasyAttacks_COUNTER 	        =	EasyAttacks_DELAY

		StartJob("TimerEasyAttacks")

		return true


	end

---------------------------------------------------------------------------------------------------------------------------

GenerateArmy = function()
	local experience = LOW_EXPERIENCE	
	local troops	= 	{	
				Entities.CU_BanditLeaderBow1
				}

	if CP_Difficulty == 0 then
		table.insert(troops, Entities.CU_BanditLeaderSword1)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub1)
	else
		experience = experience + 2
		table.insert(troops, Entities.CU_BanditLeaderSword2)
		table.insert(troops, Entities.CU_Barbarian_LeaderClub2)
	end

	spawnLocations	= {	"EasySpawn1",
				"EasySpawn2",
				"EasySpawn3",
				"EasySpawn4"
				}

	AttackPoints	= {	"AttackTarget1",
				"AttackTarget2",
				"AttackTarget3",
				"AttackTarget4",
				"AttackTarget5"
				}


	RandomUnit 		= 	troops[Logic.GetRandom(table.getn(troops))+1]

	RandomSpawnLocation 	= 	spawnLocations[Logic.GetRandom(table.getn(spawnLocations))+1]

	RandomAttackPoint 	= 	AttackPoints[Logic.GetRandom(table.getn(AttackPoints))+1]


		local pos = GetPosition(RandomSpawnLocation)
		RaidAttack1 = AI.Entity_CreateFormation(2, RandomUnit, 0, 8, pos.X, pos.Y, 0, 0, experience, 0)
		SetEntityName(RaidAttack1, "RandAttack1")


		Attack("RandAttack1",RandomAttackPoint)

end

