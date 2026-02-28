init()
{
    level.dataset_defines = [
        "guid",
        "xp",
        "prestige",
        "prestige_replace",
        "playercard_icon",
        "playercard_outline",
        "scoreboard_icon",
        "total_kills",
        "total_deaths",
        "infected_kills",
        "highest_killstreak",
        "highest_melee_killstreak",
        "moabs_called",
        "moabs_cancelled",
        "noabs_called",
        "tis_destroyed",
        "chickens_killed",
        "scavengerbags_collected",
        "render_distance",
        "fullbright",
        "simple_map",
        "xp_text",
        "compass",
        "velocity_meter",
        "render_killstreak"
    ];
}

read_str_from_file( guid, file )
{
    path = level.basepath + guid + "/" + file + ".csv";
    
    ret = readfile( path );

    return ret;
}

write_str_to_file( guid, file, str_contents )
{
    dir = level.basepath + guid + "/";

    if( !directoryExists( dir ) )
        createDirectory( dir );

    path = level.basepath + guid + "/" + file + ".csv";

    writefile( path, str_contents );
}

write_client_stats( guid, _default )
{
    str_define = "";

    foreach ( elem in level.dataset_defines )
    {
        str_define += ( elem + "," );
    }

    str_define += "\n";

    if( isdefined( _default ) )
    {
        str_define += guid + ",";
        str_define += "0,"; // XP
        str_define += "0,"; // Prestige
        str_define += "9999,"; // Prestige Replace
        
        // Random Buffer will be overwritten by the first save so i dont need to care
        for( i = 0; i < 40; i++ )
        {
            str_define += "0,";
        }
    }
    else
    {
        foreach( elem in level.player_stats[ guid ] )
        {
            str_define += ( elem + "," );
        }
    }

    write_str_to_file( guid, "stats", str ( str_define ) );
}

write_client_data( guid )
{
    write_client_stats( guid );
}

ensure_client_data( guid )
{
    if( !fileExists( str( level.basepath + guid + "/stats.csv" ) ) )
    {
        write_client_stats( guid, 1 );
    }
}

read_client_data( guid )
{
    ensure_client_data( guid );

    str = read_str_from_file( guid, "stats" );
    line = StrTok( str, "\n" )[ 1 ];
    strs = StrTok( line, "," );
    
    level.player_stats[ guid ] = [];
    idx = 0;
    foreach( elem in level.dataset_defines )
    {
        item = isdefined( strs[ idx ] ) ? strs[ idx ] : "0";

        if( idx == 0 )
        {
            level.player_stats[ guid ][ elem ] = item;
        }
        else
        {
            level.player_stats[ guid ][ elem ] = int( item );
        }

        idx++;
    }
}

update_dvars()
{
    guid = ToLower( self.guid );

    render_distance = [ "0", "3000", "2000", "1500", "1000", "500" ];
    render_distance_text = [ "Default", "3000", "2000", "1500", "1000", "500" ];
    fullbright =  [ "1", "3", "2" ];
    fullbright_text =  [ "Default", "Grey Lightmap", "White Lightmap" ];

    self setclientdvar( "rank_prestige_unlocked", level.player_stats[ guid ][ "prestige" ] );
    self setclientdvar( "moabs_cancelled", level.player_stats[ guid ][ "moabs_cancelled" ] );
    self setclientdvar( "moabs_called", level.player_stats[ guid ][ "moabs_called" ] );
    self setclientdvar( "total_kills", level.player_stats[ guid ][ "total_kills" ] );
    self setclientdvar( "total_deaths", level.player_stats[ guid ][ "total_deaths" ] );
    self setclientdvar( "tis_destroyed", level.player_stats[ guid ][ "tis_destroyed" ] );
    self setclientdvar( "chickens_killed", level.player_stats[ guid ][ "chickens_killed" ] );
    self setclientdvar( "highest_killstreak", level.player_stats[ guid ][ "highest_killstreak" ] );
    self setclientdvar( "highest_melee_killstreak", level.player_stats[ guid ][ "highest_melee_killstreak" ] );
    self setclientdvar( "infected_kills", level.player_stats[ guid ][ "infected_kills" ] );
    self setClientDvar( "r_zfar", render_distance[ level.player_stats[ ToLower( guid ) ][ "render_distance" ] ] );
    self setClientDvar( "r_zfar_text", render_distance_text[ level.player_stats[ ToLower( guid ) ][ "render_distance" ] ] );
    self setClientDvar( "r_lightmap", fullbright[ level.player_stats[ ToLower( guid ) ][ "fullbright" ] ] );
    self setClientDvar( "r_lightmap_text", fullbright_text[ level.player_stats[ ToLower( guid ) ][ "fullbright" ] ] );
    self setClientDvar( "r_lightmap_text", fullbright_text[ level.player_stats[ ToLower( guid ) ][ "fullbright" ] ] );
    self setClientDvar( "r_simple_map", level.player_stats[ guid ][ "simple_map" ] );
    self setClientDvar( "r_xp", level.player_stats[ guid ][ "xp_text" ] );
    self setClientDvar( "r_compass", level.player_stats[ guid ][ "compass" ] );
    self setClientDvar( "r_velocity_meter", level.player_stats[ guid ][ "velocity_meter" ] );
    self setClientDvar( "r_killstreak", level.player_stats[ guid ][ "render_killstreak" ] );

    if( level.player_stats[ guid ][ "xp_text" ] && self.xptextcur.alpha == 0.0 && self.xptextmax.alpha == 0.0 )
    {
        self.xptextcur scripts\custom\_uiwrappers::fadein( 1.0 );
        self.xptextmax scripts\custom\_uiwrappers::fadein( 1.0 );
    }
}

quit_listener()
{
    guid = ToLower( self.guid );

    self waittill( "disconnect" );

    scripts\custom\_database::write_client_data( guid );
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

        self thread scripts\custom\_database::update_dvars();
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

        self.ranktext = scripts\custom\_uiwrappers::clienttext( self, "", "bigfixed", 0.6, 320, 80, "center", "bottom", 0, 1, ( 1, 1, 1 ), ( 1, 0.64, 0 ) );
        self.ranktext.label = &"RANK_PROMOTED";
        self.rankshader = scripts\custom\_uiwrappers::clientshader( self, icon, 320, 80, 30, 30, "center", "top", 0, 1, ( 1, 1, 1 ) );

        self.ranktext scripts\custom\_uiwrappers::fadein( 1.0 );
        self.rankshader scripts\custom\_uiwrappers::fadein( 1.0 );

        wait 2.5;

        self.ranktext scripts\custom\_uiwrappers::fadeout( 1.0 );
        self.rankshader scripts\custom\_uiwrappers::fadeout( 1.0 );

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

    scripts\custom\_database::read_client_data( guid );

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
    self.xptextcur = scripts\custom\_uiwrappers::clienttext( self, "", "bigfixed", 0.45, 320, 475, "right", "bottom", 0, 1, ( 0, 1, 0 ) );
    self.xptextcur.label = &"&&1 /";
    self.xptextcur SetValue( 0 );
    
    self.xptextmax = scripts\custom\_uiwrappers::clienttext( self, " ", "bigfixed", 0.45, 320, 475, "left", "bottom", 0, 1, ( 0, 1, 0 ) );
    self.xptextmax.label = &"^7 &&1";
    self.xptextmax SetValue( 0 );
}

remove_xpui()
{   
    self endon( "disconnect" );

    self.xptextcur scripts\custom\_uiwrappers::fadeout( 1.0 );
    self.xptextmax scripts\custom\_uiwrappers::fadeout( 1.0 );
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
    }
}
