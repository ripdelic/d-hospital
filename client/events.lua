-- Function for front desk npc
local function deskNpc()
    for k, v in pairs(Config.NPC) do
        lib.requestModel(v.model)
        local ped = CreatePed(4, v.model, v.coords, false, false)
        SetEntityHeading(ped, heading)
        SetEntityAsMissionEntity(ped, true, true)
        SetPedFleeAttributes(ped, 0, 0)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
end

-- Events
RegisterNetEvent('esx:playerLoaded', function()
    deskNpc(); playerLoaded = true
end)

RegisterNetEvent('ox:playerLoaded',function ()
    deskNpc(); playerLoaded = true
end)
