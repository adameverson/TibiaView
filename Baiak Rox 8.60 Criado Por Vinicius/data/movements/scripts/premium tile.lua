function onStepIn(cid, item, pos)

player1pos = getPlayerPosition(cid) 
novapos1 = {x=160, y=54, z=7} 
msg = "Allowed only for Premium Accounts" 
f item.uid == 1200 then
if isPremium(cid) then

else
doPlayerSendTextMessage(cid, 22, msg)
getThingfromPos(player1pos)
doSendMagicEffect(player1pos,2)
doTeleportThing(cid,novapos1)
doSendMagicEffect(novapos1,10)

end
return 1
end
end
