Config = {
    ['BlackMoney'] = {
        ['UseBlackMoney'] = false, -- if true you will use black money to buy items if false you will use normal cash
        ['BlackMoneyItemName'] = 'markedbills', -- Name to black money item
    },
    ['Items'] = {
        ['lockpick'] = { -- Item name
            menuLabel = 'Lockpick', -- Item name (Label)
            itemName = 'lockpick', -- Item name
            itemPrice = 500, -- Item price
            requeriedPoints = 0, -- Requeried points to buy this item
            earnPoints = 1, -- How many points you earn buying items
        },
        ['electronickit'] = {
            menuLabel = 'Electronic Kit',
            itemName = 'electronickit',
            itemPrice = 1000,
            requeriedPoints = 5,
            earnPoints = 1,
        },
        ['drill'] = {
            menuLabel = 'Drill',
            itemName = 'drill',
            itemPrice = 1500,
            requeriedPoints = 11,
            earnPoints = 1,
        },
    },
    ['Location'] = {
        ['PedLocation'] = vector4(1339.81, 4392.16, 43.35, 171.13), -- Location of ped 
        ['TargetLocation'] = vector3(1339.81, 4392.16, 44.35), -- Location of ped target (need to be the same as the ped but in vec3)
    },
}

Lang = {
    ['Price'] = 'Price: ',
    ['buySuccess'] = 'You buy a ',
    ['buySuccessPrice'] = ' for ',
    ['errorPoints'] = 'You do not have the right points to buy that item...',
    ['menuHeader'] = 'Black Market Menu',
    ['pointsCommand1'] = 'You have ',
    ['pointsCommand2'] = ' points!',
    ['RequiredLabel'] = 'Required points: ',
    ['errorNoMoney'] = 'You do not have enought money to buy this...',
    ['noBlackMoney'] = 'You do not have enouught black money to buy this...',
}