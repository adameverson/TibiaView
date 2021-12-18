-- bonus by bryaan

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1606 then
   		queststatus = getPlayerStorageValue(cid,1606)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce ganhou 1kk de bonus.")
   			doPlayerAddItem(cid,2160,100)
   			setPlayerStorageValue(cid,1606,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou o bonus")
   		end
      	else
		return 0
   	end

   	return 1
end
