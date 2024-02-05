local ox_inventory = exports.ox_inventory
 
lib.versionCheck('ohqpr/qphospital')

lib.callback.register("qphospital:signIn", function(source)
    local src = source
    local fetchInventory = nil

    if ox_inventory:GetItem(src, 'money').count >= Config.treatmentPrice then
       ox_inventory:RemoveItem(src, 'money', Config.treatmentPrice)
        fetchInventory = true
    else
        fetchInventory = false
    end

    while fetchInventory == nil do Wait(50) end; return fetchInventory
end)
