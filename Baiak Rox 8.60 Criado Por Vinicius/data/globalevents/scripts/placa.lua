local pos =
{
    {{x = 105, y = 38, z = 7}, {x = 105, y = 38, z = 7, stackpos = 253}},
    }
function onThink(cid, interval, lastExecution)
    for _, positions in pairs(pos) do
        doSendMagicEffect(positions[1], 55)
        if getThingFromPos(positions[2]).itemid > 0 then
            for _, name in pairs(getOnlinePlayers()) do
                local player = getPlayerByName(name)
                    doSendAnimatedText(positions[1], "Items iniciais", 18)
            end
        end
    end
return TRUE
end  