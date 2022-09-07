local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-blackmarket:server:ComprarItems', function(item, pontos, dinheiro)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Config.BlackMoney['UseBlackMoney'] == true then
        if Player.Functions.GetItemByName(Config.BlackMoney['BlackMoneyItemName']) >= dinheiro then
            Player.Functions.RemoveItem(Config.BlackMoney['BlackMoneyItemName'], dinheiro)

            Player.Functions.AddItem(item, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        else
            TriggerClientEvent('QBCore:Notify', source, Lang.noBlackMoney, 'error', '5000')
        end
    elseif Player.Functions.GetMoney('cash') >= dinheiro then
        Player.Functions.RemoveMoney('cash', dinheiro)

        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    end

    Player.Functions.SetMetaData("blackmarketlevel", Player.PlayerData.metadata["blackmarketlevel"]+(pontos))
end)
