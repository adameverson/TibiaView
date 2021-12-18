function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 35400 then
queststatus = getPlayerStorageValue(cid,35400)
if queststatus == -1 or queststatus == 0 then
                doCreatureSay(cid, "VOcê recebeu seu beneficio por ser Donate!", TALKTYPE_ORANGE_1)
         db.executeQuery("UPDATE `players` SET `name` = '|D.N.T| "..getCreatureName(cid).."' WHERE `id` = "..getPlayerGUID(cid)..";")              
         doPlayerSendTextMessage(cid,25,"Você será kickado em 5 segundos para mudança de nome.")   
doPlayerAddAddons(cid, 1)         
         addEvent(doRemoveCreature, 5*1000, cid, true)  
                setPlayerStorageValue(cid, 35400, 1)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
        else
                doPlayerSendTextMessage(cid,22,"você ja tem o |D.N.T| no nome.")
        end
        return true
end
end

