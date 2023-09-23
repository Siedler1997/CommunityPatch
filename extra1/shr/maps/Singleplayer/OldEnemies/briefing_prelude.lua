
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	local page = 0

	--	page - destroy castle 1
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player5")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].explore		=	1000
		briefingPrelude[page].marker		=	STATIC_MARKER

	--	page - destroy castle 2
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.Key("briefing")
		briefingPrelude[page].position 		= 	GetPosition("player2")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].explore		=	1000
		briefingPrelude[page].marker		=	STATIC_MARKER



	--	page - objectives
	
		page = page +1
	
		briefingPrelude[page] 			= 	{}
		briefingPrelude[page].title		= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 		= 	GetPosition("player1")
		briefingPrelude[page].text		=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].explore		=	BRIEFING_EXPLORATION_RANGE

		briefingPrelude[page].quest		=	{}
		briefingPrelude[page].quest.id		=	1
		briefingPrelude[page].quest.type	=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title	=	String.Key("briefingPrelude[3].quest.title")
		briefingPrelude[page].quest.text	=	String.Key("briefingPrelude[3].quest.text")

		page_prelude = page

		StartBriefing(briefingPrelude)
	
	end


----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


createBriefingMerchant1 = function()
            briefingMerchant1                            =          {}          
            briefingMerchant1.finished                   =          briefingMerchant1Finished

            local page = 0                            
            page = page +1                         

            briefingMerchant1[page]                      =          {}
            briefingMerchant1[page].text                 =          String.Key("merchant1.text")
            briefingMerchant1[page].position             =          GetPosition("merchant1")

            StartBriefing(briefingMerchant1)

            end

briefingMerchant1Finished = function()

 

            end



----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


createBriefingMerchant2 = function()

 

            briefingMerchant2                        = {}          
            briefingMerchant2.finished               = briefingMerchant2Finished

            local page = 0 
            page = page +1                         

                                                

            briefingMerchant2[page]                  =          {}
            --briefingMerchant2[page].title          =          String.Key("merchant2")
            briefingMerchant2[page].text             =          String.Key("merchant2.text")
            briefingMerchant2[page].position         =          GetPosition("merchant2")

            StartBriefing(briefingMerchant2)

            
            end

briefingMerchant2Finished = function()

 

            end


----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


createBriefingInfo1 = function()
            briefingInfo1                            =          {}          
            briefingInfo1.finished                   =          briefingInfo1Finished

            local page = 0                            
            page = page +1                         


            briefingInfo1[page]                      =          {}
            briefingInfo1[page].title                 =          String.Key("Info.title")
            briefingInfo1[page].text                 =          String.Key("Info1.text")
            briefingInfo1[page].position             =          GetPosition("Info1")

            StartBriefing(briefingInfo1)

            end

briefingInfo1Finished = function()

            end



----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

createBriefingInfo2 = function()

            briefingInfo2                            =          {}          
            briefingInfo2.finished                   =          briefingInfo2Finished

            local page = 0                            
            page = page +1                         

            briefingInfo2[page]                      =          {}
            briefingInfo2[page].title                 =          String.Key("Info.title")
            briefingInfo2[page].text                 =          String.Key("Info2.text")
            briefingInfo2[page].position             =          GetPosition("Info2")

            StartBriefing(briefingInfo2)

            end

briefingInfo2Finished = function()

            end



----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

createBriefingInfo3 = function()

            briefingInfo3                            =          {}          
            briefingInfo3.finished                   =          briefingInfo3Finished

            local page = 0                            
            page = page +1                         

            briefingInfo3[page]                      =          {}
            briefingInfo3[page].title                 =          String.Key("Info.title")
            briefingInfo3[page].text                 =          String.Key("Info3.text")
            briefingInfo3[page].position             =          GetPosition("Info3")

            StartBriefing(briefingInfo3)

            end

briefingInfo3Finished = function()

            end




----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

createBriefingInfo4 = function()

            briefingInfo4                            =          {}          
            briefingInfo4.finished                   =          briefingInfo4Finished

            local page = 0                            
            page = page +1                         

            briefingInfo4[page]                      =          {}
            briefingInfo4[page].title                 =          String.Key("Info.title")
            briefingInfo4[page].text                 =          String.Key("Info4.text")
            briefingInfo4[page].position             =          GetPosition("Info4")

            StartBriefing(briefingInfo4)

            end

briefingInfo4Finished = function()

            end





----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


createBriefingLeonardo = function()

            briefingLeonardo                            =          {}          
            briefingLeonardo.finished                   =          briefingLeonardoFinished

            local page = 0                            
            page = page +1                         

            briefingLeonardo[page]                      =          {}
            briefingLeonardo[page].title                 =          String.Key("Leonardo.title")
            briefingLeonardo[page].text                 =          String.Key("Leonardo.text")
            briefingLeonardo[page].position             =          GetPosition("Leonardo")

            StartBriefing(briefingLeonardo)

            end

briefingLeonardoFinished = function()

            end

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

createBriefingKel = function()

            briefingKel                            =          {}          
            briefingKel.finished                   =          briefingKelFinished

            local page = 0                            
            page = page +1                         

            briefingKel[page]                      =          {}
            briefingKel[page].title                 =          String.Key("Info.title")
            briefingKel[page].text                 =          String.Key("Kel.text")
            briefingKel[page].position             =          GetPosition("Kel")

            StartBriefing(briefingKel)

            end

briefingKelFinished = function()

            end
