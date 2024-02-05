-- FX Information --
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

-- Manifest --
dependencies {
  'ox_lib',
  'ox_inventory',
  'qtarget'
}

shared_script '@ox_lib/init.lua'

shared_scripts {
  'config.lua',
  'locales/*.lua'
}

client_scripts {
  'client/*.lua'
}

server_scripts {
  'server/main.lua'
}
