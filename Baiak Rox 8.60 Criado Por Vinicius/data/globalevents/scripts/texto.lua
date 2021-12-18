local config = {
    positions = {
        ["Mapa Rox"] = { x = 160, y = 54, z = 7 },
        ["Vip City"] = { x = 167, y = 49, z = 7 },
        ["Vip"] = { x = 153, y = 44, z = 7 },
        ["Castle!"] = { x = 166, y = 54, z = 7 },
        ["AreaPvp"] = { x = 151, y = 53, z = 7 },
        ["NovasHunt"] = { x = 282, y = 531, z = 7 },
        ["Teleports"] = { x = 151, y = 50, z = 7 },
        ["QuestVip"] = { x = 151, y = 54, z = 7 },
        ["Depot"] = { x = 151, y = 55, z = 7 },
        ["Lixo"] = { x = 158, y = 49, z = 7 },
        ["Especiais"] = { x = 177, y = 62, z = 7 },
        ["Treiners"] = { x = 153, y = 50, z = 7 },
        ["|Vip 3|"] = { x = 144, y = 46, z = 7 },
	["|Vip 3| "] = { x = 145, y = 46, z = 7 },
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  