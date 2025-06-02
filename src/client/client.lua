Bridge.Callback.Register('MrNewbGiftBox:Callback:PlayAnimation', function(itemLabel)
    local success = false
    Bridge.ProgressBar.Open({
        duration = 6000,
        label = locale("GiftBox.ProgressBarText")..itemLabel,
        disable = {
            move = true,
            combat = true
        },
        anim = {
            dict = "anim@heists@humane_labs@emp@hack_door",
            clip = "hack_loop",
            flag = 1,
        },
        prop = {
            model = "xm3_prop_xm3_present_01a",
            bone = 28422,
            pos = vector3(0.00, -0.19, -0.16),
            rot = vector3(0.0, 0.0, 0.0),
        },
    }, function(_success)
        if _success then
            success = true
        else
            success = false
        end
    end)
    return success
end)