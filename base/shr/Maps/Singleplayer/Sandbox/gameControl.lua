-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	do what you want
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	--	NPC's

	local NPCNames		= {}

	NPCNames[1]			= "InfoKerberos"	-- at stables
	NPCNames[2]			= "Merchant"	-- in front of barracks
	
	CreateNPCsBriefings(NPCNames)

	--	ai
	
	createPlayer1()
	createPlayer3()
	createPlayer5()
	createPlayer7()
	
	StartSimpleJob("ControlEnemyHeroes")
	
	--	briefing

	createBriefingPrelude()
	
	--	quests

	createQuestPlayer3ToFriend()
	
	AddDefeatEntity("HQ")

	start1stSubQuest()
end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

end	

-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	destroy cathedral
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

	createQuestDestroyCathedral()
	
end

end1stSubQuest = function()

	Report("end 1st sub quest")

	start2ndSubQuest()
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Sub Quest:	get gold
--
-------------------------------------------------------------------------------------------------------------------------

start2ndSubQuest = function()

	Report("start 2nd sub quest")

	CreateChest(GetPosition("ChestPos"), end2ndSubQuest)
	
end

end2ndSubQuest = function()

	Report("end 2nd sub quest")

	Message(XGUIEng.GetStringTableText("Support/ChestGold2a").. 5000 ..XGUIEng.GetStringTableText("Support/ChestGold2b") )
	Tools.GiveResouces(gvMission.PlayerID, 5000)
	
end


-------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	MapLocal_npcCheck(_heroId,_npcId)
	
	if _npcId == GetEntityId("Merchant") then
		if talkedToMerchant == nil then
			createQuestBuySulfur()
			talkedToMerchant = true
		end
	end
end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Kerberos
		if IsAlive("BlackKnight") then
			if AreEnemiesInArea(GetPlayer("BlackKnight"), GetPosition("BlackKnight"), 1000) then
				local HeroID = GetEntityId("BlackKnight")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerInflictFear(HeroID)
				end
			end
		end
	end
end