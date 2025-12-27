
-------------------------------------------------------------------------------------------------------------

create1stQuest = function()

	Report("start 1st Quest")

	--	ai

		createArmyDefendBase()

		createArmyHostile1()
		createArmyHostile2()
		createArmyHostile3()
		
		createArmyFriendly1()
		createArmyFriendly2()

		createArmyBandits1()
	
	--	briefing
	
		createBriefingBigBattle()
	
	--	quests
	
		startQuestDefeat()
		startQuestVictory()
		startQuestBigBattle()
		startQuestMercenaryShop()

	end
	
destroy1stQuest = function()

	Report("end 1st Quest")

	end
	
-------------------------------------------------------------------------------------------------------------

create2ndQuest = function()

	Report("start 2nd Quest")

	--	briefing
	
		createBriefingDestroyTowers()

	--	quest
	
		startQuestTowers()

	end
	

destroy2ndQuest = function()

	ResolveBriefing(briefingDestroyTowers[page_destroyTowers])

	Report("end 2nd Quest")

	end
	
-------------------------------------------------------------------------------------------------------------
	
create3rdQuest = function()
	
	Report("start 3rd Quest")
	
	if IsDead("magicFoundry") == false then

		--	briefing
	
			createBriefingMagicFoundry()
	
		-- 	ai
		
			createArmyCannons()	

		end
	
	--	quests
		
		startQuestCannons()

	end
	
destroy3rdQuest = function()

	Report("end 3rd Quest")

	if briefingMagicFoundry ~= nil then
	
		ResolveBriefing(briefingMagicFoundry[page_magicFoundry])
		
		end
	
	armyHostile1.control.spawnIsActive = false
	armyHostile2.control.spawnIsActive = false
	armyHostile3.control.spawnIsActive = false
	
	armyFriendly1.control.spwanIsActive = false
	armyFriendly2.control.spwanIsActive = false

	end

-------------------------------------------------------------------------------------------------------------
	
create4thQuest = function()	

	--	ai
	
		createArmyBig()

	--	briefing
	
		createBriefingBigArmy()
		
	--	quests	
	
		startQuestBigArmy()
	
	end
	
destroy4thQuest = function()

	ResolveBriefing(briefingBigArmy[page_bigArmy])

	end
	
-------------------------------------------------------------------------------------------------------------
	
create5thQuest = function()	

	--	briefing
	
		createBriefingSiege()

	--	quests
	
		startQuestSupportAttack()

	--	ai
	
		createArmyDefend1()
		createArmyDefend2()
		createArmyDefend3()
		createArmyDefend4()
	
	end
	
destroy5thQuest = function()

	ResolveBriefing(briefingSiege[page_siege])

	end
	
-------------------------------------------------------------------------------------------------------------
	
startQuestSupportAttack = function()
	
	startQuestSupportArmy()
	
	end
	
endQuestSupportAttack = function()

	DisableNpcMarker("merchant1")

	ResolveBriefing(briefingSupportArmy[page_supportArmy])

	createBriefingMerchant1Dialog()

	local job = {}

	job.Tribute = uniqueTributeCount
	
	uniqueTributeCount = uniqueTributeCount +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.Key("tribute1"),
						ResourceType.Gold, 
						6000 )

	job.Callback 	= TributePaidSupportArmy
	
	SetupTributePaid(job)
	
	end
	
TributePaidSupportArmy = function()
	
	createArmySupport()
	
	end

-------------------------------------------------------------------------------------------------------------
	
startQuestMercenaryShop  = function()
	
	EnableNpcMarker("merchant2")
	
	end
	
endQuestMercenaryShop = function()

	DisableNpcMarker("merchant2")

	createBriefingMerchant2Dialog()

	--	pilgrim

		local job = {}
	
		job.Tribute = uniqueTributeCount
		
		uniqueTributeCount = uniqueTributeCount +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute2"),
							ResourceType.Gold, 
							2000 )
	
		job.Callback 	= TributePaidPilgrim
		
		SetupTributePaid(job)

	--	erec

		local job = {}
	
		job.Tribute = uniqueTributeCount
		
		uniqueTributeCount = uniqueTributeCount +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute3"),
							ResourceType.Gold, 
							2000 )
	
		job.Callback 	= TributePaidErec
		
		SetupTributePaid(job)

	--	ari

		local job = {}
	
		job.Tribute = uniqueTributeCount
		
		uniqueTributeCount = uniqueTributeCount +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute4"),
							ResourceType.Gold, 
							2000 )
	
		job.Callback 	= TributePaidAri
		
		SetupTributePaid(job)

	--	Salim

		local job = {}
	
		job.Tribute = uniqueTributeCount
		
		uniqueTributeCount = uniqueTributeCount +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute5"),
							ResourceType.Gold, 
							2000 )
	
		job.Callback 	= TributePaidSalim
		
		SetupTributePaid(job)

	--	Yuki

		local job = {}
	
		job.Tribute = uniqueTributeCount
		
		uniqueTributeCount = uniqueTributeCount +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute6"),
							ResourceType.Gold, 
							2000 )
	
		job.Callback 	= TributePaidYuki
		
		SetupTributePaid(job)
	
	end
	
TributePaidPilgrim = function()
	
	ChangePlayer("Pilgrim",1)
	
	end

TributePaidAri = function()
	
	ChangePlayer("Anton",1)
	
	end
	
TributePaidErec = function()
	
	ChangePlayer("Erec",1)
	
	end

TributePaidSalim = function()
	
	ChangePlayer("Salim",1)
	
	end

TributePaidYuki = function()
	
	ChangePlayer("Yuki",1)
	
	end

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	if IsBriefingActive() then
	
		return
	
		end
	
	if Logic.IsHero(_heroId) then

		if _npcId == GetEntityId("merchant1") then
			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				endQuestSupportAttack()

				end
				
			end

		if _npcId == GetEntityId("merchant2") then
			
			if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then

				endQuestMercenaryShop()

				end
				
			end
			
		end

	end