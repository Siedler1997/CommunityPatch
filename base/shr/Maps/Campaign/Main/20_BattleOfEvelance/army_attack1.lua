
-- Army in front of Outpost; attacks player

ARMY1_FIRST_WAVE	= 4 * 60				-- TF: was 120
ARMY1_BASE_DELAY 	= 2 * 60
ARMY1_RESPWAN_DELAY	= 3 * 60				-- Delay after which new army spawns (with random)
APPROACH_DISTANCE	= 6000					-- distance to castle when no re-spawn of enemy units

SETUP				= 1
ADVANCE				= 2

createArmyAttack1 = function()

	--	set up

		armyAttack1							= {}
	
		armyAttack1.player 					= 7
		armyAttack1.id						= 1
		armyAttack1.strength				= 8
		armyAttack1.position				= GetPosition("army1")
		armyAttack1.rodeLength				= 2000
		armyAttack1.control					= {}
		armyAttack1.control.delay			= ARMY1_FIRST_WAVE + Logic.GetRandom(ARMY1_BASE_DELAY)
		armyAttack1.control.wave			= 1
		armyAttack1.control.numberOfWaves	= 10		--Number of attack waves 
		armyAttack1.control.mode			= SETUP
		
		SetupArmy(armyAttack1)

		createArmy(armyAttack1,4,Entities.PU_LeaderPoleArm1,Entities.PU_LeaderPoleArm1,Entities.PU_LeaderBow1)

	--	job		

		StartJob("ControlArmyAttack1")

	end
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyAttack1.control.delay > 0 then
		
			armyAttack1.control.delay = armyAttack1.control.delay -1		
		
			Report("army1 attack starts in "..armyAttack1.control.delay.." seconds!")
		
			return false
			
			end
		
		return Counter.Tick2("ControlArmyAttack1",5)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------

		if IsDead(armyAttack1) and armyAttack1.control.mode == ADVANCE then

			if IsDead("outpost") then
			
				return true
				
				end
		
			armyAttack1.control.mode = SETUP

			Report("army1: enter SETUP mode")
				
			Retreat(armyAttack1)
						
			armyAttack1.control.delay = ARMY1_RESPWAN_DELAY + Logic.GetRandom(ARMY1_BASE_DELAY)

			end
			
			
		-- spawn new army if no enemy is near
		if armyAttack1.control.mode == SETUP and GetClosestEntity(armyAttack1, APPROACH_DISTANCE) == 0 then
				
			if HasFullStrength(armyAttack1) == false then

				spawnArmy(armyAttack1, 50)
				
			else
			
				-- next attack wave

				if armyAttack1.control.wave >= armyAttack1.control.numberOfWaves then
					return true
				end

				armyAttack1.control.wave = armyAttack1.control.wave +1
				
				
				armyAttack1.control.mode = ADVANCE
				
				Report("army1: enter ADVANCE mode")
				
				end
			
		else
		
			Report("army1 advance")
		
			Advance(armyAttack1)
			
			end

		return false
		
		end

-------------------------------------------------------------------------------------------------------------------	
--
--											L o c a l   T o o l s
--
-------------------------------------------------------------------------------------------------------------------	

-------------------------------------------------------------------------------------------------------------------	
createArmy = function(_army,_size,_type1,_type2,_type3)
-------------------------------------------------------------------------------------------------------------------	
	local newsize = 4
	if CP_Difficulty == 1 then
		newsize = newsize * 2
	end

	local troopDescription = {
	
		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = newsize,
		experiencePoints 	= _army.control.wave / 2,
	}			

	if troopDescription.experiencePoints > VERYHIGH_EXPERIENCE then
	
		troopDescription.experiencePoints = VERYHIGH_EXPERIENCE
		
		end

	if troopDescription.maxNumberOfSoldiers > 9 then
	
		troopDescription.maxNumberOfSoldiers = 9
		
		end

	local distribution = Logic.GetRandom(3)
	
	if 	distribution == 2 then

		troopDescription.leaderType = _type1
		
		EnlargeArmy(_army,troopDescription)

	elseif distribution == 1 then

		troopDescription.leaderType = _type2
		
		EnlargeArmy(_army,troopDescription)
	
	else
	
		troopDescription.leaderType = _type3
		
		EnlargeArmy(_army,troopDescription)
	
		end

	end	

-------------------------------------------------------------------------------------------------------------------	
spawnArmy = function(_army, _chance)
-------------------------------------------------------------------------------------------------------------------	

	if 	_army.strength - GetNumberOfSoldiers(_army) == 0 then
	
		return
		
		end

	if Logic.GetRandom(100) > _chance then
	
		-- set kind of attack waves
	
		local size = _army.control.wave * 2
		
		local sword			= 	Entities.PU_LeaderSword4
		local pike			=	Entities.PU_LeaderPoleArm4	
		local bow			=	Entities.PU_LeaderBow4
		local cavalry		=	Entities.PU_LeaderHeavyCavalry2
		local cavalryBow	=	Entities.PU_LeaderCavalry2
		
		if _army.control.wave < 3 then
		
			sword		= 	Entities.PU_LeaderSword1
			pike		=	Entities.PU_LeaderPoleArm1	
			bow			=	Entities.PU_LeaderBow1
			cavalry		=	Entities.PU_LeaderHeavyCavalry1
			cavalryBow	=	Entities.PU_LeaderCavalry1

		elseif _army.control.wave < 4 then
		
			sword		= 	Entities.PU_LeaderSword2
			pike		=	Entities.PU_LeaderPoleArm2
			bow			=	Entities.PU_LeaderBow2
			cavalry		=	Entities.PU_LeaderHeavyCavalry1
			cavalryBow	=	Entities.PU_LeaderCavalry1

		elseif _army.control.wave < 6 then
		
			sword		= 	Entities.PU_LeaderSword3
			pike		=	Entities.PU_LeaderPoleArm3
			bow			=	Entities.PU_LeaderBow3
			cavalry		=	Entities.PU_LeaderHeavyCavalry2
			cavalryBow	=	Entities.PU_LeaderCavalry2

			end
										
		local armyType = Logic.GetRandom(3)
		
		if armyType == 0 then
		
--			createArmy(_army,size,Entities.PU_LeaderSword4,Entities.PU_LeaderSword4,Entities.PU_LeaderBow4)
			createArmy(_army,size,sword,sword,bow)
			
		elseif armyType == 1 then
		
--			createArmy(_army,size,Entities.PU_LeaderHeavyCavalry2,Entities.PU_LeaderHeavyCavalry2,Entities.PU_LeaderCavalry2)
			createArmy(_army,size,cavalry,cavalry,cavalryBow)
			
		else
		
--			createArmy(_army,size,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderPoleArm4,Entities.PU_LeaderBow4)
			createArmy(_army,size,pike,pike,cavalryBow)
			
			end
			
		Report("army1: spawning...")
			
		end
	
	end
