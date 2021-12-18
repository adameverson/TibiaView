function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Voce Esta jogando no Baiak Yurots Editado por ROX!! 

     Novo Comando Adcionado !aol, !bless e !removeskull por 1kk!
  
    Vip2 na quest vip!

    Vip 3 na quest vip 3!

Bom Jogo]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end