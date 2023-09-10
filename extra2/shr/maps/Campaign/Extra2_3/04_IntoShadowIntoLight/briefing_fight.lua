function createBriefingFight()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(3, true)
		ResearchAllMilitaryTechsAddOn(4, true)
		ResearchAllMilitaryTechsAddOn(5, true)
		ResearchAllMilitaryTechsAddOn(6, true)
		ResearchAllMilitaryTechsAddOn(7, true)
	end

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral )

	dario = CreateEntity(3,Entities.PU_Hero1c,GetPosition("dario_spawn"),"dario")
	erec = CreateEntity(3,Entities.PU_Hero4,GetPosition("erec_spawn"),"erec")
	LookAt("dario","camera")
	LookAt("erec","camera")
	
	if CP_Difficulty > 0 then
		helias = CreateEntity(3,Entities.PU_Hero6,GetPosition("helias_spawn"),"helias")	
		LookAt("helias","camera")
	end

	Explore.Show("Dario","dario", 1500)

	local p1= GetPosition("ArmyDario")
	local p2= GetPosition("sup1")
	local p3= GetPosition("sup2")
	local p4= GetPosition("sup3")
	local p5= GetPosition("sup4")
	local p6= GetPosition("sup5")

	briefing_sup1 = Tools.CreateGroup(3, Entities.PU_LeaderSword4, 8, p1.X, p1.Y, -90)
	briefing_sup2 = Tools.CreateGroup(3, Entities.PU_LeaderPoleArm4, 8, p2.X, p2.Y, -90)
	briefing_sup3 = Tools.CreateGroup(3, Entities.PU_LeaderBow4, 8, p3.X, p3.Y, -90)
	briefing_sup4 = Tools.CreateGroup(3, Entities.PU_LeaderBow4, 8, p4.X, p4.Y, -90)
	briefing_sup5 = Tools.CreateGroup(3, Entities.PU_LeaderHeavyCavalry2, 8, p5.X, p5.Y, -90)
	briefing_sup6 = Tools.CreateGroup(3, Entities.PU_LeaderHeavyCavalry2, 8, p6.X, p6.Y, -90)

	SetEntityName(briefing_sup1, "briefing_sup1")
	SetEntityName(briefing_sup2, "briefing_sup2")
	SetEntityName(briefing_sup3, "briefing_sup3")
	SetEntityName(briefing_sup4, "briefing_sup4")
	SetEntityName(briefing_sup5, "briefing_sup5")
	SetEntityName(briefing_sup6, "briefing_sup6")
	
	BriefingFight = 	{}


		BriefingFight.finished = BriefingFightFinished
			
		local page = 0

		page = page +1
	
		BriefingFight[page] 				= 	{}
		BriefingFight[page].title			= 	String.GenericKey("Dario")
		BriefingFight[page].position 		= 	GetPosition("dario_spawn")	
		BriefingFight[page].text			=	String.Key("dario.stop")
		BriefingFight[page].dialogCamera 		= 	true

		page = page + 1

		BriefingFight[page] 				= 	{}
		BriefingFight[page].position 			= 	GetPosition("dario_spawn")
		BriefingFight[page].dialogCamera 		= 	true
		BriefingFight[page].mc                		=	{}
        	BriefingFight[page].mc.title			= 	String.GenericKey("Dario")
		BriefingFight[page].mc.text			=	String.Key("dario.mctext")
		BriefingFight[page].mc.firstText		=	String.Key("dario.fight")
		BriefingFight[page].mc.secondText		=	String.Key("dario.nofight")
		BriefingFight[page].mc.firstSelected	=	7
		BriefingFight[page].mc.secondSelected		=	5

		DarioMCPage 				= 	BriefingFight[page]
		
		page = 5

		BriefingFight[page] 				= 	{}
		BriefingFight[page].title			= 	String.Key("Erec")
		BriefingFight[page].position 			= 	GetPosition("dario")		
		BriefingFight[page].text			=	String.Key("erec.fight")
		BriefingFight[page].dialogCamera 		= 	true
		
		page = 7

		BriefingFight[page] 				= 	{}
		BriefingFight[page].title			= 	String.Key("Erec")
		BriefingFight[page].position 			= 	GetPosition("erec")		
		BriefingFight[page].text			=	String.Key("erec.attack")
		BriefingFight[page].dialogCamera 		= 	true


		StartBriefing(BriefingFight)

end


