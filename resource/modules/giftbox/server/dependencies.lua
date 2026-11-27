-- The script uses lib.selector, which older ox_lib builds do not have. Without this it fails later with an error like
-- "attempt to index a function value (field 'selector')". This says what is wrong and how to fix it as the server starts.
local MIN_OX_LIB_VERSION = '3.40.2'

if lib.checkDependency('ox_lib', MIN_OX_LIB_VERSION) then return end

print(('^1[%s] ox_lib %s or newer is required, this server runs %s. Update ox_lib from https://github.com/overextended/ox_lib/releases and restart the server, or parts of the script will fail.^0'):format(GetCurrentResourceName(), MIN_OX_LIB_VERSION, GetResourceMetadata('ox_lib', 'version', 0) or 'unknown'))
