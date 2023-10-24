
-- army of Regent Dovbar. Created when player paid him tribute

createArmyRegent = function()

	--	set up

		armyRegent						= {}
	
		armyRegent.player 				= 2
		armyRegent.id					= 3
		armyRegent.strength				= 8
		armyRegent.position				= GetPosition("defSpawnPoint4_CD")
		armyRegent.rodeLength			= 1000
		armyRegent.control				= {}
		armyRegent.control.setup		= true
		armyRegent.control.counter		= 3
		
		SetupArmy(armyRegent)

	--	job		
		
		StartJob("ControlArmyRegent")

	end




-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyRegent"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyRegent = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return Counter.Tick2("ControlArmyRegent",3)	
		
		end
		
		
		
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyRegent = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if armyRegent.control.setup == true and armyRegent.control.counter > 0 then 
		
			if HasFullStrength(armyRegent) == false then

				local troopDescription = {
				
					maxNumberOfSoldiers	= 4,
					minNumberOfSoldiers	= 0,
					experiencePoints 	= HIGH_EXPERIENCE,
				}				
	
				if Logic.GetRandom(100) > 40 then
				
					troopDescription.leaderType = Entities.PU_LeaderSword2				
					
				else
				
					troopDescription.leaderType = Entities.PU_LeaderBow2				 
	
					end
				
				EnlargeArmy(armyRegent,troopDescription)
					
			else
		
				armyRegent.control.setup = false
			
				end
				
		else

			if IsVeryWeak(armyRegent) then
			
				armyRegent.control.setup = true
				
				if armyRegent.control.counter > 0 then
				
					armyRegent.control.counter = armyRegent.control.counter -1
					
					end
				
				Retreat(armyRegent)
			
			else
				
				Advance(armyRegent)
				
				end
			
			end

		return false
		
		end
	