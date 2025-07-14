local function verifyChance(reward)
    return reward.always or (reward.chance and math.random() <= reward.chance)
end

function GetItemPool(src, box)
    local itemPool = Config.GiftBoxes[box]
    if not itemPool then return false end
    for _, item in pairs(itemPool.items) do
        if verifyChance(item) then
            AddItem(src, item.item, item.count, nil, item.metadata)
        end
    end
    if itemPool.account and verifyChance(itemPool.account) then
        local _type = itemPool.account.accountType or "bank"
        local amount = tonumber(itemPool.account.amount) or 1
        AddMoney(src, _type, amount)
    end
end

for k, _ in pairs(Config.GiftBoxes) do
    Bridge.Framework.RegisterUsableItem(k, function(src, itemData)
        local itemLabel = itemData.label or itemData.name
        local success = Bridge.Callback.Trigger("MrNewbGiftBox:Callback:PlayAnimation", src, itemLabel)
        if not success then return SendNotify(src, locale("GiftBox.Failed"), "error", 6000) end
        GetItemPool(src, k)
        SendNotify(src, locale("GiftBox.Rewarded"), "success", 6000)
        RemoveItem(src, k, 1, itemData.slot, nil)
    end)
end

function GiveGiftBox(src, boxName, amount)
    AddItem(src, boxName or "starter_box", amount or 1, nil, nil)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Bridge.Version.VersionChecker("MrNewb/MrNewbGiftBox")
end)

exports("GiveGiftBox", GiveGiftBox)
exports("GetItemPool", GetItemPool)