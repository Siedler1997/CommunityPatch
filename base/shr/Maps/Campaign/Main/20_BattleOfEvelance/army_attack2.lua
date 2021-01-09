
-- Army in front of Outpost; tries to join first army.


ARMY2_FIRST_WAVE	= 5 * 60				-- TF: was 250
ARMY2_BASE_DELAY 	= 2 * 60
ARMY2_RESPWAN_DELAY	= 3 * 60				-- Delay after which new army spawns (with random)
APPROACH_DISTANCE2	= 6000					-- distance to castle when no re-spawn of enemy units


createArmyAttack2 = function()

	--	set up

		armyAttack2							= {}
	
		armyAttack2.player 					= 7
		armyAttack2.id						= 2
		armyAttack2.strength				= 6
		armyAttack2.position				= GetPosition("army1")
		armyAttack2.rodeLength				= 1500
		armyAttack2.control					= {}
		armyAttack2.control.delay			= ARMY2_FIRST_WAVE + Logic.GetRandom(ARMY2_BASE_DELAY)
		armyAttack2.control.wave			= 1
		armyAttack2.control.numberOfWaves	= 10			--TF: was 10

		SetupArmy(armyAttack2)

	--	job		

		StartJob("ControlArmyAttack2")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack2"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyAttack2.control.delay > 0 then
		
			armyAttack2.control.delay = armyAttack2.control.delay -1		
		
			Report("army2 attack starts in "..armyAttack2.control.delay.." seconds!")
		
			return false
			
			end
		
		return Counter.Tick2("ControlArmyAttack2",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack2 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack2) then

			if IsDead("outpost") then
			
				return true
				
				end
		
			if armyAttack2.control.wave == armyAttack2.control.numberOfWaves then
			
				return true
				
				end
	
	
				
			local size = armyAttack2.control.wave
			
			local armyType = Logic.GetRandom(3)

			if armyType == 0 then
			
				createArmy2(size,Entities.PV_Cannon4,Entities.PV_Cannon4,Entities.PU_LeaderBow4)
				
			elseif armyType == 1 then
			
				createArmy2(size,Entities.PU_LeaderPoleArm3,Entities.PU_LeaderPoleArm3,Entities.PU_LeaderPoleArm3)
				
			else
			
				createArmy2(size,Entities.PV_Cannon1,Entities.PV_Cannon1,Entities.PV_Cannon1)
				
			end
	
	
				
			armyAttack2.control.wave = armyAttack2.control.wave +1
		
			Report("army2, attack "..armyAttack2.control.wave.." type "..armyType)
		
			Retreat(armyAttack2)
						
			armyAttack2.control.delay = ARMY2_RESPWAN_DELAY + Logic.GetRandom(ARMY2_BASE_DELAY)
			
		else
		
			Report("synchronize army2")
		
			Synchronize(armyAttack1, armyAttack2)
			
			end

		return false
		
		end

-------------------------------------------------------------------------------------------------------------------	
--
--											L o c a l   T o o l s
--
-------------------------------------------------------------------------------------------------------------------	

-------------------------------------------------------------------------------------------------------------------	
createArmy2 = function(_size,_type1,_type2,_type3)
-------------------------------------------------------------------------------------------------------------------	
	local newsize = 4
	if CP_Difficulty == 1 then
		newsize = newsize * 2
	end
	
	Report("create army2, size: ".._size)
		
	local size = armyAttack2.strength - GetNumberOfSoldiers(armyAttack2)
			
	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = newsize,
		experiencePoints 	= HIGH_EXPERIENCE,
	}			

	if troopDescription.maxNumberOfSoldiers > 9 then
	
		troopDescription.maxNumberOfSoldiers = 9
		
		end

	for i = 1,size,1 do

		local distribution = Logic.GetRandom(3)
		
		if 	distribution == 2 then

			troopDescription.leaderType = _type1
			
			EnlargeArmy(armyAttack2,troopDescription)
	
		elseif distribution == 1 then

			troopDescription.leaderType = _type2
			
			EnlargeArmy(armyAttack2,troopDescription)
		
		else
		
			troopDescription.leaderType = _type3
			
			EnlargeArmy(armyAttack2,troopDescription)
		
			end

		end

	end	

