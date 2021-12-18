local look = {lookType = 152, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, pos)
doCreatureChangeOutfit(cid, look)
end