 <?PHP
//Litle Config
$MaxShow = 20;
//END

if($action == '')
{
$main_content .= '
<P ALIGN=CENTER>
    <br>
    <FONT SIZE=4 COLOR=#8A0808>
        Como usar...
    </FONT>
    <br>
    <br>
    <FONT SIZE=2 COLOR=#DF0101>
    * <b>/war-invite</b> :
        <FONT SIZE=1 COLOR=green>
            Enviar um convite para iniciar uma War.<br>
            <u>Exemplo</u>: /war-invite Feel the Power
        </FONT><br>
    * <b>/war-accept</b> :
        <FONT SIZE=1 COLOR=green>
            Aceitar o convite para iniciar a War.
        </FONT><br>
    * <b>/war-reject</b> :
        <FONT SIZE=1 COLOR=green>
            Rejeitar o convite.
        </FONT><br>
    * <b>/war-cancel-invite</b> :
        <FONT SIZE=1 COLOR=green>
            Cancelar o convite.
        </FONT><br>
    * <b>/war-cancel</b> :
        <FONT SIZE=1 COLOR=green>
            Terminar a War, so pode ser usado apos 5 dias.
        </FONT><br>
    </FONT>
    <br>
    <FONT SIZE=2 COLOR=#8A0808>
        Esses comandos podem somente ser executados por lideres da guild.<br><br>
        <table border="1"><tr border="1"><td border="1"><h3>Obs:</h3>
        <ul>
        <li>Seu time so ganhara frag se matar quem esta na guild inimiga.</li>
        <li>Se alguen do mesmo time se matar sera descontado um frag da guild.</li>
        <li>Todos os frag da war nao sera contados como "Unjusted kills".</li>
        <li>Quando iniciada uma War so podera ser encerrada apos 5 dias.</li>
     </ul></td></tr></table>
    </FONT>
</P>
';
$wars = $SQL->query("
    SELECT g.name AS gname, wg.name AS wgname, g.war_time AS gtime, g.kills AS kills, wg.kills AS ekills, g.show AS s, g.id AS gid, wg.id AS wgid
        FROM guilds AS g
    INNER JOIN guilds AS wg
        ON wg.id = g.in_war_with
    ORDER BY s DESC LIMIT 50;
");
foreach ($wars as $k=>$v) {
if ($v[s] == 1) 
{
    $stats .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[gid] . "'>$v[gname]</a>
                    </b>
                </center>
            </TD>
            <TD>V/s</TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[wgid] . "'>$v[wgname]</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    " . data("d/m/y   H:i:s", $v[gtime]) . "
                </center>
            </TD>
            <TD>
                <center>
                    <a href='index.php?subtopic=wars&action=show&war=" . $v[gid] . "'>{$v[kills]} - {$v[ekills]}</a>
                </center>
            </TD>    
        </TR>
    ";
}
}
$main_content .= '
    <center>
        <h1>
            Guilds Wars
        </h1>
    </center>
';
if(!$stats) {
    $main_content .= '
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR="'.$config['site']['vdarkborder'].'">
                <TD CLASS=white>
                </TD>
            </TR>
            <TR BGCOLOR='.$config['site']['darkborder'].'>
                <TD>
                    Nenhuma guild em War no '.$config['server']['serverName'].'.
                </TD>
            </TR>
        </TABLE>
    ';
} else {
    $main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
                <TD CLASS=white width=25%>
                    <center><B>Guild</B></center>
                </TD>
                <TD CLASS=white width=5%>
                    <B>V/s</B>
                </TD>
                <TD CLASS=white width=25%>
                    <center><B>Guild</B></center>
                </TD>
                <TD CLASS=white width=25%>
                    <center><B>Started at</B></center>
                </TD>
                <TD CLASS=white width=20%>
                    <center><B>Kills</B></center>
                </TD>
            </TR>
            $stats
        </TABLE>
    ";    
}

?>

<?PHP
$invitations = $SQL->query("
    SELECT ig.name AS igname, i.name AS iname, i.id AS iid, ig.id AS igid


        FROM guilds AS i
    INNER JOIN guilds AS ig
        ON ig.id = i.invited_to
    ORDER BY iname ASC LIMIT 50;    
");
foreach ($invitations as $k=>$v) {
    $invi .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[iid] . "'>$v[iname]</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=guilds&action=show&guild=" . $v[igid] . "'>$v[igname]</a>
                    </b>
                </center>
            </TD>
            <TD></TD>
        </TR>
    ";
}
$main_content .= '
    <center>
        <h1>
            Invitacoes Pendentes
        </h1>
    </center>
';
if(!$invi) {
    $main_content .= '
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR="'.$config['site']['vdarkborder'].'">
                <TD CLASS=white>
                </TD>
            </TR>
            <TR BGCOLOR='.$config['site']['darkborder'].'>
                <TD>
                    Nenhuma invitacao pendente no '.$config['server']['serverName'].'.
                </TD>
            </TR>
        </TABLE>
    <br>
      <div style="text-align: right; margin: 20px auto; font-size: 10px;">
      Script by <a target="blank" href="http://otland.net/members/xampy/">Xampy</a> edited by <a href="http://www.xtibia.com/forum/allan1001-m205633.html">Allan</a></div>
    ';
} else {
    $main_content .= "
        <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
            <TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
                <TD CLASS=white width=50%>
                    <center><B>Guild</B></center>
                </TD>        
                <TD CLASS=white width=50%>
                    <center><B>Invited guild</B></center>
                </TD>
                </TD>
            </TR>
            $invi
        </TABLE>
    ";
}
}

//SHOW FRAGS ~~
if($action == 'show')
{
$guild = $ots->createObject('Guild'); 
$guild->load($_REQUEST['war']);
$ranks = $SQL->query("
    SELECT 
        *
    FROM 
        guild_ranks 
    WHERE 
        guild_id = ". $guild->getId() .";
    ");

foreach ($ranks as $y)
{
    $Players = $SQL->query("
    SELECT 
        *
    FROM 
        players 
    WHERE 
        rank_id = ". $y[id] ." 
    ORDER BY
        name
    DESC;");
    foreach ($Players as $v)
    {
    $totDeaths = 0;
    $deaths = $SQL->query("
    SELECT  
        COUNT(player_id) AS n
    FROM 
        deaths_in_wars
    WHERE 
        player_id = ". $v[id] ." 
    GROUP BY 
        player_id
    DESC LIMIT 1;");
        foreach ($deaths as $q)
        {
            $totDeaths = $q[n];
        }
    $membersDeaths .="
        <center>
            <b>
                <a href='index.php?subtopic=characters&name=" . $v[name] . "'>$v[name]</a> ($totDeaths)
            </b>
        </center>
    ";
    }
}

$guild2 = $ots->createObject('Guild'); 
$guild2->load($guild->getCustomField(in_war_with));
$ranks2 = $SQL->query("
    SELECT 
        *
    FROM 
        guild_ranks 
    WHERE 
        guild_id = ". $guild2->getId() .";
    ");

foreach ($ranks2 as $y)
{
    $Players = $SQL->query("
    SELECT 
        *
    FROM 
        players 
    WHERE 
        rank_id = ". $y[id] ." 
    ORDER BY
        name
    DESC;");
    foreach ($Players as $v)
    {
    $totDeaths2 = 0;
    $deaths = $SQL->query("
    SELECT  
        COUNT(player_id) AS n
    FROM 
        deaths_in_wars
    WHERE 
        player_id = ". $v[id] ." 
    GROUP BY 
        player_id
    DESC LIMIT 1;");
        foreach ($deaths as $q)
        {
            $totDeaths2 = $q[n];
        }
    $membersDeaths2 .="
        <center>
            <b>
                <a href='index.php?subtopic=characters&name=" . $v[name] . "'>$v[name]</a> ($totDeaths2)
            </b>
        </center>
    ";
    }
}

$deathsG1 = $SQL->query("
    SELECT 
        * 
    FROM 
        deaths_in_wars 
    WHERE 
        killer_guild = ". $guild->getId() ." 
    ORDER BY 
        data 
    DESC LIMIT ". $MaxShow .";");

$deathsG2 = $SQL->query("
    SELECT 
        * 
    FROM 
        deaths_in_wars 
    WHERE 
        killer_guild = ". $guild2->getId() ." 
    ORDER BY 
        data
    DESC LIMIT ". $MaxShow .";");

$Topfragger1 = $SQL->query("
    SELECT 
        killer, COUNT(killer) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild->getId() ." 
    GROUP BY 
        killer
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($Topfragger1 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[killer]);
            $TopFraggerName = $name->getName();
            $numTop1 = $y[maximo];
        }
        
$Topfragger2 = $SQL->query("
    SELECT 
        killer, COUNT(killer) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild2->getId() ." 
    GROUP BY 
        killer
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($Topfragger2 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[killer]);
            $TopFraggerName2 = $name->getName();
            $numTop2 = $y[maximo];
        }
        
$mostDead = $SQL->query("
    SELECT 
        player_id, COUNT(player_id) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild->getId() ." 
    GROUP BY 
        player_id
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($mostDead as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[player_id]);
            $mostDeadName = $name->getName();
            $mostDeadNum = $y[maximo];
        }

$mostDead2= $SQL->query("
    SELECT 
        player_id, COUNT(player_id) maximo
    FROM 
        deaths_in_wars
    WHERE 
        killer_guild =     ". $guild2->getId() ." 
    GROUP BY 
        player_id
    ORDER BY 
        maximo 
    DESC LIMIT 1;");
    
    foreach ($mostDead2 as $y) 
        {
            $name = $ots->createObject('Player');
            $name->load($y[player_id]);
            $mostDeadName2 = $name->getName();
            $mostDeadNum2= $y[maximo];
        }

foreach ($deathsG1 as $k=>$v) {
    
    $killed = $ots->createObject('Player');
    $killed->load($v[player_id]);
    $killedName = $killed->getName();

    $killer = $ots->createObject('Player');
    $killer->load($v[killer]);
    $killerName = $killer->getName();
    
    $kills .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killedName . "'>$killedName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killerName . "'>$killerName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    " . data("d/m/y   H:i:s", $v[data]) . "
                </center>
            </TD>
        </TR>
    ";
}

foreach ($deathsG2 as $k=>$v) {
    
    $killed = $ots->createObject('Player');
    $killed->load($v[player_id]);
    $killedName = $killed->getName();

    $killer = $ots->createObject('Player');
    $killer->load($v[killer]);
    $killerName = $killer->getName();
    
    $kills2 .="
        <TR BGCOLOR=\"".$config['site'][($k % 2 == 1 ? 'light' : 'dark').'border']."\">
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killedName . "'>$killedName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    <b>
                        <a href='index.php?subtopic=characters&name=" . $killerName . "'>$killerName</a>
                    </b>
                </center>
            </TD>
            <TD>
                <center>
                    " . data("d/m/y   H:i:s", $v[data]) . "
                </center>
            </TD>
        </TR>
    ";
}
$main_content .= "
    <center>
    <b>
        <h2>
        Guilds em War 
            <a href='index.php?subtopic=guilds&action=show&guild=" . $guild->getId() . "'>
                " . $guild->getName() . "</a> 
        Versus 
            <a href='index.php?subtopic=guilds&action=show&guild=" . $guild2->getId() . "'>
                " . $guild2->getName() . "</a>
        .
        </h2>
    <br>
    Iniciada em : </b>" . data("d/m/y   H:i:s", $guild->getCustomField(war_time)) . "
    <br>
    <br>
    <b>
    Total Frags da " . $guild->getName() . " = " . $guild->getCustomField(kills) . "
    <br>
    <br>
    Total Frags da " . $guild2->getName() . " = " . $guild2->getCustomField(kills) . "
    <br>
    <br>
    Top fragger da " . $guild->getName() . " = <a href='index.php?subtopic=characters&name=" . $TopFraggerName  . "'>" . $TopFraggerName  . "</a> ($numTop1)
    <br>
    <br>
    Top fragger da " . $guild2->getName() . " = <a href='index.php?subtopic=characters&name=" . $TopFraggerName2  . "'>" . $TopFraggerName2  . "</a> ($numTop2)
    <br>
    <br>
    O mais noob da  " . $guild->getName() . " = <a href='index.php?subtopic=characters&name=" . $mostDeadName  . "'>" . $mostDeadName2  . "</a> ($mostDeadNum2)
    <br>
    <br>
    O mais noob da  " . $guild2->getName() . " = <a href='index.php?subtopic=characters&name=" . $mostDeadName2  . "'>" . $mostDeadName  . "</a> ($mostDeadNum)    
    </b>
    </center>
    <br>
    <br>
    <br>
    
";

$main_content .= "
    <center>
    <h1>
        Mortes dos Membros
    </h1>
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
            <TD CLASS=white width=50%>
                <center>
                    <B>
                        ". $guild->getName() ."
                    </B>
                </center>
            </TD>
            <TD CLASS=white width=50%>
                <center>
                    <B>
                        ". $guild2->getName() ."
                    </B>
                </center>
            </TD>
        </TR>
        <TR BGCOLOR=\"".$config['site']['darkborder']."\">
            <TD>
                $membersDeaths
            </TD>
            <TD>
                $membersDeaths2
            </TD>
        </TR>


    </TABLE>
    </center>
    <br>
    <br>
    <br>
    <center>
        <h1>
            Latest frags by ". $guild->getName() ."
        </h1>
    </center>
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
            <TD CLASS=white width=35%>
                <center>
                    <B>
                        Player
                    </B>
                </center>
            </TD>
            <TD CLASS=white width=35%>
                <center>
                    <B>
                        Killed by
                    </B>
                </center>
            </TD>
            <TD CLASS=white width=30%>
                <center>
                    <B>
                        Data
                    </B>
                </center>
            </TD>
        </TR>
        $kills
    </TABLE>
        <center>
        <h1>
            Ultimo frag da ". $guild2->getName() ."
        </h1>
    </center>
    <TABLE BORDER=0 CELLSPACING=1 CELLPADDING=4 WIDTH=100%>
        <TR BGCOLOR=\"{$config['site']['vdarkborder']}\">
            <TD CLASS=white width=35%>
                <center>
                    <B>
                        Player
                    </B>
                </center>
            </TD>
            <TD CLASS=white width=35%>
                <center>
                    <B>
                        Killed by
                    </B>
                </center>
            </TD>
            <TD CLASS=white width=30%>
                <center>
                    <B>
                        Data
                    </B>
                </center>
            </TD>
        </TR>
        $kills2
    </TABLE>
";
}
?>