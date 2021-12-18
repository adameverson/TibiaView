--Cyber's REPutation System Rev5.0 
function onLook(cid, thing, position, lookDistance)
	if isPlayer(thing.uid) then 
		doPlayerSetSpecialDescription(thing.uid,'.\n' .. (thing.uid == cid and 'You are' or rep.getArticle(thing.uid, true) .. ' is') .. ' ' .. rep.getRank(rep.getPoints(thing.uid)))
    end            
return true
end