local function openContext()
    lib.registerContext({
        id = 'hospital_context',
        title = Locale('name'),
        menu = 'pillbox_hospital',
        options = {
            [Locale('question')] = {
                description = Locale('cost'),
                event = 'qphospital:requestTreatment'
            }
        }
    })
    lib.showContext('hospital_context')
end

CreateThread(function()
    local doctor = {}

    print('npc:loaded')
    for k, v in pairs(Config.NPC) do
        doctor = {v.model}
    end

exports['qtarget']:AddTargetModel(doctor, {
    options = {
        {
            icon = 'fas fa-sign-in-alt',
            label = Locale('checkIn'),
            action = function(entity)
                openContext()
            end
        }
    },
    distance = 3.0
    })
end)

-- debug command to test treatment through ox_lib context
if Config.Debug then
    RegisterCommand(Locale('debugCommand'), function(source, args, rawCommand)
        openContext()
    end)
end
