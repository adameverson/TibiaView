function onUse(cid, item, frompos, item2, topos)
if item.uid == 1360 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Spellbook of Shadow")
item_uid = doPlayerAddItem(cid,8977,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1361 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Super Soft Boots")
item_uid = doPlayerAddItem(cid,2641,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1362 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1360)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Vip Helmet")
item_uid = doPlayerAddItem(cid,3972,1)
setPlayerStorageValue(cid,1360,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

else
return 0
end
return 1
end