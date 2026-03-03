init()
{
    foreach( elem in GetEntArray( "misc_turret", "classname" ) )
    {
        elem delete();
    }

    foreach( entry in GetEntArray( "destructible_toy", "targetname" ) )
    {
        if( isdefined( entry.model ) && issubstr( entry.model, "chicken" ) )
        {
            entry thread on_damage_chicken();
        }
    }   

    level thread half_time_check();

    level thread on_connect();
}

half_time_check()
{
    level endon( "game_ended" );

    level.allow_tks = undefined;

    wait( 5 * 60 );

    if( level.cur_map.hard == 0 )
    {
        wait( 3 * 60 );
    }

    level.allow_tks = 1;
}

on_damage_chicken()
{
    for ( ;; )
    {
        self waittill( "damage", var_0, var_1 );

        if( ! isdefined( var_1 ) )
        {
            continue;
        }

        if( self.health > 0 )
        {
            continue;
        }

        level.player_stats[ ToLower( var_1.guid )  ][ "chickens_killed" ]++;

        if( isdefined( self.origin ) )
        {
            PlayFX( level.money, self.origin );
        }

        var_1 notify( "new_stats" );

        break;
    }
}

on_connect()
{
    level endon( "game_ended" );

    for( ;; )
    {
        level waittill( "connected", player );
	    
        player setClientDvars( "g_scriptMainMenu", "menu_window" );

		guid = ToLower( player.guid );
		rejoined = false;

		for( i = 0; i < level.joiners.size; i++ )
		{
			if( level.joiners[ i ] == guid )
			{
				rejoined = true;
			}
		}

        if( rejoined == 0 )
        {
			level.joiners[ level.joiners.size ] = guid;
            player.custom_infect_firstspawn = 1;
        }
		else
		{
            player.custom_infect_firstspawn = 2;
		}

        player thread maps\mp\gametypes\infect::onplayerdisconnect();

        player setclientdvar( "cg_scoreboardPingText", "1" );
        player setclientdvar( "cg_teamcolor_allies", "0 1 0 1" );
        player setclientdvar( "cg_teamcolor_axis", "1 0.64 0 1" );

        player.melee_killstreak = 0;
        player.normal_killstreak = 0;

        player thread scripts\custom\_database::download_stats();

        player thread scripts\custom\_database::stats_listener();

        player thread scripts\custom\_database::quit_listener();
    }
}
