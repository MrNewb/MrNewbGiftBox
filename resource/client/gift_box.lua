lib.callback.register('MrNewbGiftBox:Callback:PlayAnimation', function(itemLabel)
    if type(itemLabel) ~= 'string' then itemLabel = '' end

    return bridge.progressbar.openprogressbar({
        duration = 6000,
        label = locale('GiftBox.ProgressBarText', itemLabel),
        disable = { move = true, combat = true },
        anim = {
            dict = 'anim@heists@humane_labs@emp@hack_door',
            clip = 'hack_loop',
            flag = 1,
        },
        prop = {
            model = 'xm3_prop_xm3_present_01a',
            bone = 28422,
            pos = vector3(0.0, -0.19, -0.16),
            rot = vector3(0.0, 0.0, 0.0),
        },
        canCancel = true,
    }) == true
end)
