function onUse(cid, item, frompos, item2, topos)
if item.uid == 1701 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Rod ")
item_uid = doPlayerAddItem(cid,7958,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1702 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Wand")
item_uid = doPlayerAddItem(cid,7414,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1703 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Sword")
item_uid = doPlayerAddItem(cid,8932,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1704 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Vip Axe")
item_uid = doPlayerAddItem(cid,8293,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1705 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Vip Club")
item_uid = doPlayerAddItem(cid,8929,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 1706 then --segundo bau--
queststatus = getPlayerStorageValue(cid,1701)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Star")
item_uid = doPlayerAddItem(cid,7366,1)
setPlayerStorageValue(cid,1701,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

else
return 0
end
return 1
end