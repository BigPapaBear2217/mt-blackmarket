local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-blackmarket:client:AbrirMenu', function()
    local columns = {
        {
            header = Lang.menuHeader,
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Items) do
        local item = {}
        item.header = "<img src=nui://qb-inventory/html/images/" .. QBCore.Shared.Items[v.itemName].image .. " width=35px style='margin-right: 10px'> " .. v.menuLabel
        item.text = Lang.Price .. v.itemPrice .. '$ <br> ' .. Lang.RequiredLabel .. v.requeriedPoints .. Lang.pointsCommand2
        item.params = {
            event = 'mt-blackmarket:client:ComprarItems',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end

    exports['qb-menu']:openMenu(columns)
end)

RegisterNetEvent('mt-blackmarket:client:ComprarItems', function(args)
    local playername = GetPlayerName(PlayerId())
    local playerid = GetPlayerServerId(PlayerId())
    local current = args.type
    local pontos = Config.Items[current].earnPoints 
    local dinheiro = Config.Items[current].itemPrice
    local item = Config.Items[current].itemName

    if QBCore.Functions.GetPlayerData().metadata["blackmarketlevel"] >= Config.Items[current].requeriedPoints then
        TriggerServerEvent('qb-log:server:CreateLog', 'blackmarket', 'Item buyed', 'green', string.format(playername .. ' id ' .. playerid .. ' was buyed 1 ' .. Config.Items[current].menuLabel .. ' and earn '.. pontos .. ' points', true))
        TriggerServerEvent('mt-blackmarket:server:ComprarItems', item, pontos, dinheiro)
    else
        QBCore.Functions.Notify(Lang.errorPoints, 'error', 7500)
    end
end)

CreateThread(function()
    RequestModel(`ig_lamardavis`)
      while not HasModelLoaded(`ig_lamardavis`) do
      Wait(1)
    end
      BlackMarketPed = CreatePed(2, `ig_lamardavis`, Config.Location.PedLocation, false, false)
      SetPedFleeAttributes(BlackMarketPed, 0, 0)
      SetPedDiesWhenInjured(BlackMarketPed, false)
      TaskStartScenarioInPlace(BlackMarketPed, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(BlackMarketPed, true)
      SetBlockingOfNonTemporaryEvents(BlackMarketPed, true)
      SetEntityInvincible(BlackMarketPed, true)
      FreezeEntityPosition(BlackMarketPed, true)

    exports['qb-target']:AddBoxZone("BlackMarketPed", Config.Location.TargetLocation, 1, 1, {
        name="BlackMarketPed",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
                event = "mt-blackmarket:client:AbrirMenu",
                icon = "fas fa-dollar-sign",
                label = "Buy something",
            },
            {
                event = "mt-blackmarket:client:VerificarPontos",
                icon = "fas fa-circle",
                label = "Check atual points",
            },
        },
        distance = 1.5
    })
end)

RegisterCommand('blackpoints', function()
    local pontos = QBCore.Functions.GetPlayerData().metadata["blackmarketlevel"]

    QBCore.Functions.Notify(Lang.pointsCommand1 ..pontos.. Lang.pointsCommand2, 'primary', 7500)
end)

RegisterNetEvent('mt-blackmarket:client:VerificarPontos', function()
    local pontos = QBCore.Functions.GetPlayerData().metadata["blackmarketlevel"]

    QBCore.Functions.Notify(Lang.pointsCommand1 ..pontos.. Lang.pointsCommand2, 'primary', 7500)
end)