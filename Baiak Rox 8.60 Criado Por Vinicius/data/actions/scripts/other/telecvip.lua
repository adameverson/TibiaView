function onUse(cid, item, frompos, item2, topos)
pos = {x=547, y=332, z=7}
if item.itemid == 4852 then

doPlayerSendCancel(cid,"Abra o bau para se tornar vip!")
doTeleportThing(cid,pos)
doRemoveItem(item.uid,1)
else

doPlayerSendCancel(cid,"Fail !")


end

return 1

end 