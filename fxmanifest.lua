fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'MrNewbGiftBox'
author 'MrNewb'
description 'Configurable gift box loot tables with optional cash rewards'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    '@Newb_Bridge/import.lua',
    'resource/shared/locale.lua',
}

client_scripts {
    'resource/client/gift_box.lua',
}

server_scripts {
    'configs/config.lua',
    'resource/server/gift_box.lua',
}

files {
    'locales/*.json',
}

dependencies {
    '/server:6116',
    '/onesync',
    'ox_lib',
    'Newb_Bridge',
}

escrow_ignore {
    'configs/*.lua',
    'locales/*.json',
    'resource/**/*.lua',
}
