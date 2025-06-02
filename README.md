# MrNewbGiftBox
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/R5R76BIM9)

## Item Configuration

This script includes gift box items that need to be added to your inventory system. Follow the instructions below based on your framework and inventory system.

---

## QB-Core Framework

If you're using **QB-Core**, add the following items to your `qb-core/shared/items.lua` file:

```lua
starter_box = {name = 'starter_box', label = 'Starter Gift Box', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
gang_kit = {name = 'gang_kit', label = 'Gang Kit', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
```

---

## ox_inventory

If you're using **ox_inventory**, add the following items to your `ox_inventory/data/items.lua` file:

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

## Image Setup

Make sure you have the `giftbox.png` image in your inventory's images folder:
- **QB-Core**: Place in `qb-inventory/html/images/`
- **ox_inventory**: Place in `ox_inventory/web/images/`

---

## Configuration

You can add more gift boxes by editing the `src/shared/config.lua` file. Each gift box should have:
- Items with chance/always properties
- Optional account rewards
- Corresponding item definitions in your inventory system

---

## Usage

### server exports:
```lua
-- Give a starter box to player
exports.MrNewbGiftBox:GiveGiftBox(source, "starter_box", 1)

-- Give a gang kit to player  
exports.MrNewbGiftBox:GiveGiftBox(source, "gang_kit", 1)

-- You can also just give the items like normal
```
---

## Support

Need help? Join our Discord server: https://discord.gg/mrnewbscripts

For configuration questions or issues, please don't hesitate to ask!
