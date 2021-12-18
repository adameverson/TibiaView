--- skull remover by kakilo - quinto script

function onSay(cid, words, param, channel)

if (getCreatureSkullType(cid) == SKULL_BLACK) then
if doPlayerRemoveMoney(cid, 1000000) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, 22, "Black Skull Retirada.")
else
doPlayerSendTextMessage(cid, 22, "Voce precisa de 1kk para remover a sua black skull")
end
end

if (getCreatureSkullType(cid) == SKULL_RED) then
if doPlayerRemoveMoney(cid, 1000000) then
doCreatureSetSkullType(cid, SKULL_NONE)
doPlayerSendTextMessage(cid, 22, "Red Skull Retirada.")
else
doPlayerSendTextMessage(cid, 22, "Voce precisa de 1kk para remover a sua red skull")
end
end

if (getCreatureSkullType(cid) == SKULL_NONE) then
doPlayerSendTextMessage(cid, 22, "Sua Skull foi retirada com Sucesso!")
end

return TRUE
end