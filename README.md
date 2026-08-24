# MrNewbGiftBox

Configurable gift boxes. Guaranteed items, weighted extras via ox_lib selector, optional cash.

[Documentation](https://mrnewb.github.io/docs/mrnewbgiftbox) · [Tebex](https://mrnewbscripts.tebex.io/package/6878322) · [Discord](https://discord.gg/mrnewbscripts)

## Install

Needs [ox_lib](https://github.com/overextended/ox_lib) and [Newb_Bridge](https://github.com/MrNewb/Newb_Bridge).

```cfg
ensure ox_lib
ensure Newb_Bridge
ensure MrNewbGiftBox
```

Register each key in `Config.GiftBoxes` as a usable item. The resource hooks them with `bridge.framework.registerItemUse`. Copy `giftbox.png` from `[INSTALL]/` into your inventory images folder.

`configs/config.lua` is **server-only**, so loot tables are not sent to clients.

## Config

`always = true` always grants. Entries with `weight` go into ox_lib's weighted selector (`lib.selector`); one extra is rolled per open. Higher weight is more likely. `accountType` may be `cash`, `bank`, or `money`.

```lua
Config.GiftBoxes = {
    starter_box = {
        items = {
            { item = 'water', count = 2, always = true },
            { item = 'sandwich', count = 1, weight = 20 },
            { item = 'bandage', count = 3, weight = 50 },
        },
        account = { accountType = 'bank', amount = 500, always = true },
    },
}
```

## Exports

```lua
exports.MrNewbGiftBox:GiveGiftBox(source, 'starter_box', 1)
-- rolls and grants that box's rewards; does not consume a box item
exports.MrNewbGiftBox:GiveGiftBoxRewards(source, 'starter_box')
```

`GetItemPool` is an alias of `GiveGiftBoxRewards`.
