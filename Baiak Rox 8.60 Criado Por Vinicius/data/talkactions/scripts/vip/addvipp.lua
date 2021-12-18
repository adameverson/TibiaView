function onSay(cid, words, param)
         if param == "" then
            return  doPlayerPopupFYI(cid,"Está com problemas?\n Aprenda os comandos!\n---------------\nAdicionar vip:\n/vip add days player\n/vip add 30 Styller\n---------------\nDeletar vip:\n/vip del player\n/vip del Styller\n---------------\nVer a vip:\n/vip see player\n/vip see Styller\n---------------\n")
         end
         if param:lower():find('add') == 1 and 3 then
            local _,_,id,name = param:lower():find('add (%d+) (.+)')
            name = name or ""
            id = tonumber(id or 1) or 1
            if tonumber(id) == nil or getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,25,"Adicionar vip:\n/vip add days player\n/vip add 30 Styller\n [Player: "..name.."]")
            end  
            if isPlayer(getPlayerByName(name)) == TRUE then
            vip.addVipByAccount(getPlayerAccount(getPlayerByName(name)) ,vip.getDays(id))

            doPlayerSendTextMessage(cid,25,"Foram adicionados "..tonumber(id).." dias de vip a "..name..".")
            doPlayerSendTextMessage(getPlayerByName(name),25,"Você recebeu "..tonumber(id).." dias de vip.")
         else
           doPlayerSendTextMessage(cid,25,name.." não esta online ou não existe.")
         end
         elseif param:lower():find('del') == 1 and 3 then
            local _,_,name = param:lower():find('del (.+)')
            if getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,25,"Deletar vip:\n/vip del player\n/vip del Styller\n")
            end

            vip.setVipByAccount(getPlayerAccount(getPlayerByName(name)),-os.time())
            doPlayerSendTextMessage(cid,25,"A vip de "..name.." foi apagada.")                                                                                                                                               
         elseif param:lower():find('see') == 1 and 3 then
            local _,_,name = param:lower():find('see (.+)')
            name = name or ""
            if getPlayerByName(name) == false then
               return doPlayerSendTextMessage(cid,25,"Ver a vip:\n/vip see player\n/vip see Styller\n")
            end
            local ret_ = vip.getVip(getPlayerByName(name))
            if ret_ == 0 then
              return doPlayerSendTextMessage(cid, 25,name.." Não tem vip, e nunca teve.")
            else
              return doPlayerSendTextMessage(cid, 25, "A vip de "..name.." Acaba/terminou em "..os.date("%d %B %Y %X ",ret_))
            end
         end
         return TRUE
end