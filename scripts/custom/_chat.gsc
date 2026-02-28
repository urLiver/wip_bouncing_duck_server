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

        if( !isdefined( cmds[ 0 ] ) )
        {
            continue;
        }

        cmd = ToLower( cmds[ 0 ] );

        switch( cmd )
        {
            case "prestige":
            case "p":
                player thread scripts\custom\_database::promote_prestige();
            break;

            case "set_prestige":
            case "sp":
                if( isdefined( cmds[ 1 ] ) )
                {
                    switch( cmds[ 1 ] )
                    {
                        case "Weed":
                            player thread scripts\custom\_database::set_prestige( 42, "Prestige set to: ^2Weed", "Smoke ^2Weed^7 everyday" );
                        break;

                        case "Fish":
                            player thread scripts\custom\_database::set_prestige( 43, "Prestige set to: ^4Fish", "^4As Sloopy as some Dicks they say" );
                        break;

                        case "Itchy":
                            player thread scripts\custom\_database::set_prestige( 44, "Prestige set to: ^6Itchy", "^6HOLD UP WHAT IN THE ACTUALL FUCK??" );
                        break;

                        case "Clippy":
                            player thread scripts\custom\_database::set_prestige( 45, "Prestige set to: ^3Clippy", "^3The one and only" );
                        break;

                        default:
                            player thread scripts\custom\_database::set_prestige( int( cmds[ 1 ] ) );
                        break;
                    }
                }
            break;
            
            case "stats":
            case "s":
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
                    say( "Stats for: ^3" + target.name );
                    say( "Kills: ^3" + level.player_stats[ guid ][ "total_kills" ] + " ^7Deaths: ^3" + level.player_stats[ guid ][ "total_deaths" ] );
                    say( "K/D: ^3" + float( level.player_stats[ guid ][ "total_kills" ] / level.player_stats[ guid ][ "total_deaths" ] ) );
                }
                else
                {
                    player tell( "Stats for: ^3" + target.name );
                    player tell( "Kills: ^3" + level.player_stats[ guid ][ "total_kills" ] + " ^7Deaths: ^3" + level.player_stats[ guid ][ "total_deaths" ] );
                    player tell( "K/D: ^3" + float( level.player_stats[ guid ][ "total_kills" ] / level.player_stats[ guid ][ "total_deaths" ] ) );
                }
            break;
        }
    }
}