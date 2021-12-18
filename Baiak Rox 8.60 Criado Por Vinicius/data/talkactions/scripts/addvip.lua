function onSay(cid, words, param)

-- configs
access = 3
days = 30
-- end configs

player = getPlayerByName(param)
daysvalue = days*3600*24
storageplayer = getPlayerStorageValue(player,13540)
timenow = os.time()
if storageplayer == -1 or storageplayer == 0 then
time = timenow+daysvalue
else
time = storageplayer+daysvalue
end


if param ~= "" then
if getPlayerGroupId(cid) >= access then
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Foram adicionados ".. days .." dias de VIP no seu character.")
setPlayerStorageValue(player,13540,time)
quantity = math.floor((getPlayerStorageValue(player,13540) - timenow)/(3600*24))
doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Você tem ".. quantity .." dias de VIP restantes.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Somente jogadores com acesso maior que "..access.." podem adicionar vips.")
end

end

end