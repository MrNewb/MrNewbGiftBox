local validAccountTypes = {
    cash = true,
    bank = true,
    money = true,
}

local giftBoxSelectors = {}

local function buildWeightedSelector(giftBox)
    local weightedEntries = {}

    if type(giftBox.items) == 'table' then
        for itemIndex = 1, #giftBox.items do
            local rewardItem = giftBox.items[itemIndex]
            if rewardItem and not rewardItem.always and type(rewardItem.item) == 'string' then
                local weight = tonumber(rewardItem.weight)
                if weight and weight == weight and weight > 0 then
                    weightedEntries[#weightedEntries + 1] = {
                        weight,
                        {
                            rewardType = 'item',
                            item = rewardItem.item,
                            count = rewardItem.count,
                            metadata = rewardItem.metadata,
                        },
                    }
                end
            end
        end
    end

    local accountReward = giftBox.account
    if accountReward and not accountReward.always then
        local weight = tonumber(accountReward.weight)
        if weight and weight == weight and weight > 0 then
            weightedEntries[#weightedEntries + 1] = {
                weight,
                {
                    rewardType = 'account',
                    accountType = accountReward.accountType,
                    amount = accountReward.amount,
                },
            }
        end
    end

    if #weightedEntries < 1 then return end
    return lib.selector:new(weightedEntries)
end

for giftBoxName, giftBox in pairs(Config.GiftBoxes) do
    giftBoxSelectors[giftBoxName] = buildWeightedSelector(giftBox)
end

local function grantItemReward(src, itemName, count, metadata)
    local itemCount = tonumber(count)
    if not itemCount or itemCount ~= itemCount or itemCount < 1 then return end
    bridge.inventory.addItem(src, itemName, math.floor(itemCount), metadata)
end

local function grantAccountReward(src, accountReward)
    local accountType = accountReward.accountType or 'bank'
    if not validAccountTypes[accountType] then return end

    local moneyAmount = tonumber(accountReward.amount)
    if not moneyAmount or moneyAmount ~= moneyAmount or moneyAmount < 1 then return end
    bridge.framework.addMoney(src, accountType, math.floor(moneyAmount), 'gift_box_reward')
end

local function grantRolledReward(src, rolledReward)
    if not rolledReward then return end
    if rolledReward.rewardType == 'item' then
        grantItemReward(src, rolledReward.item, rolledReward.count, rolledReward.metadata)
        return
    end
    if rolledReward.rewardType == 'account' then
        grantAccountReward(src, rolledReward)
    end
end

local function playerCanCarryGuaranteedRewards(src, giftBox)
    if type(giftBox.items) ~= 'table' then return true end

    for itemIndex = 1, #giftBox.items do
        local rewardItem = giftBox.items[itemIndex]
        if rewardItem and rewardItem.always and type(rewardItem.item) == 'string' then
            local itemCount = tonumber(rewardItem.count)
            if itemCount and itemCount == itemCount and itemCount >= 1 then
                if not bridge.inventory.canCarryItem(src, rewardItem.item, math.floor(itemCount)) then
                    return false
                end
            end
        end
    end

    return true
end

local function giveGiftBoxRewards(src, giftBoxName)
    local playerPed = GetPlayerPed(src)
    if playerPed == 0 or not DoesEntityExist(playerPed) then return false end

    local giftBox = Config.GiftBoxes[giftBoxName]
    if not giftBox or type(giftBox.items) ~= 'table' then return false end

    for itemIndex = 1, #giftBox.items do
        local rewardItem = giftBox.items[itemIndex]
        if rewardItem and rewardItem.always and type(rewardItem.item) == 'string' then
            grantItemReward(src, rewardItem.item, rewardItem.count, rewardItem.metadata)
        end
    end

    local accountReward = giftBox.account
    if accountReward and accountReward.always then
        grantAccountReward(src, accountReward)
    end

    local weightedSelector = giftBoxSelectors[giftBoxName]
    if weightedSelector then
        grantRolledReward(src, weightedSelector:getRandomWeighted())
    end

    return true
end

local function giveGiftBox(src, giftBoxName, amount)
    local playerPed = GetPlayerPed(src)
    if playerPed == 0 or not DoesEntityExist(playerPed) then return end
    if type(giftBoxName) ~= 'string' or not Config.GiftBoxes[giftBoxName] then return end

    amount = tonumber(amount) or 1
    if amount ~= amount or amount < 1 then return end
    amount = math.floor(amount)

    bridge.inventory.addItem(src, giftBoxName, amount)
end

exports('GiveGiftBox', giveGiftBox)
exports('GiveGiftBoxRewards', giveGiftBoxRewards)
exports('GetItemPool', giveGiftBoxRewards)

for giftBoxName in pairs(Config.GiftBoxes) do
    bridge.framework.registerItemUse(giftBoxName, function(src, item)
        local playerPed = GetPlayerPed(src)
        if playerPed == 0 or not DoesEntityExist(playerPed) then return end
        if bridge.inventory.getItemCount(src, giftBoxName) < 1 then return end

        local itemLabel = item.label or item.name or giftBoxName
        local animationFinished = lib.callback.await('MrNewbGiftBox:Callback:PlayAnimation', src, itemLabel)
        if not animationFinished then
            bridge.notifications.notify(src, { description = locale('GiftBox.Failed'), type = 'error' })
            return
        end

        if bridge.inventory.getItemCount(src, giftBoxName) < 1 then return end

        local giftBox = Config.GiftBoxes[giftBoxName]
        if not giftBox then return end
        if not playerCanCarryGuaranteedRewards(src, giftBox) then
            bridge.notifications.notify(src, { description = locale('GiftBox.NoSpace'), type = 'error' })
            return
        end

        if not bridge.inventory.removeItem(src, giftBoxName, 1, nil, item.slot) then return end

        giveGiftBoxRewards(src, giftBoxName)
        bridge.notifications.notify(src, { description = locale('GiftBox.Rewarded'), type = 'success' })
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    exports[bridge.name]:VersionCheck('MrNewb/patchnotes', resourceName)
end)
