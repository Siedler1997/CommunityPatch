timeForUpgrades = 0
------------------------------------------------------------------------------------------------------------------------------------
function createQuestSurvive()
	
	StartSimpleJob("createBriefingSupportNogersund")

    -- start timer
    GUIQuestTools.ToggleStopWatch(timeForSupport,1)
    
	-- start spawning of support troops
	StartSimpleJob("createArmiesAndTroops")
	
	-- activate alarm for friendly AIs
	StartSimpleJob("ActivateAIalarm")

	--Give techs earlier on lower difficulties
	if CP_Difficulty < 2 then
		timeForUpgrades = timeForUpgrades + 5
	end

	StartSimpleJob("GivePlayerUpgrades")
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
		leaderType          = Entities.PU_LeaderSword4,
		position            = GetPosition("supportNogersund")
	}
	
	local troopDescription2	= {

		minNumberOfSoldiers	= 0,
		maxNumberOfSoldiers = 9,
		experiencePoints 	= VERYHIGH_EXPERIENCE,
		leaderType          = Entities.PU_LeaderBow4,
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
			local unitType = Entities.PU_LeaderSword1
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSword1) == 1 then
				unitType = Entities.PU_LeaderSword2
			end

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = unitType,
				position            = GetPosition("supportSword")
			}
	
    		local armySword = {}
			CreateTroop(armySword,troopDescription)
			
			Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[1]"))
		end
	end
	
	-- create polearmtroops
	if Counter.Tick2("counterSupportSpear", 60*3 + GetRandom(60*1)) then
		if IsExisting("barracks") then
			local unitType = Entities.PU_LeaderPoleArm1
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSpear1) == 1 then
				unitType = Entities.PU_LeaderPoleArm2
			end

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = unitType,
				position            = GetPosition("supportSpear")
			}
	
    		local armySword = {}
			CreateTroop(armySword,troopDescription)
			
			Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[5]"))
		end
	end
	
	-- create bowtroops
	if Counter.Tick2("counterSupportBow", 60*2 + GetRandom(60*1)) then
		if IsExisting("archery") then
			local unitType = Entities.PU_LeaderBow1
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeBow1) == 1 then
				unitType = Entities.PU_LeaderBow2
			end

			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = unitType,
				position            = GetPosition("supportBow")
			}
	
			local armyBow = {}
    		CreateTroop(armyBow,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[2]"))
		end
	end

	-- create cavalrytroops
	if Counter.Tick2("counterSupportCavalry1", 60*3 + GetRandom(60*1)) then
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
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[3]"))
    	end
	end	

	-- create range cavalrytroops
	if Counter.Tick2("counterSupportCavalry2", 60*3 + GetRandom(60*1)) then
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
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[6]"))
    	end
	end	

	-- create cannons
	if Counter.Tick2("counterSupportCannon", 60*4 + GetRandom(60*1)) then
		if IsExisting("foundry") then
			local randomCannon = GetRandom(1,10)
			local unitType = Entities.PV_Cannon1
			--rarely produce a better cannon
			if unitType == 10 then
				unitType = Entities.PV_Cannon3
			end
			local troopDescription	= {

				minNumberOfSoldiers	= 0,
				maxNumberOfSoldiers = 9,
				experiencePoints 	= LOW_EXPERIENCE,
				leaderType          = unitType,
				position            = GetPosition("supportCannon")
			}
	
			local armyCannon = {}
    		CreateTroop(armyCannon,troopDescription)
    		
    		Sound.Play2DSound(Sounds.fanfare, 0,100)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteSupport[4]"))
		end
	end
	
end

function ActivateAIalarm()
	--No need to check that every second
	if Counter.Tick2("ActivateAIalarm", 10) then
		if IsExisting("p7villagecenter") and Logic.IsAlarmModeActive(Logic.GetEntityIDByName("p7villagecenter")) == false then
			if not IsExisting("p7sawmill") then
				SetAlarmModeForAI(7, 1)
			end
		end
		if IsExisting("p6villagecenter") and Logic.IsAlarmModeActive(Logic.GetEntityIDByName("p6villagecenter")) == false then
			if not IsExisting("stable") then
				SetAlarmModeForAI(7, 1)
			end
		end
		if IsExisting("p4villagecenter") and Logic.IsAlarmModeActive(Logic.GetEntityIDByName("p4villagecenter")) == false then
			if not IsExisting("foundry") then
				SetAlarmModeForAI(7, 1)
			end
		end
	end
end

function GivePlayerUpgrades()
	--Every 60 seconds
	if Counter.Tick2("GivePlayerUpgrades", 60) then
		timeForUpgrades = timeForUpgrades + 1

		local techToResearch
		if timeForUpgrades == 10 then
			if IsExisting("barracks") then
				techToResearch = Technologies.T_UpgradeSpear1
			end
		elseif timeForUpgrades == 15 then
			if IsExisting("p4blacksmith") then
				techToResearch = Technologies.T_SoftArcherArmor
			end
		elseif timeForUpgrades == 20 then
			if IsExisting("barracks") then
				techToResearch = Technologies.T_UpgradeSword1
			end
		elseif timeForUpgrades == 25 then
			if IsExisting("archery") then
				techToResearch = Technologies.T_UpgradeBow1
			end
		elseif timeForUpgrades == 30 then
			if IsExisting("p4blacksmith") then
				techToResearch = Technologies.T_LeatherMailArmor
			end
		elseif timeForUpgrades == 35 then
			if IsExisting("p4villagecenter") then
				techToResearch = Technologies.T_Loom
			end
		elseif timeForUpgrades == 40 then
			if IsExisting("p4villagecenter") or Logic.GetNumberOfEntitiesOfType(Entities.PB_VillageCenter1) > 0 then
				techToResearch = Technologies.T_TownGuard
			end
		end

		--building may be already destroyed
		if techToResearch ~= nil then
			ResearchTechnology(techToResearch)
			GUI.AddNote(XGUIEng.GetStringTableText("CM03_03_Neighborhood/noteTechnology"))
		end

		--End job when all techs are researched
		if timeForUpgrades == 40 then
			return true
		end
	end
end