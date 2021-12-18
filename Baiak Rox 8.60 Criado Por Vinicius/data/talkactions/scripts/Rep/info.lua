  -- >>> THE Players'REP++System CryingDamson Edition by Cybermaster <<< --
-- >>> Scripted IN and ONLY for TFS 0.3<<< --

function onSay(cid, words, param, channel)

local o, points, action = getCreatureOutfit(cid), getRepPoints(cid), false --do not modify
doPlayerSendTextMessage(cid, 19, "You have " .. points .. " rep points. You are " .. getRepRank(points) .. ".")
        if points > 4999 and getPlayerSex(cid) == 0 then --female rep+++ queen outfit
                disguise, text, action = {lookType = 331}, "Queen!!", true
        elseif points > 4999 and getPlayerSex(cid) > 0 then --male rep+++ king outfit
                disguise, text, action = {lookType = 332}, "King!!", true
        elseif points > 1999 then --rep++ cm outfit
                disguise, text, action = {lookType = 266}, "Legend!!", true
        elseif points > 1499 then --rep+ hero outfit
                disguise, text, action = {lookType = 73}, "Hero!!", true
        elseif points < -4999 then --rep*** devil outfit
                disguise, text, action = {lookType = 40}, "Devil!!", true
        elseif points < -1999  then --rep** pig outfit --
                disguise, text, action = {lookType = 60}, "Pig!!", true
        elseif points < -1499 then --rep* orc outfit --
                disguise, text, action = {lookType = 5}, "Orc!!", true
        end
        if action == true then
                doCreatureChangeOutfit(cid, disguise)
                doSendAnimatedText(getCreaturePosition(cid), text, math.random(01,255))
        return true
        end
end 