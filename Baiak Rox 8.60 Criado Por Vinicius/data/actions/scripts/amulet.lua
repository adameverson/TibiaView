-- Vip Amulet Quest By Bryaan Xtibia!

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 1804 then
   		queststatus = getPlayerStorageValue(cid,1804)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce ganhou seu Vip Amulet!.")
   			doPlayerAddItem(cid,7890,1)
   			setPlayerStorageValue(cid,1804,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Empty")
   		end
      	else
		return 0
   	end

   	return 1
end
