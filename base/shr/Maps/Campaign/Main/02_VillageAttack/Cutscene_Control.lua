----------------------------------
-- CUTSCENES
--
-- Map: 	Village Attack
-- Author: 	Thomas Friedmann
-- Status: 	finished
----------------------------------


function Cheat_Intro_Start()
--	startQuestDefendCastle()

    StartCutscene("Intro")
end


function Cheat_Mother_Dies_Start()
    StartCutscene("Mother_Dies")
end

function Cheat_MissionComplete_Start()
    StartCutscene("MissionComplete")
end





-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------

Cutscene1 = {}
Cutscene2 = {}

Cutscene1.dummy1 = 0
Cutscene1.dummy2 = 0






-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Intro_Init()

	Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	Cutscene_Intro_Init()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Finished()
	Cutscene_Intro_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
	Cutscene_Intro_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Text1()
	SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text1")
end


function Cutscene_Intro_Text2()
	SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text2")
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_End()

	-- Damage and set buildings in village not usable
	if IsAlive("castle") then
		Logic.SetEntitySelectableFlag(Logic.GetEntityIDByName("castle"), 0)
		Logic.SetEntityUserControlFlag(Logic.GetEntityIDByName("castle"), 0)
	end

	for i=0,4,1 do

		if IsAlive("House"..i) then
	
			local house = Logic.GetEntityIDByName("House"..i)
	
			Logic.SetEntitySelectableFlag(house, 0)
			Logic.SetEntityUserControlFlag(house, 0)
	
			Logic.HurtEntity(house, (Logic.GetEntityHealth(house)*0.6) )
	
		end

		if IsAlive("Destroy"..i) then
	
			local house = Logic.GetEntityIDByName("Destroy"..i)
	
			Logic.SetEntitySelectableFlag(house, 0)
			Logic.SetEntityUserControlFlag(house, 0)
	
			Logic.HurtEntity(house, (Logic.GetEntityHealth(house)*0.7) )
	
		end

		if IsAlive("Settler"..i) then

			local settler = Logic.GetEntityIDByName("Settler"..i)
	
			Logic.SetEntitySelectableFlag(settler, 0)
			Logic.SetEntityUserControlFlag(settler, 0)

		end

		if IsAlive("Settler"..(i+4)) then

			local settler = Logic.GetEntityIDByName("Settler"..(i+4))
	
			Logic.SetEntitySelectableFlag(settler, 0)
			Logic.SetEntityUserControlFlag(settler, 0)

		end


	end

	--	set burning village
	SetHealth("castle",80)
	SetHealth("village0",40)


	Mission_EndMovie()	


end




-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_CreateArmySiege()
	-- create siege army
		local troopDescription = {
		
			maxNumberOfSoldiers	= 4,
			minNumberOfSoldiers	= 0,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = Entities.CU_BlackKnight_LeaderMace1
--		troopDescription.leaderType = Entities.PU_LeaderSword1
	
		EnlargeArmy(armySiege,troopDescription)
		EnlargeArmy(armySiege,troopDescription)

		StartJob("ControlArmySiege")
		
		
	-- Move defender
		for i=0,4,1 do

			if IsAlive("defender"..i) then

				local defender = Logic.GetEntityIDByName("defender"..i)

				Logic.SetEntitySelectableFlag("defender"..i, 0)
				Logic.SetEntityUserControlFlag("defender"..i, 0)

				Logic.SettlerDefend(defender)

				Move("defender"..i,"defenderTarget"..i)

			end
		end

end


-------------------------------------------------------------------------------------------------------------------------






-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "MotherDies"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Mother_Dies_Init()

	-- set dummys 
--		Cutscene1.dummy1 = Logic.CreateEntity(Entities.XD_ScriptEntity, 12856, 25386, 90, 0)
--		Cutscene1.dummy2 = Logic.CreateEntity(Entities.XD_ScriptEntity, 12798, 24895, 270, 0)
--	
--	Cutscene1.Target1 = Cutscene1.dummy1 
--	Cutscene1.Target2 = Cutscene1.dummy2 
--
--	
--	Cutscene1.StartX1, Cutscene1.StartY1 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("siege"))
--	
--	-- set target coordinates
--	Cutscene1.Target1x, Cutscene1.Target1y 	= Logic.GetEntityPosition(Cutscene1.Target1)
--	Cutscene1.Target2x, Cutscene1.Target2y 	= Logic.GetEntityPosition(Cutscene1.Target2)
--
--
--	-- Create Kerberos and Dario
--	Cutscene1.ComingUnit1 = Logic.CreateEntity(Entities.CU_BlackKnight,	Cutscene1.StartX1, 	Cutscene1.StartY1, 180, 1)
--	Cutscene1.TargetUnit1 = Logic.CreateEntity(Entities.PU_Hero1a, 		Cutscene1.Target1x, Cutscene1.Target1y, 180, 1)
--
--	-- Approach dialog partner
--	Logic.MoveSettler(Cutscene1.ComingUnit1, Cutscene1.Target2x, Cutscene1.Target2y) 
--
--	-- look at dialog partner
--	Logic.EntityLookAt(Cutscene1.ComingUnit1, Cutscene1.TargetUnit1)
--	Logic.EntityLookAt(Cutscene1.TargetUnit1, Cutscene1.ComingUnit1)

