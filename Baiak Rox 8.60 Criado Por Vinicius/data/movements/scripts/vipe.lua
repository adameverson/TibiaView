-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Você não e vip 3 ,para adqrir sua vip fale !buyvip3 que custa 30KK",
msgWelcome = "Seja Bem Vindo a Area vip 3."
}

if getPlayerStorageValue(cid, 13700) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
