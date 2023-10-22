-------------------------------------------------------------------------------------------------------------------------
-- kill pirates 1
-------------------------------------------------------------------------------------------------------------------------
start1stQuest = function()

	Report("start 1st quest")
	
	CreateBriefingPrelude()

	createArmySouthernAssault()
	createArmySpawn()
	createArmyDario()
	
	createArmyDefend()

	notinbase = 1

	CreateQuestDefeat()
	CreateQuestKillPirates1()
	
end
end1stQuest = function()
	
	Report("end 1st quest")
	
	start1stQuestSubChapterOne()
	
end
-------------------------------------------------------------------------------------------------------------------------
-- Talk to bandits1 npc
-------------------------------------------------------------------------------------------------------------------------
function start1stQuestSubChapterOne()

	CreateNPCBandits1()

end
function end1stQuestSubChapterOne()

	local	pos = GetPosition("pirateleader")
	Leader = Tools.CreateGroup(8, Entities.CU_VeteranLieutenant, 0, pos.X, pos.Y, 180)

	SetEntityName(Leader, "pirateLeaderNpc")

	start2ndQuest()

end

-------------------------------------------------------------------------------------------------------------------------
-- Talk to pirate leader npc
-------------------------------------------------------------------------------------------------------------------------
start2ndQuest = function()

	CreateNPCPirateLeader()				

	Report("start 2nd quest")

end
-------------------------------------------------------------------------------------------------------------------------
end2ndQuest = function()	

	Report("end 2nd quest")

	ResolveBriefing(briefingBandits1ShowPirateLeader)
	
	start3rdQuest()

end



-------------------------------------------------------------------------------------------------------------------------
-- walk through first cave
-------------------------------------------------------------------------------------------------------------------------
start3rdQuest = function()

	Report("start 3rd quest")

	CreateQuestTeleport1()

end
end3rdQuest = function()	

	Report("end 3rd quest")

	if briefingBandits2ShowCave ~= nil then
		ResolveBriefing(briefingBandits2ShowCave)
	end
	if goldPaid == 1 then
		ResolveBriefing(PirateLeaderBriefingShowCave1)
	end
	
	start4thQuest()

end

-------------------------------------------------------------------------------------------------------------------------
-- kill pirates 2
-------------------------------------------------------------------------------------------------------------------------
start4thQuest = function()

	CreateBriefingCave2()
				
	CreateQuestKillPirates2()
				
	Report("start 4th quest")

	end
-------------------------------------------------------------------------------------------------------------------------
end4thQuest = function()	

	Report("end 4th quest")

	start4thQuestSubChapterHalf()

end
-------------------------------------------------------------------------------------------------------------------------
-- npc 2
-------------------------------------------------------------------------------------------------------------------------
function start4thQuestSubChapterHalf()

	CreateNPC2()

end
function end4thQuestSubChapterHalf()

	createArmyHelp()

	start4thQuestSubChapterOne()

end
-------------------------------------------------------------------------------------------------------------------------
-- kill pirates 3
-------------------------------------------------------------------------------------------------------------------------
function start4thQuestSubChapterOne()

	CreateQuestKillPirates3()

end
function end4thQuestSubChapterOne()

	start4thQuestSubChapterOneHalf()

end
-------------------------------------------------------------------------------------------------------------------------
-- npc 3
-------------------------------------------------------------------------------------------------------------------------
function start4thQuestSubChapterOneHalf()

	CreateNPC3()

end
function end4thQuestSubChapterOneHalf()

	createArmyDario1()

	start4thQuestSubChapterTwo()

end
-------------------------------------------------------------------------------------------------------------------------
-- walk through second cave
-------------------------------------------------------------------------------------------------------------------------
function start4thQuestSubChapterTwo()

	CreateQuestTeleport2()

end
function end4thQuestSubChapterTwo()

	notinbase = 0

	start5thQuest()

end
-------------------------------------------------------------------------------------------------------------------------
-- Rescue salim, destroy spawnpoint a
-------------------------------------------------------------------------------------------------------------------------
start5thQuest = function()
				
	Report("start 5th quest")

	createBriefingQ2()

	CreateNPCErec()

	CreateQuestRescueSalim()

end
-------------------------------------------------------------------------------------------------------------------------
end5thQuest = function()	

	Report("end 5th quest")

	ResolveBriefing(briefingQ2Quest)

	DestroyNPCErec()
	
	start6thQuest()

end

-------------------------------------------------------------------------------------------------------------------------
-- Talk to erec
-------------------------------------------------------------------------------------------------------------------------
start6thQuest = function()
				
	Report("start 6th quest")

	CreateBriefingSalimNotFound()

	CreateNPCErecAfterSalim()	

