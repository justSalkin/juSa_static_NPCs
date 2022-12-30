RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter",
    StartNPCs(),
    StartPED()
end)

function StartNPSs() -- Loading NPCs
    for i, v in ipairs(Config.NPC) do
        local x, y, z = table.unpack(v.coords)
        -- Loading Model 
        local hashModel = GetHashKey(v.npcmodel)
        if IsModelValid(hashModel) then
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do
                Wait(100)
            end
        else
            print(v.npcmodel .. " is not valid")
        end
        -- Spawn NPC ped
        local npc = CreatePed(hashModel, x, y, z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) -- NPC can escape?
        SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, x, y, z)--create blip
        SetBlipSprite(blip, v.blip, true)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.npc_name)
    end
end

function StartPED() -- Loading Peds
    for i, v in ipairs(Config.PED) do
        local x, y, z = table.unpack(v.coords)
        -- Loading Model 
        local hashModel = GetHashKey(v.pedmodel)
        if IsModelValid(hashModel) then
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do
                Wait(100)
            end
        else
            print(v.pedmodel .. " is not valid")
        end
        -- Spawn Ped
        local ped = CreatePed(hashModel, x, y, z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(npc, true)
        SetEntityInvincible(npc, false)
        Wait(1000)
        FreezeEntityPosition(npc, false) -- Ped can escape?
        SetBlockingOfNonTemporaryEvents(npc, true) -- Ped can't be scared
    end
end
