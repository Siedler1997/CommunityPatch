---------------------------------------------------------------------------------------------
function createBriefingFarmer()

	briefingFarmer = {}
--	briefingFarmer.restoreCamera = true
	briefingFarmer.finished = briefingFarmerFinished

	local page = 0

	--	page #1

		page = page + 1

		briefingFarmer[page] 					= 	{}
		briefingFarmer[page].title				= 	String.Key("briefingFarmer[1].title")
		briefingFarmer[page].text				=	String.Key("briefingFarmer[1].text")
		briefingFarmer[page].position 			= 	GetPosition("farmer")
		briefingFarmer[page].explore			=	4000
		briefingFarmer[page].dialogCamera		=	true
		
	--	page #2
	
		-- next page
		page = page +1
	
		-- create table
		briefingFarmer[page] 					= 	{}
		
		-- text
		briefingFarmer[page].text				=	String.Key("briefingFarmer[2].text")

		briefingFarmer[page].position			=	GetPosition("mob6")
		briefingFarmer[page].explore			=	4000
		
	--	go!

		StartBriefing(briefingFarmer)

end

---------------------------------------------------------------------------------------------
function briefingFarmerFinished()
	if CP_Difficulty == 2 then
		ResearchAllMilitaryTechsAddOn(2, true)
		ResearchAllMilitaryTechsAddOn(6, true)
		ResearchAllMilitaryTechsAddOn(7, true)
	end

	local troopTypes = {
		Entities.PU_LeaderPoleArm1,
		Entities.PU_LeaderSword1,
		Entities.PU_LeaderPoleArm1,
		Entities.PU_LeaderBow1,
		Entities.PU_LeaderPoleArm1
	}
	
	-- create mobs
	for i=1,8 do
	
		local troopDescription	= {

			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 9,
			experiencePoints 	= GetRandom(0, 3),
			leaderType          = troopTypes[GetRandom(1, table.getn(troopTypes))],
			position            = GetPosition("mob"..i)
		}
	
    	local mob				= {}
    
		CreateTroop(mob,troopDescription)

	end
	
	Sound.Play2DSound(Sounds.LevyTaxes, 0,127)

end
