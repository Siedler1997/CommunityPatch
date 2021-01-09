-------Heroes ----

setupTrolls = function ()
    local soldiers = 6
    local experience = 0

    if CP_Difficulty == 1 then
        soldiers = soldiers + 2
        experience = experience + 3
    end

	local pos = GetPosition("trollsb2")
    trolls1 = AI.Entity_CreateFormation(3,Entities.PU_LeaderSword3,0,soldiers,pos.X,pos.Y,0,0,experience,0)
    SetEntityName(trolls1, "trolls2") 

	local pos = GetPosition("trollsb")
    trolls2 = AI.Entity_CreateFormation(3,Entities.PU_LeaderSword3,0,soldiers,pos.X,pos.Y,0,0,experience,0)
    SetEntityName(trolls2, "trolls")
end


