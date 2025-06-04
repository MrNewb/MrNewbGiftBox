# MrNewbGiftBox

> **Professional FiveM Gift Box System** - Community Bridge callback demonstration with customizable gift boxes for enhanced server monetization and player rewards.

![GitHub Stars](https://img.shields.io/github/stars/MrNewb/MrNewbGiftBox?style=for-the-badge&color=FFD700) ![GitHub Downloads](https://img.shields.io/github/downloads/MrNewb/MrNewbGiftBox/total?style=for-the-badge&color=00FF00) ![License](https://img.shields.io/badge/License-FREE-brightgreen?style=for-the-badge) ![Community Bridge](https://img.shields.io/badge/Community_Bridge-Required-red?style=for-the-badge) ![Framework](https://img.shields.io/badge/Framework-ESX%20%7C%20QBCore%20%7C%20Qbox-blue?style=for-the-badge)

[![Discord](https://img.shields.io/discord/1204398264812830720?label=Discord&logo=discord&color=7289DA&style=for-the-badge)](https://discord.gg/mrnewbscripts) [![Ko-fi](https://img.shields.io/badge/Support-Ko--fi-FF5E5B?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/R5R76BIM9) [![Documentation](https://img.shields.io/badge/Docs-GitBook-blue?style=for-the-badge&logo=gitbook)](https://mrnewbs-scrips.gitbook.io/guide)

---

## Overview

**MrNewbGiftBox** serves as both a functional gift box system and a comprehensive reference implementation for **Community Bridge callbacks**. This script demonstrates modern FiveM development practices while providing a practical tool for server monetization and player engagement.

### Key Features

- **Community Bridge Integration** - Demonstrates proper callback implementation and usage
- **Multi-Framework Support** - Compatible with ESX, QBCore, and Qbox
- **Flexible Gift System** - Configurable reward boxes with chance-based items
- **Server Monetization Ready** - Perfect for donation rewards and player incentives
- **Reference Implementation** - Clean code example for Community Bridge development

<details>
<summary><strong>Gift Box System Features</strong></summary>

- **Customizable Reward Boxes** - Configure multiple gift box types with unique rewards
- **Chance-Based Items** - Set probability percentages for rare items
- **Guaranteed Rewards** - Include items that always appear in boxes
- **Money Rewards** - Optional account (bank/cash) rewards included
- **Multi-Inventory Support** - Works with both QB-Core and ox_inventory systems

</details>

<details>
<summary><strong>Development Reference</strong></summary>

- **Community Bridge Callbacks** - Real-world implementation examples
- **Modern Code Structure** - Clean, organized, and well-documented codebase
- **Multi-Framework Compatibility** - Shows proper framework detection and integration
- **Export System** - Demonstrates server-side export functionality

</details>

---

## Installation Guide

<details>
<summary><strong>Step-by-Step Installation</strong></summary>

### Prerequisites
- **[Community Bridge](https://github.com/The-Order-Of-The-Sacred-Framework/community_bridge)** - Required for callback functionality
- **Framework** - ESX, QBCore, or Qbox (auto-detected)
- **Inventory System** - QB-Core inventory or ox_inventory

### Item Configuration

This script adds gift box items to your inventory system. Follow the instructions for your specific setup:

#### QB-Core Framework

Add the following items to your `qb-core/shared/items.lua`:

```lua
starter_box = {name = 'starter_box', label = 'Starter Gift Box', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
gang_kit = {name = 'gang_kit', label = 'Gang Kit', weight = 1000, type = 'item', image = 'giftbox.png', unique = false, useable = true, shouldClose = true, description = 'A gift box'},
```

#### ox_inventory

Add the following items to your `ox_inventory/data/items.lua`:

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

### Image Setup

Ensure `giftbox.png` is placed in your inventory image directory:
- **QB-Core**: `qb-inventory/html/images/`
- **ox_inventory**: `ox_inventory/web/images/`

### Resource Installation
1. Download and extract the resource to your `resources` folder
2. Ensure Community Bridge is installed and configured
3. Add `ensure MrNewbGiftBox` to your `server.cfg`
4. Restart your server

</details>

---

## Configuration

<details>
<summary><strong>Customizing Gift Boxes</strong></summary>

Edit `src/shared/config.lua` to define additional gift boxes. Each box configuration supports:

- **Item Lists** - Define items with `chance` (probability) or `always` (guaranteed) fields
- **Account Rewards** - Optional money rewards (bank/cash)
- **Flexible Structure** - Easy to add new box types and modify existing ones

Example configuration structure:
```lua
Config.GiftBoxes = {
    ["starter_box"] = {
        items = {
            {item = "bread", amount = 5, chance = 100}, -- Always included
            {item = "water", amount = 3, chance = 80},  -- 80% chance
        },
        money = {amount = 500, account = "bank"} -- Optional money reward
    }
}
```

</details>

---

## Usage & Exports

### Server Exports

```lua
-- Give a starter box to a player
exports.MrNewbGiftBox:GiveGiftBox(source, "starter_box", 1)

-- Give a gang kit to a player
exports.MrNewbGiftBox:GiveGiftBox(source, "gang_kit", 1)

-- Or use standard item-giving logic if you prefer
```

### Integration Examples

This script serves as an excellent reference for:
- **Community Bridge callback implementation**
- **Multi-framework compatibility patterns**
- **Proper export system design**
- **Configuration-driven development**

---

## Dependencies

This resource requires the following dependencies:

- **[Community Bridge](https://github.com/The-Order-Of-The-Sacred-Framework/community_bridge)** - Essential for callback functionality and framework compatibility
- **Framework** - ESX, QBCore, or Qbox (automatically detected)
- **Inventory System** - Compatible with all inventory systems supported by Community Bridge

---

## Documentation & Support

### Resources
- **[Complete Documentation](https://mrnewbs-scrips.gitbook.io/guide)** - Installation guides and troubleshooting
- **[Community Bridge](https://github.com/The-Order-Of-The-Sacred-Framework/community_bridge)** - Enhanced compatibility framework
- **[Video Tutorials](https://www.youtube.com/@mrnewb2819)** - Step-by-step installation guides

### Community Support
[![Discord](https://discordapp.com/api/guilds/1204398264812830720/widget.png?style=banner2)](https://discord.gg/mrnewbscripts)

**Join our Discord community** for:
- Real-time support and troubleshooting
- Community Bridge development discussions
- Feature requests and suggestions  
- Direct developer communication

---

## Development Notes

- **Free Resource** - Provided completely free as a community contribution
- **Educational Purpose** - Serves as a reference for Community Bridge integration
- **No Reselling** - Please respect the collaborative spirit and do not sell this resource
- **Community First** - Built to help developers learn modern FiveM development practices

---

<details>
<summary><strong>SEO Keywords & Search Optimization</strong></summary>

**FiveM Scripts:** FiveM scripts • FiveM resources • FiveM development • FiveM server scripts • Custom FiveM scripts • Professional FiveM scripts • FiveM script developer • FiveM lua scripts • Best FiveM scripts • Free FiveM scripts • Quality FiveM scripts • Gift box scripts

**Gift Box System:** FiveM gift boxes • Gift box script • Reward system FiveM • Loot boxes FiveM • Gift system • Donation rewards • Player rewards FiveM • Prize boxes • Reward boxes FiveM • Gift mechanics • Loot system FiveM

**Framework Compatibility:** ESX scripts • QBCore scripts • Qbox scripts • QBX scripts • QB-Core resources • Multi-framework scripts • ESX resources • QBCore resources • Framework compatibility • Universal FiveM scripts • Cross-framework development • ESX QBCore Qbox compatibility

**Community Bridge:** Community Bridge scripts • Community Bridge integration • Community Bridge callbacks • FiveM Community Bridge • Bridge system FiveM • Callback system • Modern FiveM development • Bridge compatibility • Framework bridge

**Inventory Systems:** ox_inventory scripts • Ox Inventory integration • qb-inventory compatibility • QB inventory • Item-based systems • FiveM inventory • Usable items FiveM • Custom items • Item management scripts • Inventory enhancement

**Free Resources:** Free FiveM scripts • Open source FiveM • Community FiveM scripts • No escrow FiveM • Unencrypted scripts • Community resources • Free roleplay scripts • Open source roleplay • Community driven development

**Server Monetization:** FiveM monetization • Donation rewards • Server income • Player incentives • Reward systems • Server funding • Premium rewards • VIP rewards • Donation boxes • Server economy

**Development Reference:** Lua programming • Lua scripting • FiveM development • Code examples • Programming reference • Development tutorial • Modern scripting • Best practices FiveM • Clean code examples

**Roleplay Enhancement:** GTA V roleplay • GTA RP scripts • Roleplay server scripts • RP server resources • Immersive roleplay • Professional roleplay scripts • Roleplay enhancement tools • Player engagement • Server events

**Search Tags:** `fivem-scripts` `gift-boxes` `reward-system` `community-bridge` `ox-inventory` `esx-scripts` `qbcore-scripts` `qbox-scripts` `qbx-scripts` `free-fivem` `lua-programming` `gta5-roleplay` `roleplay-scripts` `donation-rewards` `player-rewards` `fivem-resources` `open-source` `multi-framework` `professional-scripts` `development-reference` `qbox` `qb-core` `qbx` `free` `gift` `monetize` `easy` `mrnewb` `community_bridge`

</details>

---

*Ready to implement gift boxes on your server? Perfect for donation rewards, event prizes, and player engagement!*