end


-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Mother_Dies_Start()
	Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Mother_Dies_Finished()
	Cutscene_Mother_Dies_End()
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Mother_Dies_Cancel()
	Cutscene_Mother_Dies_End()
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Mother_Dies_SetView2()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Mother_Dies_End()
	Logic.StopPrecipitation()
	
	Mission_EndMovie()	

	-- Destroy created entities
--	Logic.DestroyEntity(Cutscene1.ComingUnit1)
--	Logic.DestroyEntity(Cutscene1.TargetUnit1)
--	Logic.DestroyEntity(Cutscene1.dummy1)
--	Logic.DestroyEntity(Cutscene1.dummy2)
end







-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_MissionComplete_Init()

	Logic.DestroyEntity(Logic.GetEntityIDByName("Erec"))
	Logic.DestroyEntity(Logic.GetEntityIDByName("Dario"))

       CreateEntity(1, Entities.PU_Hero4, GetPosition("VictoryErec"), "Erec" )
       CreateEntity(1, Entities.PU_Hero1a, GetPosition("VictoryDario"), "Dario" )
       
       LookAt("Dario","Erec")
       LookAt("Erec","Dario")
end

function Cutscene_MissionComplete_Move()

	Move("Erec", "VictoryErecMove")
	Move("Dario", "VictoryDarioMove")
end
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Start()
	Mission_InitMovie()    
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Finished()

	Logic.DestroyEntity(Logic.GetEntityIDByName("Erec"))
	Logic.DestroyEntity(Logic.GetEntityIDByName("Dario"))

	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Cancel()

	Logic.DestroyEntity(Logic.GetEntityIDByName("Erec"))
	Logic.DestroyEntity(Logic.GetEntityIDByName("Dario"))
	
	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Text1()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text1")
	
end


function Cutscene_MissionComplete_Text2()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text2")
	
end

function Cutscene_MissionComplete_Text3()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text3")
	
end


function Cutscene_MissionComplete_Text4()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text4")
	
end

function Cutscene_MissionComplete_Text5()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text5")
	
end

function Cutscene_MissionComplete_Text6()
	SpokenCinematicText(String.MainKey.."Cutscene_Extro_Text6")
	
end












--*********************************************************************************************
function Mission_InitMovie()
	
    Display.SetFogStartAndEnd (5000, 15000)
    Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 

	Logic.StopPrecipitation()
	Interface_SetCinematicMode(1)
 
end


function Mission_EndMovie()
	-- disable Cutscene mode

	Interface_SetCinematicMode(0)
	Display.SetFarClipPlaneMinAndMax(0, 0) 

	Logic.StopPrecipitation()

	CutsceneDone()

end
