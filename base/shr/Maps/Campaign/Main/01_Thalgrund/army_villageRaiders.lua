
-- attackers at mission start

createArmyVillageRaiders = function()

	--	village raiders a

		armyVillageRaidersA				= {}
	
		armyVillageRaidersA.player 		= 7
		armyVillageRaidersA.id			= 1
		armyVillageRaidersA.strength	= 1
		armyVillageRaidersA.position	= GetPosition("HomeVillage1")
		armyVillageRaidersA.rodeLength	= 300
		
		armyVillageRaidersA.SerfCountdown	= 45
		
		SetupArmy(armyVillageRaidersA)

	--	create army	a

		local troopDescription = {
		
			maxNumberOfSoldiers	= 0,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= 0
		}			

		if CP_Difficulty == 2 then
			troopDescription.experiencePoints = 1
		end

		troopDescription.leaderType = Entities.PU_LeaderSword1
--		troopDescription.leaderType = Entities.PU_LeaderPoleArm1
		EnlargeArmy(armyVillageRaidersA,troopDescription)

	--	village raiders b

		armyVillageRaidersB				= {}
	
		armyVillageRaidersB.player 		= 7
		armyVillageRaidersB.id			= 2
		armyVillageRaidersB.strength	= 1
		armyVillageRaidersB.position	= GetPosition("HomeVillage2")
		armyVillageRaidersB.rodeLength	= 300
		
		SetupArmy(armyVillageRaidersB)

	--	create army	b
			
		troopDescription.leaderType = Entities.PU_LeaderCavalry1
		EnlargeArmy(armyVillageRaidersB,troopDescription)

	--	village raiders c

		armyVillageRaidersC				= {}
	
		armyVillageRaidersC.player 		= 7
		armyVillageRaidersC.id			= 7
		armyVillageRaidersC.strength	= 1
		armyVillageRaidersC.position	= GetPosition("HomeVillage3")
		armyVillageRaidersC.rodeLength	= 300
		
		SetupArmy(armyVillageRaidersC)

	--	create army	c
			
		troopDescription.leaderType = Entities.PU_LeaderPoleArm2
		EnlargeArmy(armyVillageRaidersC,troopDescription)

	--	village raiders d

		armyVillageRaidersD				= {}
	
		armyVillageRaidersD.player 		= 7
		armyVillageRaidersD.id			= 8
		armyVillageRaidersD.strength	= 1
		armyVillageRaidersD.position	= GetPosition("HomeVillage4")
		armyVillageRaidersD.rodeLength	= 300
		
		SetupArmy(armyVillageRaidersD)

	--	create army	d
			
		troopDescription.leaderType = Entities.PU_LeaderPoleArm3
		EnlargeArmy(armyVillageRaidersD,troopDescription)
	

	--	start jobs
		
		StartJob("ControlArmyVillageRaiders")
	
	end

-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyVillageRaiders"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyVillageRaiders = function()
	-------------------------------------------------------------------------------------------------------------------
		
	-- Burn down houses
		for i = 0, 5, 1 do

			if IsAlive("Destroy"..i) then
				local house = Logic.GetEntityIDByName("Destroy"..i)
				Logic.HurtEntity(house, (Logic.GetEntityMaxHealth(house)*0.02) )
			end
		end
		

	-- make start serf selectable when he reach the village	
		if briefingPrelude ~= nil then
			if IsNear(briefingPrelude.refugee, Logic.GetEntityIDByName("OwnSerfTargetPos"),BRIEFING_TALK_DISTANCE) then 
				Logic.SetEntitySelectableFlag(briefingPrelude.refugee, 1)
				Logic.SetEntityUserControlFlag(briefingPrelude.refugee, 1)
			end
		end
		
	-- move serfs in village again

		if armyVillageRaidersA.SerfCountdown >= 0 then
			armyVillageRaidersA.SerfCountdown = armyVillageRaidersA.SerfCountdown - 1
		end


		-- go!
		if armyVillageRaidersA.SerfCountdown == 0 then
			for i=0,5,1 do
				if IsAlive("serf"..i) then
					Move("serf"..i, "serfTarget"..i)
				end
			end
		end
		
	--	
		return Counter.Tick2("ControlArmyVillageRaiders", 5)
		
		end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyVillageRaiders = function()
	-------------------------------------------------------------------------------------------------------------------

		--	start next quest?

			if IsDead(armyVillageRaidersA) and IsDead(armyVillageRaidersB) and IsDead(armyVillageRaidersC) and IsDead(armyVillageRaidersD) then

				end1stQuest()	
								
				start2ndQuest()
				
				return true;
				
				end

		--	ai 
			
			FrontalAttack(armyVillageRaidersA)
			FrontalAttack(armyVillageRaidersB)
			FrontalAttack(armyVillageRaidersC)
			FrontalAttack(armyVillageRaidersD)
		
		return false
		
		end
