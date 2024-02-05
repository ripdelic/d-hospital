local function startBleedingEffect()
    if playerLoaded then  
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - 2)
    if not bleeding then
        bleeding = true
    end

        lib.notify({
            title = Locale('bleeding'),
            description = Locale('medicalAttention'),
            position = 'top',
            duration = 5000,
            style = {
                backgroundColor = 'lightcoral',
                color = 'white'
            },
            icon = 'notes-medical',
            iconColor = 'white'
        })
        --ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 1.0)
    end
    Wait(1800)
end

local function stopBleedingEffect()
    bleeding = false
end

if Config.lowHealth then
    SetInterval(function()
        local health = GetEntityHealth(cache.ped)

        if health < 110 then
            startBleedingEffect()
        elseif health > 190 then
            stopBleedingEffect()
        end
    end, 5)
end
