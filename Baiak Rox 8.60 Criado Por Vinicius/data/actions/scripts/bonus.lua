-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1604 then
   		queststatus = getPlayerStorageValue(cid,1604)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce recebeu 100k de bonus!.")
   			doPlayerAddItem(cid,2160,10)
   			setPlayerStorageValue(cid,1604,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou o bonus")
   		end
      	else
		return 0
   	end

   	return 1
end
