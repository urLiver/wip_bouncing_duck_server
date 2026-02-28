init()
{
    level thread on_connect();
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
        player setclientdvar( "motd", "**^3Gnome Peniz Picture here**" );

        player.melee_killstreak = 0;
        player.normal_killstreak = 0;

        player thread scripts\custom\_database::download_stats();

        player thread scripts\custom\_database::stats_listener();

        player thread scripts\custom\_database::quit_listener();
    }
}
