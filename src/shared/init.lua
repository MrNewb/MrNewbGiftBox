Bridge = exports.community_bridge:Bridge()

function locale(message, ...)
    return Bridge.Language.Locale(message, ...)
end

if not IsDuplicityVersion then return end

SendNotify = Bridge.Notify.SendNotify

RemoveItem = Bridge.Inventory.RemoveItem

AddItem = Bridge.Inventory.AddItem

AddMoney = Bridge.Framework.AddAccountBalance

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    Bridge.Version.AdvancedVersionChecker("MrNewb/patchnotes", resource)
end)