end
-------------------------------------------------------------------------------------------------------------------------
end6thQuest = function()	

	Report("end 6th quest")

	ChangePlayer("erec", 1)
	CreateChestOpener("erec")

	start6thQuestSubChapterOne()

end

-------------------------------------------------------------------------------------------------------------------------
-- talk to leo
-------------------------------------------------------------------------------------------------------------------------
function start6thQuestSubChapterOne()

	CreateNPCLeo()

end
function end6thQuestSubChapterOne()

	ResolveBriefing(erec2afterShowLeo)

	start6thQuestSubChapterTwo()

end
-------------------------------------------------------------------------------------------------------------------------
-- build mines
-------------------------------------------------------------------------------------------------------------------------
function start6thQuestSubChapterTwo()

	createQuestBuildMines()

end
function end6thQuestSubChapterTwo()

	ResolveBriefing(briefingLeoShowMinesQuest)
	ResolveBriefing(briefingLeoQuest)

	start6thQuestSubChapterThree()

end
-------------------------------------------------------------------------------------------------------------------------
-- leo again
-------------------------------------------------------------------------------------------------------------------------
function start6thQuestSubChapterThree()

	CreateBriefingMinesBuild()

	CreateNPCLeo2()

end
function end6thQuestSubChapterThree()

	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("stoneblock2").X, GetPosition("stoneblock2").Y,0)		--EXPLODE
	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("stoneblock3").X, GetPosition("stoneblock3").Y,0)		--EXPLODE
	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition("stoneblock4").X, GetPosition("stoneblock4").Y,0)		--EXPLODE

	DestroyEntity("stoneblock2")
	DestroyEntity("stoneblock3")
	DestroyEntity("stoneblock4")

	start7thQuest()

end



-------------------------------------------------------------------------------------------------------------------------
-- Free salim
-------------------------------------------------------------------------------------------------------------------------
start7thQuest = function()
				
	Report("start 7th quest")

	CreateQuestRescueSalim2()
	
end
-------------------------------------------------------------------------------------------------------------------------
end7thQuest = function()	

	Report("end 7th quest")

	local position 	= GetPosition("construct2")
	CreateEntity(1, Entities.PU_Hero3, position, "Salim")
	CreateChestOpener("Salim")
	
	Logic.SetTechnologyState(gvMission.PlayerID, Technologies.B_Foundry, 3)

	DestroyEntity("stoneblock5")
	DestroyEntity("stoneblock6")

	ResolveBriefing(briefingLeo2Quest)

	start8thQuest()

end

-------------------------------------------------------------------------------------------------------------------------
-- Destroy attacker
-------------------------------------------------------------------------------------------------------------------------
start8thQuest = function()

	Report("start 8th quest")
	
	createBriefingSalim()

	CreateQuestDestroyAttackers()

end
-------------------------------------------------------------------------------------------------------------------------
end8thQuest = function()	

	Report("end 8th quest")

	ResolveBriefing(BriefingSalimQuest)

	ChangePlayer("tower1",1)
	ChangePlayer("plant1",1)
	ChangePlayer("plant2",1)
	ChangePlayer("plant3",1)

	MakeInvulnerable("tower1")
	MakeInvulnerable("plant1")

	start9thQuest()

end

-------------------------------------------------------------------------------------------------------------------------
-- Destroy main enemy
-------------------------------------------------------------------------------------------------------------------------
function start9thQuest()

	createBriefingTower()

	CreateQuestVictory()

end
function end9thQuest()

	ResolveBriefing(briefingTowerQuest)

	Victory()

end

---------------------
TeleportAliveTroops = function(_cave,_cave1)

		if IsAlive("support1_1") then 

		SetPosition("support1_1", GetPosition(_cave))

		Move("support1_1",_cave1)
		
		end

		if IsAlive("support2_1") then 

		SetPosition("support2_1", GetPosition(_cave))

		Move("support2_1",_cave1)
		
		end
		
		if IsAlive("support3_1") then 

		SetPosition("support3_1", GetPosition(_cave))

		Move("support3_1",_cave1)
		
		end

		if IsAlive("support4_1") then 

		SetPosition("support4_1", GetPosition(_cave))
		
		Move("support4_1",_cave1)		
		
		end

		if IsAlive("support5_1") then 

		SetPosition("support5_1", GetPosition(_cave))

		Move("support5_1",_cave1)		
		
		end
		
	
		if IsAlive("support6_1") then 

		SetPosition("support6_1", GetPosition(_cave))

		Move("support6_1",_cave1)
		
		end

		if IsAlive("support7_1") then 

		SetPosition("support7_1", GetPosition(_cave))

		Move("support7_1",_cave1)
		
		end


		
		if IsAlive("pirateLeaderNpc") then 

		SetPosition("pirateLeaderNpc", GetPosition(_cave))

		Move("pirateLeaderNpc",_cave1)
		
		end

	end