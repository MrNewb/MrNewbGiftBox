local PRESENT_MODEL = `xm3_prop_xm3_present_01a`
local PLACE_DICT = 'pickup_object'
local PLACE_CLIP = 'putdown_low'
local KNEEL_DICT = 'amb@medic@standing@kneel@base'
local KNEEL_CLIP = 'base'
local CONFETTI_ASSET = 'scr_xs_celebration'
local CONFETTI_EFFECT = 'scr_xs_confetti_burst'
local CONFETTI_BURST_HEIGHTS = { 0.15, 0.4, 0.65 }
local PROGRESS_MS = 6000
local PLACE_DROP_MS = 550
local PLACE_SETTLE_MS = 350
local CONFETTI_HOLD_MS = 1600

local placedBox

local function placeGiftBox(ped)
    lib.requestModel(PRESENT_MODEL)
    lib.requestAnimDict(PLACE_DICT)

    TaskPlayAnim(ped, PLACE_DICT, PLACE_CLIP, 8.0, -8.0, PLACE_DROP_MS + PLACE_SETTLE_MS, 0, 0.0, false, false, false)
    Wait(PLACE_DROP_MS)

    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.8, -0.9)
    local box = CreateObject(PRESENT_MODEL, coords.x, coords.y, coords.z, false, false, false)
    SetEntityHeading(box, GetEntityHeading(ped) + 180.0)
    PlaceObjectOnGroundProperly(box)
    FreezeEntityPosition(box, true)
    SetModelAsNoLongerNeeded(PRESENT_MODEL)
    RemoveAnimDict(PLACE_DICT)

    Wait(PLACE_SETTLE_MS)
    return box
end

local function popConfetti(coords)
    lib.requestNamedPtfxAsset(CONFETTI_ASSET)
    for i = 1, #CONFETTI_BURST_HEIGHTS do
        UseParticleFxAsset(CONFETTI_ASSET)
        StartParticleFxNonLoopedAtCoord(CONFETTI_EFFECT, coords.x, coords.y, coords.z + CONFETTI_BURST_HEIGHTS[i], 0.0, 0.0, 0.0, 1.0, false, false, false)
    end
    RemoveNamedPtfxAsset(CONFETTI_ASSET)
end

local function removePlacedBox()
    if placedBox and DoesEntityExist(placedBox) then DeleteEntity(placedBox) end
    placedBox = nil
end

local function openGiftBox(itemLabel)
    if cache.vehicle then return false end

    placedBox = placeGiftBox(cache.ped)

    local finished = bridge.progressbar.openprogressbar({
        duration = PROGRESS_MS,
        label = locale('GiftBox.ProgressBarText', itemLabel),
        disable = { move = true, combat = true, car = true },
        anim = { dict = KNEEL_DICT, clip = KNEEL_CLIP, flag = 1 },
        canCancel = true,
    }) == true

    if finished then
        popConfetti(GetEntityCoords(placedBox))
        Wait(CONFETTI_HOLD_MS)
    end

    removePlacedBox()
    return finished
end

lib.callback.register('MrNewbGiftBox:Callback:OpenGiftBox', openGiftBox)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= cache.resource then return end
    removePlacedBox()
end)
