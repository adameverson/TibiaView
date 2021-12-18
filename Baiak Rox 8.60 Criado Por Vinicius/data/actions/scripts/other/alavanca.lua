function onUse(cid, item, frompos, item2, topos)

pos = {x=71, y=167, z=7, stackpos=253}
ppos = getPlayerPosition (cid)

if item.uid == 4598 and item.itemid == 1945 then
doTeleportThing(cid,pos)
doSendMagicEffect(pos,10)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 4598 and item.itemid == 1946 then
doTeleportThing(cid,pos)
doSendMagicEffect(pos,10)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end
