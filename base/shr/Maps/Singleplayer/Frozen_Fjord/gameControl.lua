
-------------------------------------------------------------------------------------------------------------

create1stQuest = function()

	Report("start 1st Quest")

	--	ai

		createArmyDefend()
		createArmySpawn()
		
		StartSimpleJob("ControlEnemyHeroes")
		
	--	merchants
	
		InitNPCLookAt("merchant1")

	--	briefing

		createBriefingPrelude()

	--	quests
	
		startQuestDefeat()
		startQuestVictory()
		startQuestViking()
end



	
destroy1stQuest = function()

	ResolveBriefing(briefingPrelude[page_prelude])
	Victory()
	Report("end 1st Quest")

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

				createBriefingMerchant1()				
				DisableNpcMarker("merchant1")				
				ResolveBriefing(briefingPrelude[page_preludeMerchant1])		

			end				
		end			
	end

end


function ControlEnemyHeroes()
	if Counter.Tick2("ControlEnemyHeroes", 5) then
		--Varg
		--[[
		--Deactivated for Varg because I'm too lazy to prevent him from drowning after usage
		if IsAlive("viking") then
			if AreEnemiesInArea(GetPlayer("viking"), GetPosition("viking"), 2000) then
				local HeroID = GetEntityId("viking")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerSummon(HeroID)
				end

				GUI.SettlerAffectUnitsInArea(HeroID)
			end
		end
		--]]
		--Mary
		if IsAlive("mary") then
			if AreEnemiesInArea(GetPlayer("mary"), GetPosition("mary"), 1000) then
				local HeroID = GetEntityId("mary")
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.9) then
					GUI.SettlerAffectUnitsInArea(HeroID)
				end
				if Logic.GetEntityHealth(HeroID) < (Logic.GetEntityMaxHealth(HeroID) * 0.8) then
					GUI.SettlerCircularAttack(HeroID)
				end
			end
		end
		--Kerberos
		if IsAlive("kerberos") then
			if AreEnemiesInArea(GetPlayer("kerberos"), GetPosition("kerberos"), 1000) then
				local HeroID = GetEntityId("kerberos")
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