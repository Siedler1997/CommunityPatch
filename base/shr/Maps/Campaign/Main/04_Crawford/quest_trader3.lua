
-- Trader3

createQuestTrader3 = function()

	InitNPCLookAt("Trader3")

	briefingTrader3 = {}	
	
	local page = 1
    
		briefingTrader3[page] 			= 	{}
		briefingTrader3[page].title		= 	String.GenericKey("Merchant")
		briefingTrader3[page].text		=	String.Key("briefingTrader3.text")
		briefingTrader3[page].position	=	GetPosition("Trader3")
		briefingTrader3[page].dialogCamera 	= 	true
	
end
	
	
	
	
	
destroyQuestTrader3 = function()

	DisableNpcMarker("Trader3")

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
						String.MainKey.."Trader3_Tribute1", 
						ResourceType.Stone, 
						500 )

	Job1.Resources 	= { gold = 400 }

	Job1.Callback 	= TributeTrader3Paid1

	SetupTributePaid(Job1)

end




TributeTrader3Paid1 = function()
	if CP_Difficulty < 2 then
		local Job1 = {}
	
		Job1.Tribute = uniqueTributeCounter
	
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							Job1.Tribute,
							0,
							0,
							String.MainKey.."Trader3_Tribute2", 
							ResourceType.Stone, 
							500 )

		Job1.Resources 	= { gold = 300 }

		Job1.Callback 	= TributeTrader3Paid2

		SetupTributePaid(Job1)
	end

	return true
end




TributeTrader3Paid2 = function()
	
	return true
	
end
	
