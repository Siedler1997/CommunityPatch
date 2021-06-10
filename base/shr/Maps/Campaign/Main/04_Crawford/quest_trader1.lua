
-- Trader1 

createQuestTrader1 = function()

	InitNPCLookAt("Trader1")

	briefingTrader1 = {}	
	
	local page = 1
    
		briefingTrader1[page] 			= 	{}
		briefingTrader1[page].title		= 	String.GenericKey("Merchant")
		briefingTrader1[page].text		=	String.Key("briefingTrader1.text" )
		briefingTrader1[page].position	=	GetPosition("Trader1")
--		briefingTrader1[page].dialogCamera 	= 	true
	
end
	
	
	
	
	
destroyQuestTrader1 = function()

	DisableNpcMarker("Trader1")

	local Job1 = {}
	
	if 	uniqueTributeCounter == nil then 
		uniqueTributeCounter = 1
	end

	Job1.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."Trader1_Tribute1", 
						ResourceType.Clay, 
						300 )

	Job1.Resources 	= { gold = 500 }

	Job1.Callback 	= TributeTrader1Paid1

	SetupTributePaid(Job1)

end




TributeTrader1Paid1 = function()
	if CP_Difficulty < 2 then
		local Job1 = {}
	
		Job1.Tribute = uniqueTributeCounter
	
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							Job1.Tribute,
							0,
							0,
							String.MainKey.."Trader1_Tribute2", 
							ResourceType.Clay, 
							400 )

		Job1.Resources 	= { gold = 400 }

		Job1.Callback 	= TributeTrader1Paid2

		SetupTributePaid(Job1)
	end

	return true
end




TributeTrader1Paid2 = function()
	
	return true
	
end
	
