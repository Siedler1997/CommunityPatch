
createBriefingMerchant1 = function()

	briefingMerchant1 = 	{}	

	local page = 0

	--	page
	
		page = page +1
	
		briefingMerchant1[page] 			= 	{}
		briefingMerchant1[page].title		= 	String.Key("briefingMerchant1[1].title")
		briefingMerchant1[page].position 	= 	GetPosition("merchant1")
		briefingMerchant1[page].text		=	String.Key("briefingMerchant1[1].text")

		page_Merchant1 = page

		StartBriefing(briefingMerchant1)

	--	create job

		merchant1TributePaid = false

		local job = {}
	
		job.Tribute = 1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.Key("tribute1"),
							ResourceType.Gold, 
							6000 )
	
		job.Callback 	= TributePaidMerchant1
		
		SetupTributePaid(job)
		
	end


TributePaidMerchant1 = function()
	
	merchant1TributePaid = true
	
	Logic.SetDiplomacyState( 1, 4, Diplomacy.Friendly	)
	Logic.SetDiplomacyState( 4, 3, Diplomacy.Hostile	)
	Logic.SetDiplomacyState( 4, 2, Diplomacy.Hostile	)
	
	end

