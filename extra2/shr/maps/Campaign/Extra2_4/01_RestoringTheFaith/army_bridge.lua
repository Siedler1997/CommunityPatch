-------Heroes ----

setupTrolls = function ()
    local soldiers = 6

    if CP_Difficulty > 0 then
        soldiers = soldiers + 2
    end

	local pos = GetPosition("trollsb2")
    trolls1 = AI.Entity_CreateFormation(3,Entities.PU_LeaderSword3,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
    SetEntityName(trolls1, "trolls2") 

	local pos = GetPosition("trollsb")
    trolls2 = AI.Entity_CreateFormation(3,Entities.PU_LeaderSword3,0,soldiers,pos.X,pos.Y,0,0,CP_Difficulty,0)
    SetEntityName(trolls2, "trolls")
end


