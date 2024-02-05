-- Function for all "debug_print"
local function debug_print(msg)
    if Config.Debug then
        print(msg)
    end
end

-- Animation for laying in hospital bed
local function bedAnimation()
    SetEntityCoords(cache.ped, 317.68, -585.46, 44.2)
    lib.requestAnimDict('anim@gangops@morgue@table@')
    TaskPlayAnim(cache.ped, 'anim@gangops@morgue@table@', 'ko_front', 8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityHeading(cache.ped, 335.05)
    InAction = true
end

-- Treatment in progress
local function treatmentInProgress()
    TriggerEvent('esx_ambulancejob:revive'); Wait(850) -- Waiting for ox_core death system
    SetEntityHealth(cache.ped, 200)
    bedAnimation()
    debug_print(Locale('progress'))
     
    exports.ox_inventory:Progress({
        duration = 15000,
        position = 'bottom',
        label = 'Getting Treated',
        useWhileDead = true,
        canCancel = false,
        disable = {
            move = true,
            combat = true,
            mouse = false
        },
    }, function(cancel)
        if not cancel then
        ClearPedTasksImmediately(cache.ped)
        lib.notify({
            title = Locale('name'),
            description = Locale('playerTreated'),
            position = 'top',
            duration = 5000,
            style = {
                backgroundColor = 'darkseagreen',
                color = 'white'
            },
            icon = 'notes-medical',
            iconColor = 'white'
        })
        SetEntityCoords(cache.ped, 316.31, -584.36, 43.28)
        lib.requestAnimSet('move_m@drunk@slightlydrunk')
        SetPedMovementClipset(cache.ped, 'move_m@drunk@slightlydrunk', true)
        StartScreenEffect('drugsmichaelaliensfightout', -1, true)
        Wait(40000)
        StopAllScreenEffects(cache.ped)
        ResetPedMovementClipset(cache.ped, 0)
    end
  end)
end

-- Event for receiving treatment through ox_lib context
RegisterNetEvent('qphospital:requestTreatment', function()
    if Config.costMoney then
        lib.callback('qphospital:signIn', false, function(response)
            if response then
                debug_print(Locale('playerBilled'))
                lib.notify({
                    title = Locale('name'),
                    description = Locale('playerBilled'),
                    position = 'top',
                    duration = 5000,
                    style = {
                        backgroundColor = 'cadetblue',
                        color = 'white'
                    },
                    icon = 'file-invoice-dollar',
                    iconColor = 'white'
                })
                treatmentInProgress()
            elseif not response then
                debug_print(Locale('noMoney')) 
                lib.notify({
                    title = Locale('name'),
                    description = Locale('noMoney'),
                    position = 'top',
                    duration = 3500,
                    style = {
                        backgroundColor = 'lightcoral',
                        color = 'white'
                    },
                    icon = 'notes-medical',
                    iconColor = 'white'
                })
            end
        end)
    elseif not Config.costMoney then
        treatmentInProgress()
    end
end)
