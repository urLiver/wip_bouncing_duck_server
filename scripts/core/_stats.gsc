init()
{   
    level.player_stats = [];
    
    level thread on_connect();

    level.basepath = "C:/bouncing_duck/iw5/";

    if( ! directoryExists( level.basepath ) )
    {
        createDirectory( "C:/bouncing_duck/" );
        createDirectory( "C:/bouncing_duck/iw5/" );
    }

    precachestring( &"RANK_PROMOTED" );  

    level.maxrank = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.maxprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ) ) - 1;
}

quit_listener()
{
    guid = ToLower( self.guid );

    self waittill( "disconnect" );

    scripts\core\_database::write_client_data( guid );
}

stats_listener()
{
    self endon( "disconnect" );

    for( ;; )
    {
        self waittill( "new_stats" );

        minxp = maps\mp\gametypes\_rank::getRankInfoMinXp( self.pers[ "rank" ] );
        maxxp = maps\mp\gametypes\_rank::getRankInfoMaxXp( self.pers[ "rank" ] );

        cur = int( self.pers[ "rankxp" ] - minxp );
        needed = int( maxxp - minxp );
        diff = float( cur / needed );

        self.xptextcur.color = ( 1.0f - diff, diff, 0 );
        self.xptextcur SetValue( cur );

        self.xptextmax.color = ( 1.0f - diff, diff, 0 );
        self.xptextmax SetValue( needed );

        self thread scripts\core\_database::update_dvars();
    }
}

show_rankup( icon )
{   
    self endon( "new_promotion" );

    for ( ;; )
    {
        self playlocalsound( "mp_level_up" );

        if( isdefined( self.rankshader ) ) 
        {
            self.rankshader destroy();
        }

        if( isdefined( self.ranktext ) ) 
        {
            self.ranktext destroy();
        }

        self.ranktext = scripts\core\_ui::clienttext( self, "", "bigfixed", 0.6, 320, 80, "center", "bottom", 0, 1, ( 1, 1, 1 ), ( 1, 0.64, 0 ) );
        self.ranktext.label = &"RANK_PROMOTED";
        self.rankshader = scripts\core\_ui::clientshader( self, icon, 320, 80, 30, 30, "center", "top", 0, 1, ( 1, 1, 1 ) );

        self.ranktext scripts\core\_ui::fadein( 1.0 );
        self.rankshader scripts\core\_ui::fadein( 1.0 );

        wait 2.5;

        self.ranktext scripts\core\_ui::fadeout( 1.0 );
        self.rankshader scripts\core\_ui::fadeout( 1.0 );

        wait 1;

        self.rankshader destroy();
        self.ranktext destroy();

        self notify( "new_promotion" );
    }
}

promote_prestige()
{
    guid = ToLower( self.guid );
    
    if( self.pers[ "rankxp" ] != maps\mp\gametypes\_rank::getrankinfomaxxp( level.maxrank ) )
    {
        self tell( "You missing some XP ^2:D" );
        return;
    }

    if( level.player_stats[ guid ][ "prestige" ] + 1 > level.maxprestige )
    {
        self tell( "You reached max Prestige Congrats ^1<3" );
        return;
    }

    level.player_stats[ guid ][ "xp" ] = 0;
    level.player_stats[ guid ][ "prestige" ] = level.player_stats[ guid ][ "prestige" ] + 1;
    level.player_stats[ guid ][ "prestige_replace" ] = 9999;

    self tell( "Reached Prestige: ^3" + level.player_stats[ guid ][ "prestige" ] + " ^7/ ^3" + level.maxprestige );

    self.pers[ "prestige" ] = level.player_stats[ guid ][ "prestige" ];
    self.pers[ "rankxp" ] = level.player_stats[ guid ][ "xp" ];
    self.pers[ "rank" ] = self maps\mp\gametypes\_rank::getrankforxp( self.pers[ "rankxp" ] );

    self setRank( self.pers[ "rank" ], self.pers[ "prestige" ] );

    self notify( "new_promotion" );
    
    self thread show_rankup( tablelookup( "mp/rankIconTable.csv", 0, self.pers[ "rank" ], self.pers[ "prestige" ] + 1 ) );

    self thread upload_stats();
}

