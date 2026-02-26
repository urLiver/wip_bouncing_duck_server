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
        "velocity_meter"
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

    if( level.player_stats[ guid ][ "xp_text" ] && self.xptextcur.alpha == 0.0 && self.xptextmax.alpha == 0.0 )
    {
        self.xptextcur scripts\core\_ui::fadein( 1.0 );
        self.xptextmax scripts\core\_ui::fadein( 1.0 );
    }
}