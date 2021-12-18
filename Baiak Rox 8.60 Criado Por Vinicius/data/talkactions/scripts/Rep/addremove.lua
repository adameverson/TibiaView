  -- >>> THE Best REP++System CryingDamson Edition by Cybermaster <<< --
-- >>> Scripted IN and ONLY for TFS 0.3<<< --
-- >>> t[1] is Player Name, t[2] is Rep Amount<<< --

function onSay(cid, words, param)

if(param == "") then
        doPlayerSendCancel(cid,"You have to type a player name.")
    return TRUE
    end

local t = string.explode(param, ",")
local tid = getPlayerByName(t[1])

        if(isPlayer(tid) == false) then
                doPlayerSendCancel(cid, "Player " .. param .. " not found or is offline.")
    return TRUE
    end
       
        if getPlayerSex(tid) == 0 then
                sex = 'she'
        else
                sex = 'he'
        end
       
        if(not t[2]) and (isPlayer(tid) == true) then  
                if (words == '/hail') then
                        addPlayerRep(tid, 5, TEXTCOLOR_TEAL)
                        doPlayerSendCancel(cid, "You added +5 rep points to " .. getPlayerName(tid) .. ", and now " .. sex .. " has " .. getRepPoints(tid) .. " rep points.")
                        return true
                end
               
                if words == '/fuck' then
                        removePlayerRep(tid, 5, TEXTCOLOR_RED)
                        doPlayerSendCancel(cid, "You removed -5 rep points to " .. getPlayerName(tid) .. ", and now " .. sex .. " has " .. getRepPoints(tid) .. " rep points.")
                        return true
        end
        end
       
        if (t[2]) and (words == '/set') or (words == '/hail') or (words == '/fuck') then
                if (not tonumber(t[2])) then
                        doPlayerSendCancel(cid, "Rep amount invalid.")
                return true
                end                                    
        end
       
        if words == '/hail' then
                addPlayerRep(tid, t[2], TEXTCOLOR_TEAL)
                doPlayerSendCancel(cid, "You added  " .. t[2] .. " rep points to " .. getPlayerName(tid) .. ", and now " .. sex .. " has " .. getRepPoints(tid) .. " rep points.")
                return true
        end
               
        if words == '/fuck' then
                removePlayerRep(tid, t[2], TEXTCOLOR_RED)
                doPlayerSendCancel(cid, "You removed  " .. t[2] .. " rep points to " .. getPlayerName(tid) .. ", and now " .. sex .. " has " .. getRepPoints(tid) .. " rep points.")
                return true
        end
               
        if (t[2]) and (words == '/set') then
                setPlayerRep(tid, t[2])
                doPlayerSendCancel(cid, "You have set " .. getPlayerName(tid) .. "'s rep points to " .. getRepPoints(tid) .. ".")
        else
                doPlayerSendCancel(cid, "Absolute rep amount not specified.")
                return true
        end
       
        if(not t[2]) then
                doPlayerSendCancel(cid, "Absolute rep amount not specified.")
                return true
        end
       
        return true
end 