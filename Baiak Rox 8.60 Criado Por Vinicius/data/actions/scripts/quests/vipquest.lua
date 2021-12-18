CODE
function onUse(cid, item, frompos, item2, topos)
if item.uid == 20010 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,20010)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Arrow")
item_uid = doPlayerAddItem(cid,2352,1)
setPlayerStorageValue(cid,20010,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 20011 then --segundo bau--
queststatus = getPlayerStorageValue(cid,20010)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Vip Axe")
item_uid = doPlayerAddItem(cid,8925,1)
setPlayerStorageValue(cid,20010,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

elseif item.uid == 20012 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,20010)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Vip Club")
item_uid = doPlayerAddItem(cid,8927,1)
setPlayerStorageValue(cid,20010,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end

else
return 0
end
return 1
end