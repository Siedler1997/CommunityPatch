
-- Army that defends Kerberos' main castle; = End Boss
-- attacks player from Lion's den (Main castle)

ARMY3_FIRST_WAVE = 3 * 60
ARMY3_BASE_DELAY = 50
NUMBER_OF_WAVES = 5
if CP_Difficulty == 1 then
	ARMY3_FIRST_WAVE = ARMY3_FIRST_WAVE - 30
	ARMY3_FIRST_WAVE = ARMY3_FIRST_WAVE - 20
	NUMBER_OF_WAVES = NUMBER_OF_WAVES + 10
end

createArmyAttack3 = function()
	--	set up

		armyAttack3							= {}
	
		armyAttack3.player 					= 7
		armyAttack3.id						= 3
		armyAttack3.strength				= 3
		armyAttack3.position				= GetPosition("defend1")			-- before Main castle
		armyAttack3.rodeLength				= 2000
		armyAttack3.control					= {}
		armyAttack3.control.delay			= ARMY3_FIRST_WAVE + Logic.GetRandom(ARMY3_BASE_DELAY)
		armyAttack3.control.wave			= 1
		armyAttack3.control.numberOfWaves	= NUMBER_OF_WAVES

		SetupArmy(armyAttack3)

		createArmy3(9,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderBow4)

	--	job		

		StartJob("ControlArmyAttack3")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack3"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyAttack3.control.delay > 0 then
		
			armyAttack3.control.delay = armyAttack3.control.delay -1		
		
			Report("army1 attack starts in "..armyAttack3.control.delay.." seconds!")
		
			return false
			
			end
		
		return Counter.Tick2("ControlArmyAttack3",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack3 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack3) then

			if IsDead("lionsDen") then
			
				return true
				
				end
		
			if armyAttack3.control.attack == 0 then
			
				return true
				
				end
				
			local size = armyAttack3.control.wave * 4
			
			local armyType = Logic.GetRandom(3)
			
			if armyType == 0 then
			
				createArmy3(size,Entities.PU_LeaderSword4,Entities.PU_LeaderSword4,Entities.PU_LeaderBow4)
				
			elseif armyType == 1 then
			
				createArmy3(size,Entities.PU_LeaderHeavyCavalry2,Entities.PU_LeaderHeavyCavalry2,Entities.PU_LeaderCavalry2)
				
			else
			
				createArmy3(size,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderBow4)
				
				end
				
			armyAttack3.control.wave = armyAttack3.control.wave +1
		
			Report("army3, attack "..armyAttack3.control.wave.." type "..armyType)
		
			Retreat(armyAttack3)
						
			armyAttack3.control.delay = ARMY3_BASE_DELAY + Logic.GetRandom(ARMY3_BASE_DELAY)
			
		else
		
			Report("army3 advance")
		
			Advance(armyAttack3)
			
			end

		return false
		
		end

-------------------------------------------------------------------------------------------------------------------	
--
--											L o c a l   T o o l s
--
-------------------------------------------------------------------------------------------------------------------	

-------------------------------------------------------------------------------------------------------------------	
createArmy3 = function(_size,_type1,_type2,_type3)
-------------------------------------------------------------------------------------------------------------------	
		
	Report("create army3, size: ".._size)
		
	local size = armyAttack3.strength - GetNumberOfSoldiers(armyAttack3)
			
	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = _size,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
	}			

	if troopDescription.maxNumberOfSoldiers > 9 then
	
		troopDescription.maxNumberOfSoldiers = 9
		
		end

	for i = 1,size,1 do

		local distribution = Logic.GetRandom(3)
		
		if 	distribution == 2 then

			troopDescription.leaderType = _type1
			EnlargeArmy(armyAttack3,troopDescription)
	
		elseif distribution == 1 then

			troopDescription.leaderType = _type2
			EnlargeArmy(armyAttack3,troopDescription)
		
		else
		
			troopDescription.leaderType = _type3
			EnlargeArmy(armyAttack3,troopDescription)
		
			end

		end

	end	

