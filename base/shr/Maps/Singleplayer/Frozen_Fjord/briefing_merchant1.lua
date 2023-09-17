
createBriefingMerchant1 = function()

	briefingMerchant1 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMerchant1[page] 			= 	{}
		briefingMerchant1[page].title		= 	String.Key("briefingMerchant1[1].title")
		briefingMerchant1[page].position 	= 	GetPosition("merchant1")
		briefingMerchant1[page].text		=	String.Key("briefingMerchant1[1].text")
		briefingMerchant1[page].dialogCamera 	= 	true

		page_Merchant1 = page

	--	page
	
		page = page +1
	
		briefingMerchant1[page] 			= 	{}
		briefingMerchant1[page].title		= 	String.Key("briefingMerchant1[1].title")
		briefingMerchant1[page].position 	= 	GetPosition("player3")
		briefingMerchant1[page].text		=	String.Key("briefingMerchant1[2].text")
		briefingMerchant1[page].explore		= 	2000

		page_Merchant1 = page

	--	page
	
		page = page +1
	
		briefingMerchant1[page] 			= 	{}
		briefingMerchant1[page].title		= 	String.Key("briefingMerchant1[1].title")
		briefingMerchant1[page].position 	= 	GetPosition("merchant1")
		briefingMerchant1[page].text		=	String.Key("briefingMerchant1[3].text")
		briefingMerchant1[page].dialogCamera 	= 	true

	-- go!
	
		StartBriefing(briefingMerchant1)


	--	create job

		merchant1TributePaid = false

		local job = {}
	
		job.Tribute = uniqueTributeCount
		uniqueTributeCount = uniqueTributeCount + 1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute1"),
							ResourceType.Gold, 
							1000 )
	
		job.Callback 	= TributePaidMerchant1
		
		SetupTributePaid(job)
		
	end




TributePaidMerchant1 = function()
	
	merchant1TributePaid = true
	
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly)
	Logic.SetDiplomacyState( 2, 3, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 6, Diplomacy.Hostile )
	Logic.SetDiplomacyState( 2, 8, Diplomacy.Hostile )

	MoveAndVanish("merchant1", "merchant1_target")
	
	Logic.SetShareExplorationWithPlayerFlag(1, 3, 1)
	
end

