# MrNewbGiftBox

![MrNewbGiftBox](.github/assets/banner.webp)

Configurable gift boxes. Guaranteed items, one weighted extra via ox_lib selector, optional cash.

[Documentation](https://mrnewb.github.io/docs/mrnewbgiftbox) · [Install guide](https://mrnewb.github.io/docs/mrnewbgiftbox/install) · [Tebex](https://mrnewbscripts.tebex.io/package/6878322) · [Discord](https://discord.gg/mrnewbscripts) · [Video](https://www.youtube.com/watch?v=Ma1y4jnbdt4) · [Short](https://www.youtube.com/shorts/vP-WgmYvv5Q)

<a href="https://www.youtube.com/shorts/vP-WgmYvv5Q"><img src=".github/assets/short.webp" alt="MrNewbGiftBox on YouTube Shorts" width="200"></a>

Documentation is available at https://mrnewb.github.io/docs/

![Gift box item](%5BINSTALL%5D/giftbox.png)

## Features

- One usable item per key in `Config.GiftBoxes`
- `always = true` always grants that entry
- `weight` entries pool into `lib.selector` — **one** extra per open
- Optional `account` reward (`cash` / `bank` / `money`)
- Cancellable unwrap progress
- Space-checked before the box is consumed
- Server-only config so loot tables never hit the client
- Exports to give a box or grant that box's rewards without unwrapping

## Install

Needs [ox_lib](https://github.com/overextended/ox_lib) and [Newb_Bridge](https://github.com/MrNewb/Newb_Bridge). Full item paste, images, and start order: [install guide](https://mrnewb.github.io/docs/mrnewbgiftbox/install).

```cfg
ensure ox_lib
ensure Newb_Bridge
ensure MrNewbGiftBox
```

Register every key in `Config.GiftBoxes` as a usable item. The resource hooks them with `bridge.framework.registerItemUse`. Do not add `server.export`. Copy `giftbox.png` from `[INSTALL]/` into your inventory images folder.

## Config

`resource/open/server/config.lua` is **server-only**. Higher `weight` is more likely.

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
exports.MrNewbGiftBox:GiveGiftBoxRewards(source, 'starter_box')
```

`GetItemPool` is an alias of `GiveGiftBoxRewards`. Signatures: [server exports](https://mrnewb.github.io/docs/mrnewbgiftbox/exports/server-exports).
