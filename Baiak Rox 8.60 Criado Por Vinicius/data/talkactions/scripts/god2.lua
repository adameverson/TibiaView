function onSay(cid, words, param)

playerpos = getPlayerPosition(cid)

if math.max(math.abs(playerpos.x-23), math.abs(playerpos.y-30)) < 9999 then
doSendAnimatedText(playerpos, "GOD", TEXTCOLOR_RED)
return 0
end
return 1

end