--		___  ___       _   _                  _      _____              _         _
--		|  \/  |      | \ | |                | |    /  ___|            (_)       | |
--		| .  . | _ __ |  \| |  ___ __      __| |__  \ `--.   ___  _ __  _  _ __  | |_  ___
--		| |\/| || '__|| . ` | / _ \\ \ /\ / /| '_ \  `--. \ / __|| '__|| || '_ \ | __|/ __|
--		| |  | || |   | |\  ||  __/ \ V  V / | |_) |/\__/ /| (__ | |   | || |_) || |_ \__ \
--		\_|  |_/|_|   \_| \_/ \___|  \_/\_/  |_.__/ \____/  \___||_|   |_|| .__/  \__||___/
--									          							  | |
--									          							  |_|
--
--		  Need support? Join our Discord server for help: https://discord.gg/mrnewbscripts
--		  If you need help with configuration or have any questions, please do not hesitate to ask.

Config = {}

-- always is optional, chance is optional, if both are not set, the item will not be given.
-- If always is true, the item will always be given.
-- If chance is set, the item will be given with the given chance (0.01 - 0.99).
Config.GiftBoxes = {
	["starter_box"] = {
		items = {
			{ item = "water", count = 2, metadata = { description = "Everyone who ever drank this has died."}, always = true },
			{ item = "phone", count = 1, always = true },
			{ item = "sandwich", count = 1, chance = 0.2 },
			{ item = "bandage", count = 3, chance = 0.5 },
		},
		account = { accountType = "bank", amount = 500, always = true },
	},
	["gang_kit"] = {
		items = {
			{ item = "weapon_pistol", count = 1, metadata = {serie = "Scratched", serial = "Scratched"}, always = true },
		},
	},
}