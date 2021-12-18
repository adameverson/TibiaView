function onStepIn(cid, item, pos)


if isPlayer(cid) then

if item.actionid == 13079 then
doSendAnimatedText(pos,"Bem Vindo",TEXTCOLOR_BLUE)
doSendMagicEffect(pos,12)
else
return 0
end
return 100
end
end