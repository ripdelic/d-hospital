-- Map blip
Citizen.CreateThread(function ()
    blip = AddBlipForCoord(311.57, -594.11) -- x & y coordinates
	SetBlipSprite(blip, 61) --  icon 
	SetBlipScale(blip, 0.7) -- size
	SetBlipColour(blip, 23) -- color
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Pillbox Hospital') -- name that shows on the map
	EndTextCommandSetBlipName(blip)
end)
