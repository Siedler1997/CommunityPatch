
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
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.maxNumberOfSoldiers = 1

		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
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
			
		troopDescription.maxNumberOfSoldiers = 0
		
		troopDescription.leaderType = Entities.CU_BanditLeaderBow1
		EnlargeArmy(armyVillageRaidersB,troopDescription)
	

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

			if IsDead(armyVillageRaidersA) and IsDead(armyVillageRaidersB) then

				end1stQuest()	
								
				start2ndQuest()
				
				return true;
				
				end

		--	ai 
			
			FrontalAttack(armyVillageRaidersA)
			
			FrontalAttack(armyVillageRaidersB)
		
		return false
		
		end
