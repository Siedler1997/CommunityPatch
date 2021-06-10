
createQuestMerchant = function()

	InitNPCLookAt("Merchant")

	end

destroyQuestMerchant = function()

	DisableNpcMarker("Merchant")

	local Job1 = {}
	
	Job1.Tribute = 001

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."tribute_Merchant1", 
						ResourceType.Wood, 
						100 )

	Job1.Resources 	= { gold = 200 }

	Job1.Callback 	= TributePaid1

	SetupTributePaid(Job1)

	end




TributePaid1 = function()
	if CP_Difficulty < 2 then
		-- TF>
		local Job2 = {}
	
		Job2.Tribute = 002

		Logic.AddTribute(	GetHumanPlayer(), 
							Job2.Tribute,
							0,
							0,
							String.MainKey.."tribute_Merchant2", 
							ResourceType.Iron, 
							200 )

		Job2.Resources 	= { gold = 400 }

		Job2.Callback 	= TributePaid2

		SetupTributePaid(Job2)
		--<
	end

	return true
end



	
TributePaid2 = function()
	
	return true
	
	end	