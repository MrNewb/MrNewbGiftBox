fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name "MrNewbGiftBox"
description "A simple gift box system for FiveM, allowing players to open gift boxes and receive random rewards."
author "MrNewb"
version "0.0.2"

shared_scripts {
	'src/shared/config.lua',
	'src/shared/init.lua',
}

client_scripts {
	'src/client/**/*.lua',
}

server_scripts {
	'src/server/*.lua',
}

files {
	'locales/*.json',
}

dependencies {
    '/onesync',
	'community_bridge',
}

escrow_ignore {
	'src/shared/*.lua',    -- Config files
	'src/client/*.lua',    -- open files
	'src/server/*.lua',    -- open files
}