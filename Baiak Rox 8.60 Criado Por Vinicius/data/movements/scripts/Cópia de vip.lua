function onStepIn(cid, item, pos)



-- teleports config
teleport1 ={x=154, y=43, z=7}



if isPlayer(cid) then

if item.actionid == 13540 then

vip = getPlayerStorageValue(cid,13540)
if vip == -1 then
doPlayerSendCancel(cid,"Esta área é exclusiva para players Vips2.Para Adquirir vip2 faça a Quest Vip")


doTeleportThing(cid,teleport1)


else

end

end

end

end
