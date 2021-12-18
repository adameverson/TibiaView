--Cyber's REPutation System Rev5.0 
function onKill(cid, target, lastHit)
	if not isPlayer(cid) or not isMonster(target) then
		return true
	end

	local monsters = {
		["demon"] = 3,
		["behemoth"] = 4,
		["hellfire fighter"] = 5,
		["orshabaal"] = 10,
	}
		
	local name = getCreatureName(target)
	local monster = monsters[string.lower(name)]
		
	if monster then
		rep.add(cid, monsters[string.lower(getCreatureName(target))], TEXTCOLOR_LIGHTBLUE)
	end
return true
end