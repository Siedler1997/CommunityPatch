-------------------------------------------------------------------------------------------------------------------------
--
--									1st Quest:	do what you want
--
-------------------------------------------------------------------------------------------------------------------------

start1stQuest = function()

	Report("start 1st quest")

	local NPCs = {}
	
	NPCs[1] = "Mayor"
	NPCs[2] = "SulfurMayor"
	
	local Briefings = {}
	
	Briefings[1] = createBriefingIron()
	Briefings[2] = createBriefingSulfur()

	CreateNPCsBriefings(NPCs, Briefings)
	
	--	ai
	
	createPlayer1()
	createPlayer2()
	createPlayer3()
	createPlayer4()
	createPlayer6()
	
	--	briefing

	createBriefingPrelude()
	
	--	quests
	
	AddDefeatEntity("HQ")
	
	createQuestPlayer2ToFriend()
	createQuestPlayer3ToFriend()
	createQuestPlayer6ToFriend()

end

-------------------------------------------------------------------------------------------------------------------------
	
end1stQuest = function()

	Report("end 1st quest")

end	

-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
--
--									1st Sub Quest:	talk with iron mayor
--
-------------------------------------------------------------------------------------------------------------------------

start1stSubQuest = function()

	Report("start 1st sub quest")

end

end1stSubQuest = function()

	Report("end 1st sub quest")

	createQuestIron()
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									2nd Sub Quest:	talked with sulfur mayor
--
-------------------------------------------------------------------------------------------------------------------------

start2ndSubQuest = function()

	Report("start 2nd sub quest")

end

end2ndSubQuest = function()

	Report("end 2nd sub quest")

	createQuestSulfur()
	
end

-------------------------------------------------------------------------------------------------------------------------
--
--									GameCallback_NPCInteraction
--
-------------------------------------------------------------------------------------------------------------------------
	
GameCallback_NPCInteraction = function(_heroId,_npcId)

	MapLocal_npcCheck(_heroId,_npcId)
end