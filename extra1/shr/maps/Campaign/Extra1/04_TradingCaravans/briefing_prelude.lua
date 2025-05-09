---------------------------------------------------------------------------------------------
-- Briefing "Prelude"
function CreateBriefingPrelude()
	Explore.Show("Explore_Salim","Salim",3000)

	PreludeBriefing = {}
	PreludeBriefing.finished = PreludeBriefingFinished

	page = 0
	
	--	page #1
	
		-- next page
		page = page + 1

		-- create table
		PreludeBriefing[page] 				= 	{}

		-- text
		
		PreludeBriefing[page].title					= String.GenericKey("Salim")
		PreludeBriefing[page].text					=	String.Key("PreludeBriefing[1].text")
		PreludeBriefing[page].position 			= GetPosition("Salim")
		PreludeBriefing[page].dialogCamera	=	true
	
	--	page #2
	
		-- next page
		page = page + 1


		-- create table
		PreludeBriefing[page] 				= 	{}
		-- text

		PreludeBriefing[page].title					= String.GenericKey("Salim")
		PreludeBriefing[page].text					=	String.Key("PreludeBriefing[2].text")
		PreludeBriefing[page].position 			= GetPosition("Salim")
		PreludeBriefing[page].dialogCamera	=	true
	
	--	page #3
	
		-- next page
		page = page + 1
		
				-- create table
		PreludeBriefing[page] 				= 	{}

		-- text
		
		PreludeBriefing[page].title					= String.GenericKey("Salim")
		PreludeBriefing[page].text					=	String.Key("PreludeBriefing[3].text")
		PreludeBriefing[page].position 			= GetPosition("Salim")
		PreludeBriefing[page].dialogCamera	=	true

	--	page #4
	
		-- next page
		page = page + 1
		
				-- create table
		PreludeBriefing[page] 				= 	{}

		-- text
		
		PreludeBriefing[page].title					= String.GenericKey("Salim")
		PreludeBriefing[page].text					=	String.Key("PreludeBriefing[4].text")
		PreludeBriefing[page].position 			= GetPosition("Salim")
		PreludeBriefing[page].dialogCamera	=	true
                                            
		                                   	
	--	page #5                         	
	                                    	
		-- next page
		page = page + 1                 	
                             
		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.GenericKey("Salim")
		PreludeBriefing[page].text			=	String.Key("PreludeBriefing[5].text")
		PreludeBriefing[page].position 	= GetPosition("Caravan_WP1")
		PreludeBriefing[page].explore		=	1500
		PreludeBriefing[page].pointer   = GetPosition("Caravan_WP1")
		PreludeBriefing[page].marker		=	STATIC_MARKER
		PreludeBriefingShowCaravanWP1		=	PreludeBriefing[page]

	--	page #6
			-- next page
		page = page + 1                 	
                             
		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.GenericKey("Salim")
		PreludeBriefing[page].text			=	String.Key("PreludeBriefing[6].text")
		PreludeBriefing[page].position 	= GetPosition("Caravan_WP2")
		PreludeBriefing[page].explore		=	1500
		PreludeBriefing[page].pointer   = GetPosition("Caravan_WP2")
		PreludeBriefing[page].marker		=	STATIC_MARKER
		PreludeBriefingShowCaravanWP2		=	PreludeBriefing[page]
	
	--	page #7
			-- next page
		page = page + 1                 	
                             
		PreludeBriefing[page] 					= {}
		PreludeBriefing[page].title			= String.GenericKey("Salim")
		PreludeBriefing[page].text			=	String.Key("PreludeBriefing[7].text")
		PreludeBriefing[page].position 	= GetPosition("Caravan_WP3")
		PreludeBriefing[page].explore		=	1500
		PreludeBriefing[page].pointer   = GetPosition("Caravan_WP3")
		PreludeBriefing[page].marker		=	STATIC_MARKER
		PreludeBriefingShowCaravanWP3		=	PreludeBriefing[page]
	
	--	page #8
			-- next page
	
		page = page + 1
		
		PreludeBriefing[page] 						= {}
		PreludeBriefing[page].title				= String.GenericKey("MissionObjectives")
		PreludeBriefing[page].text				=	String.Key("PreludeBriefing[8].text")

		PreludeBriefing[page].position 		= GetPosition("Dario")

		PreludeBriefing[page].quest					=	{}
		PreludeBriefing[page].quest.id			=	1
		PreludeBriefing[page].quest.type		=	MAINQUEST_OPEN
		PreludeBriefing[page].quest.title		=	String.Key("PreludeBriefing[1].quest.title")
		PreludeBriefing[page].quest.text		=	String.Key("PreludeBriefing[1].quest.text")

		PreludeBriefingQuestTradeRoute 			=	PreludeBriefing[page]
	            		
	--	go!
		StartBriefing(PreludeBriefing)	
end	

function PreludeBriefingFinished()
	Explore.Hide("Explore_Salim")
end