set_prestige( prestige, msg, hint )
{
    guid = ToLower( self.guid );

    if( ! isdefined( msg ) && prestige > level.maxprestige || prestige < 0 )
    {
        self tell( "Hmm seems like a magical Wall protects something ^2:D" );
        return;
    }
    if( ! isdefined( msg ) && prestige > level.player_stats[ guid ][ "prestige" ] )
    {
        self tell( "You don't have that Prestige Unlocked yet ^2:D" );
        return;
    }
    
    if( isdefined( msg ) )
    {
        self tell( msg );
    }

    if( isdefined( hint ) )
    {
        self tell( hint );
    }

    if( ! isdefined( hint ) || ! isdefined( msg ) )
    {
        self tell( "Prestige set to: ^3" + prestige + " ^7/ ^3" + level.player_stats[ guid ][ "prestige" ] );
    }

    level.player_stats[ guid ][ "prestige_replace" ] = prestige;
    self.pers[ "prestige" ] = prestige;
    self setRank( self.pers[ "rank" ], prestige );

    self notify( "new_promotion" );

    self thread show_rankup( tablelookup( "mp/rankIconTable.csv", 0, self.pers[ "rank" ], self.pers[ "prestige" ] + 1 ) );

    self thread upload_stats();
}

upload_stats()
{
    self notify( "new_stats" );
}

download_stats()
{
    self waittill( "spawned_player" );

    self setup_xpui();

    guid = ToLower( self.guid );

    scripts\core\_database::read_client_data( guid );

    self.pers[ "rankxp" ] = level.player_stats[ guid ][ "xp" ];
    self.pers[ "rank" ] = self maps\mp\gametypes\_rank::getrankforxp( level.player_stats[ guid ][ "xp" ] );

    self notify( "new_stats" );

    if( level.player_stats[ guid ][ "prestige_replace" ] != 9999 )
    {
        self.pers[ "prestige" ] = level.player_stats[ guid ][ "prestige_replace" ];
    }
    else
    {
        self.pers[ "prestige" ] = level.player_stats[ guid ][ "prestige" ];
    }

    self setRank( self.pers[ "rank" ], self.pers[ "prestige" ] );

    minxp = maps\mp\gametypes\_rank::getRankInfoMinXp( self.pers[ "rank" ] );
    maxxp = maps\mp\gametypes\_rank::getRankInfoMaxXp( self.pers[ "rank" ] );
    
    cur = self.pers[ "rankxp" ] - minxp;
    needed = maxxp - minxp;
    diff = cur / needed;

    self.xptextcur.color = ( 1.0f - diff, diff, 0 );
    self.xptextcur SetValue( cur );

    self.xptextmax.color = ( 1.0f - diff, diff, 0 );
    self.xptextmax SetValue( needed );
}

setup_xpui()
{   
    self.xptextcur = scripts\core\_ui::clienttext( self, "", "bigfixed", 0.45, 320, 475, "right", "bottom", 0, 1, ( 0, 1, 0 ) );
    self.xptextcur.label = &"&&1 /";
    self.xptextcur SetValue( 0 );
    
    self.xptextmax = scripts\core\_ui::clienttext( self, " ", "bigfixed", 0.45, 320, 475, "left", "bottom", 0, 1, ( 0, 1, 0 ) );
    self.xptextmax.label = &"^7 &&1";
    self.xptextmax SetValue( 0 );
}

remove_xpui()
{   
    self endon( "disconnect" );

    self.xptextcur scripts\core\_ui::fadeout( 1.0 );
    self.xptextmax scripts\core\_ui::fadeout( 1.0 );
    wait 1;
    self.xptextcur Destroy();
    self.xptextmax Destroy();
}

on_connect()
{
    level endon( "game_ended" );

    for( ;; )
    {
        level waittill( "connected", player );

        player setclientdvar( "cg_scoreboardPingText", "1" );
        player setclientdvar( "cg_teamcolor_allies", "0 1 0 1" );
        player setclientdvar( "cg_teamcolor_axis", "1 0.64 0 1" );
        player setclientdvar( "motd", "**^3Gnome Peniz Picture here**" );

        player.melee_killstreak = 0;
        player.normal_killstreak = 0;

        player thread download_stats();

        player thread stats_listener();

        player thread quit_listener();
    }
}
