
------------------------------------------------------------------------------------------------------------------------------------
function createQuestSurvive()
	
	StartSimpleJob("createBriefingSupportNogersund")

    -- start timer
    GUIQuestTools.ToggleStopWatch(timeForSupport,1)
    
	-- start spawning of support troops
	StartSimpleJob("createArmiesAndTroops")
	
end

------------------------------------------------------------------------------------------------------------------------------------
function createBriefingSupportNogersund()

    if timeForSupport > 0 then

        timeForSupport = timeForSupport -1

--		Report("time for support "..timeForSupport)

        return false

	end

	createSupportNogersund()
	createBriefingSupport()
	
--	briefingSupportNogersund = {}

--	briefingSupportNogersund.restoreCamera = true

--	briefingSupportNogersund.finished = createSupportNogersund

--	local page = 0

	--	page #1

--		page = page + 1

--		briefingSupportNogersund[page] 				    = 	{}
--		briefingSupportNogersund[page].title		    = 	String.Key("briefingSupportNogersund[1].title")
--		briefingSupportNogersund[page].text			    =	String.Key("briefingSupportNogersund[1].text")
--		briefingSupportNogersund[page].position 	    = 	GetPosition("supportNogersundStreet")

--		StartBriefing(briefingSupportNogersund)

    return true

end

------------------------------------------------------------------------------------------------------------------------------------
function createSupportNogersund()

	-- create support troops from Fort Nogersund
	
	local troopDescription1	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
		leaderType          = Entities.PU_LeaderSword3,
		position            = GetPosition("supportNogersund")
	}
	
	local troopDescription2	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
		leaderType          = Entities.PU_LeaderBow3,
		position            = GetPosition("supportNogersund")
	}
	
	local troopDescription3	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
		leaderType          = Entities.PV_Cannon3,
		position            = GetPosition("supportNogersund")
	}
	
	
	
    local armySupport		= {}

	local support = {}
	support[1 ] = CreateTroop(armySupport,troopDescription1)
	support[2 ] = CreateTroop(armySupport,troopDescription1)
	support[3 ] = CreateTroop(armySupport,troopDescription1)
	support[4 ] = CreateTroop(armySupport,troopDescription2)
	support[5 ] = CreateTroop(armySupport,troopDescription2)
	support[6 ] = CreateTroop(armySupport,troopDescription2)
	support[7 ] = CreateTroop(armySupport,troopDescription3)
	support[8 ] = CreateTroop(armySupport,troopDescription3)
	support[9 ] = CreateTroop(armySupport,troopDescription3)
	support[10] = CreateTroop(armySupport,troopDescription3)
	support[11] = CreateTroop(armySupport,troopDescription3)
    
    for i=1,11 do
    	Move(support[i],"supportNogersundStreet")
    end
    
    CreateEntity(1,Entities.PU_Hero6,GetPosition("heliasStart"),"Helias")
	Move("Helias","heliasDest")

    return true

end

------------------------------------------------------------------------------------------------------------------------------------
function createArmiesAndTroops()

	-- create swordtroops
	if Counter.Tick2("counterSupportSword", 60*2 + GetRandom(60*1)) then
		if IsExisting("barracks") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PU_LeaderSword1,
				position            = GetPosition("supportSword")
			}
	
    		local armySword = {}
			CreateTroop(armySword,troopDescription)
			
			Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[1]"))
		end
	end
	
	-- create polearmtroops
	if Counter.Tick2("counterSupportSword", 60*3 + GetRandom(60*1)) then
		if IsExisting("barracks") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PU_LeaderPoleArm1,
				position            = GetPosition("supportSpear")
			}
	
    		local armySword = {}
			CreateTroop(armySword,troopDescription)
			
			Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[5]"))
		end
	end
	
	-- create bowtroops
	if Counter.Tick2("counterSupportBow", 60*2 + GetRandom(60*1)) then
		if IsExisting("archery") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PU_LeaderBow1,
				position            = GetPosition("supportBow")
			}
	
			local armyBow = {}
    		CreateTroop(armyBow,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[2]"))
		end
	end

	-- create cavalrytroops
	if Counter.Tick2("counterSupportCavalry", 60*3 + GetRandom(60*1)) then
		if IsExisting("stable") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PU_LeaderHeavyCavalry1,
				position            = GetPosition("supportCavalry")
			}
	
			local armyCavalry = {}
    		CreateTroop(armyCavalry,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[3]"))
    	end
	end	

	-- create range cavalrytroops
	if Counter.Tick2("counterSupportCavalry", 60*3 + GetRandom(60*1)) then
		if IsExisting("stable") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PU_LeaderCavalry1,
				position            = GetPosition("supportCavalry2")
			}
	
			local armyCavalry = {}
    		CreateTroop(armyCavalry,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[6]"))
    	end
	end	

	-- create cannons
	if Counter.Tick2("counterSupportCannon", 60*4 + GetRandom(60*1)) then
		if IsExisting("foundry") then

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = Entities.PV_Cannon1,
				position            = GetPosition("supportCannon")
			}
	
			local armyCannon = {}
    		CreateTroop(armyCannon,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,127)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[4]"))
		end
	end
	
end