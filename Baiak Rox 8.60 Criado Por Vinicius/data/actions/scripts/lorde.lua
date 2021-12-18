function onUse(cid, item, frompos, item2, topos)


if item.uid == 6088 then
if getPlayerStorageValue(cid,6088) == -1 then
doPlayerSendTextMessage(cid,25,"fernando.")
doPlayerAddItem(cid,2148,15)
setPlayerStorageValue(cid,6017,1)
else
doPlayerSendTextMessage(cid,25,"The is empty.")
end

end
return TRUE
end