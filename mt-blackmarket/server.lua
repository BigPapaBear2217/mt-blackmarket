local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-blackmarket:server:ComprarItems', function(item, pontos, dinheiro)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.Functions.GetMoney('cash') >= dinheiro then
        Player.Functions.RemoveMoney('cash', dinheiro)

        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', source, Lang.buySuccess, 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, Lang.errorNoMoney, 'primary')
    end

    Player.Functions.SetMetaData("blackmarketlevel", Player.PlayerData.metadata["blackmarketlevel"]+(pontos))
end)
