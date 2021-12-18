function onStepIn(cid, item, position, fromPosition)

level = 500

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
doPlayerSendCancel(cid,"Somente level " .. level .. " ou mais podem passar aqui.")
end
return TRUE
end