function onUse(cid, item, frompos, item2, topos)
piece1pos = {x=849, y=552, z=8, stackpos=1}
rockpos = {x=849, y=552, z=8, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 1552 and item.itemid == 1945 and getpiece1.itemid == 1354 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 1552 and item.itemid == 1946 then
doCreateItem(1354,1,rockpos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

