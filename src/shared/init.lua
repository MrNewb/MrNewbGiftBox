Bridge = exports.community_bridge:Bridge()

function locale(message)
    return Bridge.Language.Locale(message)
end

if not IsDuplicityVersion then return end

function SendNotify(src, message, type, duration)
    if not src or not message then return end
    Bridge.Notify.SendNotify(src, message, type or "info", duration or 5000)
end

function RemoveItem(src, item, count, slot, metadata)
    if not src or not item or not count then return end
    return Bridge.Inventory.RemoveItem(src, item, count, slot, metadata)
end

function AddItem(src, item, count, slot, metadata)
    if not src or not item or not count then return end
    return Bridge.Inventory.AddItem(src, item, count, slot, metadata)
end

function AddMoney(src, accountType, amount)
    if not src or not amount then return end
    print(("Adding %s %s to %s"):format(amount, accountType or "bank", src))
    accountType = accountType or "bank"
    return Bridge.Framework.AddAccountBalance(src, accountType, tonumber(amount), "Giftbox Reward")
end