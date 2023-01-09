local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterNetEvent("vorp:SelectedCharacter") -- NPC loads after selecting character
AddEventHandler("vorp:SelectedCharacter", function(charid)
StartNPCs()
StartPEDs()
end)

function StartNPCs()
    for i, v in ipairs(Config.NPCs) do
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
        -- Spawn NPC Ped
        local npc = CreatePed(hashModel, x, y, z, v.heading, false, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
        SetEntityNoCollisionEntity(PlayerPedId(), npc, false)
        SetEntityCanBeDamaged(npc, false)
        SetEntityInvincible(npc, true)
        Wait(1000)
        FreezeEntityPosition(npc, true) -- NPC can't escape
        SetBlockingOfNonTemporaryEvents(npc, true) -- NPC can't be scared
        --create blip
        if v.blip ~= 0 then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, x, y, z)
            SetBlipSprite(blip, v.blip, true)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, v.npc_name)
        end
    end
end

function StartPEDs()
    for i, v in ipairs(Config.PEDs) do
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
        local ped = CreatePed(hashModel, x, y, z, v.heading, true, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        Citizen.InvokeNative(0xAEB97D84CDF3C00B, ped, true)
        SetEntityNoCollisionEntity(PlayerPedId(), ped, false)
        SetEntityCanBeDamaged(ped, true)
        SetEntityInvincible(ped, false)
        Wait(1000)
        FreezeEntityPosition(ped, false)
        SetBlockingOfNonTemporaryEvents(ped, false)
    end
end
