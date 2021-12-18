-- Vip Amulet Quest By Tech Xtibia!

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1805 then
   		queststatus = getPlayerStorageValue(cid,1805)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce ganhou sua Vip Stone.")
   			doPlayerAddItem(cid,4852,1)
   			setPlayerStorageValue(cid,1805,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Empty")
   		end
      	else
		return 0
   	end

   	return 1
end
