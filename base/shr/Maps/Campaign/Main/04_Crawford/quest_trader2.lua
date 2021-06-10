
-- Trader2

createQuestTrader2 = function()

	InitNPCLookAt("Trader2")

	briefingTrader2 = {}	
	
	local page = 1
    
		briefingTrader2[page] 			= 	{}
		briefingTrader2[page].title		= 	String.GenericKey("Merchant")
		briefingTrader2[page].text		=	String.Key("briefingTrader2.text")
		briefingTrader2[page].position	=	GetPosition("Trader2")
--		briefingTrader2[page].dialogCamera 	= 	true
	
end
	
	
	
	
	
destroyQuestTrader2 = function()

	DisableNpcMarker("Trader2")

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
						String.MainKey.."Trader2_Tribute1", 
						ResourceType.Wood, 
						250 )

	Job1.Resources 	= { gold = 300 }

	Job1.Callback 	= TributeTrader2Paid1

	SetupTributePaid(Job1)

end




TributeTrader2Paid1 = function()
	if CP_Difficulty < 2 then
		local Job1 = {}
	
		Job1.Tribute = uniqueTributeCounter
	
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							Job1.Tribute,
							0,
							0,
							String.MainKey.."Trader2_Tribute2", 
							ResourceType.Wood, 
							400 )

		Job1.Resources 	= { gold = 300 }

		Job1.Callback 	= TributeTrader2Paid2

		SetupTributePaid(Job1)
	end

	return true
end




TributeTrader2Paid2 = function()
	
	return true
	
end
	
