

------------------------------------------------------------------------------------------------------
---------------------------<< QUEST 2 STUFF >>--------------------------------------------------------


--*************[destroy mary prison]*****************************

Condition_FreeMary = function()

	return IsDead ("mary_prison")

end

Action_FreeMary = function()

	--local pos = GetPosition("prison")
	
	--CreateEntity(5, Entities.CU_Mary_de_Mortfichet, pos, "mary")
	ChangePlayer("mary", 5)
	StartJob("ProtectMary")
	mary = Logic.GetEntityIDByName("mary")

	NPCmary				=	{}
	NPCmary.name 			=	"mary"
	NPCmary.callback		=	createBriefingMary

	CreateNPC(NPCmary)

	return true

end