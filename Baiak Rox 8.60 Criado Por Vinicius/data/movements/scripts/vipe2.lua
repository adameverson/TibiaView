-- Script Vip Sytem 1.0 --
function onStepIn(cid, item, position, fromPosition)

local config = {
msgDenied = "Você não é VIP DONATE para ser VIP DONATE fale com o Administrador do OTserver que ira mandar os dados da conta para depositar !",
msgWelcome = "Sejá bem-vindo a área VIP DONATE!"
}

if getPlayerStorageValue(cid, 13548) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end