--Cyber's REPutation System Rev5.0 
local t = {
	[SKULL_WHITE] = 15, 
	[SKULL_RED] = 30, 
	[SKULL_BLACK] = 45, 
	[SKULL_NONE] = -30,
	}

function onKill(cid, target, lastHit)
	if isPlayer(cid) and isPlayer(target) then
		--THE KILLER 
		if isInArray({0,3,4,5}, getCreatureSkullType(target)) then
			if getPlayerLevel(target) >= rep.pvpLevel and not isInArray(rep.skull, getCreatureSkullType(cid)) then
				doSendAnimatedText(getCreaturePosition(cid), getCreatureSkullType(target) == 0 and '-REP' or '+REP', math.random(1,255))
				rep.set(cid, rep.getPoints(cid)+t[getCreatureSkullType(target)])
				doPlayerSendTextMessage(cid, 20, 'You '.. (getCreatureSkullType(target) == 0 and 'lose' or 'gain') ..' reputation because you killed a player.')
			end
		end
		--THE VICTIM
		if rep.getPoints(target) == 0 then 
			return true
		elseif rep.getPoints(target) > 0 then
			rep.remove(target, 5, TEXTCOLOR_RED)
			doPlayerSendTextMessage(target, 20, 'You lose reputation because you were killed by a player.')
		else
			rep.add(target, 5, TEXTCOLOR_LIGHTBLUE)
			doPlayerSendTextMessage(target, 20, 'You lose reputation because you were killed by a player.')
		end
	end
return true
end