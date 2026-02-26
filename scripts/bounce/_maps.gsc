init()
{
    replacefunc( maps\mp\gametypes\_gamelogic::waittillfinalkillcamdone, ::on_waittillFinalKillcamDone );
    
    level.map_list = [];

    //Stock    
    add_map( "mp_plaza2", "", 0 );
    add_map( "mp_mogadishu", "", 0 );
    add_map( "mp_bootleg", "", 0 );
    add_map( "mp_carbon", "", 0 );
    add_map( "mp_dome", "betty", 0 );
    //add_map( "mp_radar", "", 0 ); crashes cuz of materials
    add_map( "mp_exchange", "betty", 0 );
    add_map( "mp_lambeth", "", 0 );
    add_map( "mp_hardhat", "", 0 );
    add_map( "mp_alpha", "", 0 );
    add_map( "mp_bravo", "", 1 );
    add_map( "mp_paris", "", 0 );
    add_map( "mp_seatown", "", 0 );
    add_map( "mp_underground", "", 0 );
    add_map( "mp_interchange", "", 0 );
    add_map( "mp_aground_ss", "", 0 );
    add_map( "mp_courtyard_ss", "", 0 );
    add_map( "mp_rust", "", 0 );
    add_map( "mp_terminal_cls", "betty", 0 );
    add_map( "mp_nuked", "", 0 );
    add_map( "mp_village", "", 0 );
    add_map( "mp_favela", "", 0 );

    //Non-Stock but Pluto Stock
    add_map( "mp_test", "", 0 );
    add_map( "mp_highrise", "tk", 1 );
    add_map( "mp_nightshift", "betty", 1 );

    //Non-Stock
    add_map( "mp_bo2frost", "", 0 );
    add_map( "mp_bo2cove", "", 0 );
    add_map( "mp_bloc_2_night", "", 0 );
    add_map( "mp_abandon", "tk", 1 );
    add_map( "mp_asylum", "betty", 0 );
    add_map( "mp_morningwood", "", 1 );
    add_map( "mp_boardwalk", "", 0 );
    add_map( "mp_cement", "", 0 );
    add_map( "mp_hillside_ss", "", 0 );
    add_map( "mp_moab", "betty", 0 );
    add_map( "mp_crosswalk_ss", "", 0 );
    add_map( "mp_restrepo_ss", "", 0 );
    add_map( "mp_qadeem", "tk", 1 );
    add_map( "mp_six_ss", "", 0 );
    add_map( "mp_crossfire", "tk", 1 );
    add_map( "mp_citystreets", "tk", 0 );
    add_map( "mp_farm", "betty", 1 );
    add_map( "mp_complex", "", 0 );
    add_map( "mp_derail", "betty", 0 );
    add_map( "mp_fav_tropical", "tk", 1 );
    add_map( "mp_checkpoint", "tk", 1 );
    add_map( "mp_quarry", "tk", 1 );
    // add_map( "mp_compact", "betty", 1 ); same as mp radar
    add_map( "mp_boneyard", "betty", 0 );
    add_map( "mp_storm", "betty", 0 );
    add_map( "mp_subbase", "betty", 0 );
    add_map( "mp_vacant", "", 0 );
    add_map( "mp_backlot_sh", "betty", 1 );
    add_map( "mp_firingrange", "betty", 0 );
    add_map( "mp_radiation_sh", "", 0 );
    add_map( "mp_showdown_sh", "betty", 0 );
    add_map( "mp_lockout_h2", "", 0 );
    add_map( "mp_crash_snow", "betty", 1 );
    add_map( "mp_bog_sh", "", 1 );
    add_map( "mp_shipment", "", 1 );
    add_map( "mp_killhouse", "", 0 );
    add_map( "mp_geometric", "", 1 );
    add_map( "mp_mideast", "", 0 );
    add_map( "mp_brecourt", "betty", 1 );
    add_map( "mp_wasteland_sh", "betty", 0 );
    add_map( "mp_offshore_sh", "betty", 0 );
    add_map( "mp_factory_sh", "betty", 0 );
    add_map( "mp_seatown_sh", "", 0 );
    add_map( "mp_highrise_sh", "tk", 1 );
    add_map( "mp_boomtown", "", 0 );
    add_map( "mp_park", "", 0 );
    add_map( "mp_trailerpark", "", 0 );
    add_map( "mp_meteora", "betty", 0 );
    add_map( "mp_nola", "", 0 );
    add_map( "mp_overgrown", "tk", 0 );
    add_map( "mp_italy", "", 0 );
    add_map( "mp_creek", "tk", 1 );
    add_map( "mp_nukearena_sh", "", 0 );
    add_map( "mp_roughneck", "", 0 );
    add_map( "mp_shipbreaker", "", 0 );
    add_map( "mp_kwakelo", "", 0 );
    //add_map( "mp_fuel2", "betty", 1 );
    add_map( "mp_csgo_mirage", "", 0 );
    add_map( "mp_cha_quad", "", 0 );
    add_map( "mp_overwatch", "betty", 0 );
    add_map( "so_deltacamp", "", 0 );
    add_map( "mp_broadcast", "tk", 1 );
    //add_map( "mp_bootleg_sh", "", 0 ); Files missing

    foreach( elem in GetEntArray( "misc_turret", "classname" ) )
    {
        elem delete();
    }
}

add_map( name, deathstreak, hard )
{
    map = SpawnStruct();
    map.name = name;
    map.hard = hard;
    map.deathstreak = deathstreak;

    level.map_list[ level.map_list.size ] = map;

    if( getdvar( "mapname" ) == name )
    {
        level.cur_map = map;
        level.deathstreak = deathstreak;
    }
}

end_level()
{
    level.found_map = undefined;
    
    foreach( elem in level.player_stats )
    {   
        if( isdefined( elem ) && isdefined( elem.guid ) )
        {
            scripts\core\_database::write_client_data( elem.guid );
        }
    }

    while( ! isdefined( level.found_map ) ) 
    {
        rand = RandomInt( level.map_list.size );

        target_map = level.map_list[ rand ];

        if ( level.cur_map.hard != target_map.hard && level.cur_map.deathstreak != target_map.deathstreak )
        {
            level.found_map = true;
            level.next_map = target_map.name;
           
            break;
        }
    }
}

on_waittillFinalKillcamDone()
{
    if ( ! isdefined( level.finalkillcam_winner ) )
    {
        return 0;
    }

    level waittill( "final_killcam_done" );

    if( maps\mp\_utility::wasLastRound() )
    {
        level thread end_level();

        while( ! isdefined( level.found_map ) )
        {
            wait 0.2;
        }

        cmdexec( "map " + level.next_map );
    }

    return 1;
}