**# MrNewbGiftBox**

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/R5R76BIM9)

---

I was inspired to create this as a quick test for `community_bridge` callbacks — and since it's been a while since my last free release, I figured it was a good time to share something simple and useful. If you're using `community_bridge`, this should serve as a solid reference for how the callbacks work and how to integrate them into your own scripts.

> **Note:** This script requires [`community_bridge`](https://github.com/The-Order-Of-The-Sacred-Framework/community_bridge) as a dependency. Be sure to have it installed and properly configured for the callbacks to function.

---

## 🧰 Item Configuration

This script adds gift box items to your inventory system. Setup steps will vary slightly depending on the framework you use — follow the relevant instructions below.

---

## QB-Core Framework

For **QB-Core**, add the following to your `qb-core/shared/items.lua`:

```lua
starter_box = {name = 'starter_box', label = 'Starter Gift Box', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
gang_kit = {name = 'gang_kit', label = 'Gang Kit', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
```

---

## ox\_inventory

For **ox\_inventory**, insert the following into `ox_inventory/data/items.lua`:

```lua
["starter_box"] = {
    label = "Starter Gift Box",
    weight = 1000,
    stack = true,
    close = true,
    description = "A gift box",
    client = {
        image = "giftbox.png",
    }
},

["gang_kit"] = {
    label = "Gang Kit",
    weight = 1000,
    stack = true,
    close = true,
    description = "A gift box",
    client = {
        image = "giftbox.png",
    }
},
```

---

## 🖼️ Image Setup

Make sure `giftbox.png` is placed in your inventory image directory:

* **QB-Core**: `qb-inventory/html/images/`
* **ox\_inventory**: `ox_inventory/web/images/`

---

## ⚙️ Configuration

You can define more gift boxes in `src/shared/config.lua`. Each box can include:

* A list of items with `chance` or `always` fields
* Optional account (money) rewards
* Matching inventory definitions (see above)

---

## 🚀 Usage

### Server Exports:

```lua
-- Give a starter box to a player
exports.MrNewbGiftBox:GiveGiftBox(source, "starter_box", 1)

-- Give a gang kit to a player
exports.MrNewbGiftBox:GiveGiftBox(source, "gang_kit", 1)

-- Or use standard item-giving logic if you prefer
```

---

## 🤝 Support

Questions or need help setting it up?
Join the Discord: [https://discord.gg/mrnewbscripts](https://discord.gg/mrnewbscripts)