BriefingFightFinished = function()
	   if GetSelectedBriefingMCButton(DarioMCPage) == 1 then
		
			Explore.Hide("Dario")
			DestroyEntity(dario)

			for h=1,6,1 do
				--Attack("briefing_sup"..h,"my_castle")
				DestroyEntity("briefing_sup"..h)
			end

			--local PlayerID = GUI.GetPlayerID()
			--NumerOfLeaders = Logic.GetNumberOfLeader(PlayerID)
			--NumerOfLeaders = 9
			createDarioArmy()
			createDarioArmy1()
			createDarioArmy2()

			if CP_Difficulty > 0 then
				createDarioArmy3()
				createDarioArmyCavalry1()
				createDarioArmyCavalry2()
				if CP_Difficulty == 2 then
					createDarioArmyCavalry3()
				end
			end

			Logic.SetDiplomacyState( 1, 6, Diplomacy.Hostile )
			Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
			Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
			ChangePlayer("erec",6)
			--Attack("erec","my_castle")
			StartCountdown(20, erecAttack, false)
			StartSimpleJob("HeroicResistance")
	   else
			createVargErecBriefing()
	   end
end

function erecAttack()
	Attack("erec","my_castle")
	ErecOnTheMove=1
end

createVargErecBriefing = function()


	--local kerberos = Logic.GetEntityIDByName("kerberos")
	--SetHealth("kerberos",600)
	local varg = Logic.GetEntityIDByName("varg")
	SetHealth("varg",600)
	local erec = Logic.GetEntityIDByName("erec")
	SetHealth("erec",600)
	--SetPosition("kerberos",GetPosition("ker_pos"))
	SetPosition("erec",GetPosition("erec_pos"))
	SetPosition("varg",GetPosition("varg_pos"))

	local pos1 = GetPosition("troop_1")
	local pos2 = GetPosition("troop_2")
	local pos3 = GetPosition("troop_3")
	local pos4 = GetPosition("troop_4")
	local pos5 = GetPosition("troop_5")

	if CP_Difficulty == 0 then
		ker_sup1 = AI.Entity_CreateFormation(1, Entities.CU_Barbarian_LeaderClub2,0,8,pos3.X,pos3.Y,0,0,3,0)
		ker_sup2 = AI.Entity_CreateFormation(1, Entities.CU_BlackKnight_LeaderMace2,0,8,pos4.X,pos4.Y,0,0,3,0)
		ker_sup3 = AI.Entity_CreateFormation(1, Entities.CU_BanditLeaderSword2,0,8,pos5.X,pos5.Y,0,0,3,0)
	else
		ker_sup1 = AI.Entity_CreateFormation(1, Entities.CU_Barbarian_LeaderClub1,0,4,pos3.X,pos3.Y,0,0,3,0)
		ker_sup2 = AI.Entity_CreateFormation(1, Entities.CU_BlackKnight_LeaderMace1,0,4,pos4.X,pos4.Y,0,0,3,0)
		ker_sup3 = AI.Entity_CreateFormation(1, Entities.CU_BanditLeaderSword1,0,8,pos5.X,pos5.Y,0,0,3,0)
	end

	erec_sup1 = AI.Entity_CreateFormation(3, Entities.PU_LeaderSword4,0,8,pos1.X,pos1.Y,0,0,3,0)
	erec_sup2 = AI.Entity_CreateFormation(3, Entities.PU_LeaderPoleArm4,0,8,pos2.X,pos2.Y,0,0,3,0)

	LookAt("varg",erec_sup1)
	LookAt("erec",ker_sup1)
	LookAt(ker_sup1, "erec")
	LookAt(ker_sup2, "erec")
	LookAt(ker_sup3, "erec")
	LookAt(erec_sup1, "varg")
	LookAt(erec_sup2, "varg")

	VargErecBriefing = 	{}


		VargErecBriefing.finished = VargErecBriefingFinished
			
		local page = 0

		page = page +1
	
		VargErecBriefing[page] 				= 	{}
		VargErecBriefing[page].title			= 	String.Key("Varg")
		VargErecBriefing[page].position 		= 	GetPosition("varg_pos")	
		VargErecBriefing[page].text			=	String.Key("varg.dogs")
		VargErecBriefing[page].dialogCamera 		= 	true

		page = page +1
	
		VargErecBriefing[page] 				= 	{}
		VargErecBriefing[page].title			= 	String.GenericKey("Erec")
		VargErecBriefing[page].position 		= 	GetPosition("erec_pos")	
		VargErecBriefing[page].text			=	String.Key("erec.try")
		VargErecBriefing[page].dialogCamera 		= 	true

	StartBriefing(VargErecBriefing)

end


VargErecBriefingFinished = function()
	ChangePlayer("erec",3)
	Logic.SetDiplomacyState( 1, 2, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 1, 7, Diplomacy.Hostile )

	Attack("erec","varg")
	Attack("varg","erec")
	Attack(erec_sup1, "varg")
	Attack(erec_sup2, "varg")
	Attack(ker_sup1, "erec")
	Attack(ker_sup2, "erec")
	Attack(ker_sup3, "erec")

	StartSimpleJob("HeroicFight")

end