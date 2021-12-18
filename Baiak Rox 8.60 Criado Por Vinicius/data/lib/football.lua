-- 1 - exit pos , 2 - team 1 ball, 3 - team 2 ball, 4 - team1frompos, 5 -team2frompos, 6 - team1topos, 7 - team2topos, 8-team1gate aid, 9 - team2game aid, 10 - speed, 11 - match time, 12 - highest uid + 1, 13 - field size
football_positions_uids = {}
football_positions_uids[1] = {23301,23302,23303, {23304,23305,23306}, {23307,23308,23309}, {23310,23311,23312}, {23313,23314,23315}, 23311, 23312, 450, 3, 23315, {8,3}}
football_positions_uids[2] = {23320,23321,23322, {23323,23324}, {23325,23326}, {23327,23328}, {23329,23330}, 23321, 23322, 450, 3, 23330, {6,2}}
football_positions_uids[3] = {23340,23341,23342, {23343,23344}, {23345,23346}, {23347,23348}, {23349,23350}, 23341, 23342, 450, 3, 23350, {6,2}}
teleport_players_on_goal = true


function footballGoal(pos, ball, team1pos, team2pos, goalStorage, ballpos) -- add goal to team 1/2 score, show "GOAL", animations, teleport ball and players
    setGlobalStorageValue(goalStorage, getGlobalStorageValue(goalStorage)+1)
    if(teleport_players_on_goal) then
        for i = 1 , #team1pos do
            doTeleportThing(getGlobalStorageValue(team1pos[i]), getThingPos(team1pos[i]), TRUE)
        end
        for i = 1 , #team2pos do
            doTeleportThing(getGlobalStorageValue(team2pos[i]), getThingPos(team2pos[i]), TRUE)
        end
    end
    doSendMagicEffect(pos, CONST_ME_BATS)
    doTeleportThing(ball.uid, ballpos, TRUE)
    doSendMagicEffect(ballpos, CONST_ME_MAGIC_GREEN)
    doSendAnimatedText(ballpos, "GOAL!", TEXTCOLOR_TEAL)
end

function footballGetBall(startFromPos, fieldSize) -- get ball uid or create new and return uid, remove all balls from football field (if any exist)
    ball = 0
    for ix = startFromPos.x - fieldSize[1], startFromPos.x + fieldSize[1] do
        for iy = startFromPos.y - fieldSize[2], startFromPos.y + fieldSize[2] do
            tmpBall = getTileItemById({x=ix, y=iy, z=startFromPos.z}, 2109)
            if(tmpBall.uid > 0) then
                if(ball == 0) then
                    ball = tmpBall.uid
                else
                    doRemoveItem(tmpBall.uid)
                end
            end
        end
    end
    if(ball == 0) then
        return doCreateItem(2109, 1, startFromPos)
    else
        return ball
    end
end  