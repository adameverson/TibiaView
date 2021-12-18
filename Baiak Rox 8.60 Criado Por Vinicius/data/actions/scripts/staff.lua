-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1609 then
   		queststatus = getPlayerStorageValue(cid,1609)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce recebeu Sua Staff De Iniciante. Bom Jogo!.")
   			doPlayerAddItem(cid,2437,1)
   			setPlayerStorageValue(cid,1609,1)
			setPlayerStorageValue(cid,2160,100)
			setPlayerStorageValue(cid,2160,100)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou o bonus")
   		end
      	else
		return 0
   	end

   	return 1
end
