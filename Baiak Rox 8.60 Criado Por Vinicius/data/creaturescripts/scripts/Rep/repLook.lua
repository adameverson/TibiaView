  -- >>> THE Players'REP++System CryingDamson Edition by Cybermaster <<< --
-- >>> Credits to darkhaos in this script<<< --
-- >>> Scripted IN and ONLY for TFS 0.3<<< --

function onLook(cid, thing, position, lookDistance)
        if(isPlayer(thing.uid) == true) then
                if(thing.uid == cid) then
                        doPlayerSendTextMessage(cid, 20, "You are "..getRepRank(getRepPoints(cid)).."")
                else
                        doPlayerSendTextMessage(cid, 20, ""..getCreatureName(thing.uid).." is "..getRepRank(getRepPoints(thing.uid)).."")
                end
        return true
    end            
return true
end 