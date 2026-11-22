fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'MrNewbGiftBox'
author 'MrNewb'
description 'Configurable gift box loot tables with optional cash rewards'
version '1.1.2'

shared_scripts {
    '@ox_lib/init.lua',
    '@Newb_Bridge/import.lua',
    'resource/modules/core/shared/locale.lua',
}

client_scripts {
    'resource/modules/giftbox/client/gift_box.lua',
}

server_scripts {
    'resource/open/server/config.lua',
    'resource/modules/giftbox/server/gift_box.lua',
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
    '**/*',
}
