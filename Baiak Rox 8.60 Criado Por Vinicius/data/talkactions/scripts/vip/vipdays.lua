function onSay(cid, words, param)
         if vip.hasVip(cid) == TRUE then
            doPlayerSendTextMessage(cid, 22, "Your vip end in "..os.date("%d %B %Y %X ",vip.getVip(cid)))
         else
             if vip.getVip(cid) ~= 0 then
                doPlayerSendTextMessage(cid, 22, "You're not a vip player. Your vip has finished in "..os.date("%d %B %Y %X ", vip.getVip(cid)).." and now is "..os.date("%d %B %Y %X ", os.time()))
             else
                doPlayerSendTextMessage(cid, 22, "You're not a vip player. You naver has a vip.")
             end
         end
         return TRUE
end