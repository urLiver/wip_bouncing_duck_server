init()
{
    level thread chatlistener();
}

findplayer( var_0 )
{
    name = ToLower( var_0 );
    ret = undefined;
    potentialpeople = 0;

    foreach( player in level.players )
    {
        targetname = ToLower( player.name );

        if( targetname == name )
        {
            return player;
        }

        if( GetSubStr( targetname, 0, name.size ) == name )
        {
            potentialpeople++;
            ret = player;
        }
    }

    if( potentialpeople == 1 )
    {
        return ret;
    } 

    return undefined;
}

chatlistener()
{
    prefix = "?";
    prefix_all = "@";

    level endon( "game_ended" );

    for( ;; )
    {
        level waittill( "say", msg, player );
        
        if( msg[ 0 ] != prefix && msg[ 0 ] != prefix_all )
        {
            msg = GetSubStr( msg, 1 );
        }

        if( msg[ 0 ] != prefix && msg[ 0 ] != prefix_all )
        {
            continue;
        }

        prefix_cur = msg[ 0 ];

        msg = GetSubStr( msg, 1 );
        
        cmds = StrTok( msg, " " );

        if( ! isdefined( cmds[ 0 ] ) )
        {
            continue;
        }

        cmd = ToLower( cmds[ 0 ] );

        switch( cmd )
        {
            case "prestige":
                player thread scripts\custom\_database::promote_prestige();
            break;
            
            case "stats":
                target = player;

                if( isdefined( cmds[ 1 ] ) )
                {
                    ret = findplayer( cmds[ 1 ] );

                    if( isdefined( ret ) )
                    {
                        target = ret;
                    }
                }

                guid = ToLower( target.guid );

                if( prefix_cur == "@" )
                { 
                    say( "Stats for: ^6" + target.name );
                    say( "Kills: ^6" + level.player_stats[ guid ][ "total_kills" ] + " ^7Deaths: ^6" + level.player_stats[ guid ][ "total_deaths" ] );
                    say( "K/D: ^6" + float( level.player_stats[ guid ][ "total_kills" ] / level.player_stats[ guid ][ "total_deaths" ] ) );
                }
                else
                {
                    player tell( "Stats for: ^6" + target.name );
                    player tell( "Kills: ^6" + level.player_stats[ guid ][ "total_kills" ] + " ^7Deaths: ^6" + level.player_stats[ guid ][ "total_deaths" ] );
                    player tell( "K/D: ^6" + float( level.player_stats[ guid ][ "total_kills" ] / level.player_stats[ guid ][ "total_deaths" ] ) );
                }
            break;
        }
    }
}