init()
{
    //for cleanes we do this here normally would be done in init\_level 
    level.map_list = [];
 
    //Stock    
    add_map( "mp_plaza2", 0 );
    add_map( "mp_mogadishu", 0 );
    add_map( "mp_bootleg", 0 );
    add_map( "mp_carbon", 0 );
    add_map( "mp_dome", 0 );
    add_map( "mp_exchange", 0 );
    add_map( "mp_lambeth", 0 );
    add_map( "mp_hardhat", 0 );
    add_map( "mp_alpha", 0 );
    add_map( "mp_bravo", 1 );
    add_map( "mp_paris", 0 );
    add_map( "mp_seatown", 0 );
    add_map( "mp_underground", 0 );
    add_map( "mp_interchange", 0 );
    add_map( "mp_aground_ss", 0 );
    add_map( "mp_courtyard_ss", 0 );
    add_map( "mp_rust", 0 );
    add_map( "mp_terminal_cls", 0, ::map_terminal );
    add_map( "mp_nuked", 0 );
    add_map( "mp_village", 0 );
    add_map( "mp_favela", 0 );
    add_map( "mp_test", 0 );
    add_map( "mp_highrise", 1 );
    add_map( "mp_nightshift", 1 );

    //Non-Stock
    add_map( "mp_bo2frost", 0 );
    add_map( "mp_bo2cove", 0 );
    add_map( "mp_bloc_2_night", 0 );
    add_map( "mp_abandon", 1 );
    add_map( "mp_asylum", 0 );
    add_map( "mp_morningwood", 1 );
    add_map( "mp_boardwalk", 0 );
    add_map( "mp_cement", 0 );
    add_map( "mp_hillside_ss", 0 );
    add_map( "mp_moab", 0 );
    add_map( "mp_crosswalk_ss", 0 );
    add_map( "mp_restrepo_ss", 0 );
    add_map( "mp_qadeem", 1 );
    add_map( "mp_six_ss", 0 );
    add_map( "mp_crossfire", 1 );
    add_map( "mp_citystreets", 0 );
    add_map( "mp_farm", 1 );
    add_map( "mp_complex", 0 );
    add_map( "mp_derail", 0 );
    add_map( "mp_fav_tropical", 1 );
    add_map( "mp_checkpoint", 1 );
    add_map( "mp_quarry", 1 );
    add_map( "mp_boneyard", 0 );
    add_map( "mp_storm", 0 );
    add_map( "mp_subbase", 0 );
    add_map( "mp_vacant", 0 );
    add_map( "mp_backlot_sh", 1 );
    add_map( "mp_firingrange", 0 );
    add_map( "mp_radiation_sh", 0 );
    add_map( "mp_showdown_sh", 0 );
    add_map( "mp_lockout_h2", 0 );
    add_map( "mp_crash_snow", 1 );
    add_map( "mp_bog_sh", 1 );
    add_map( "mp_shipment", 1 );
    add_map( "mp_killhouse", 0 );
    add_map( "mp_geometric", 1 );
    add_map( "mp_mideast", 0 );
    add_map( "mp_brecourt", 1 );
    add_map( "mp_wasteland_sh", 0 );
    add_map( "mp_offshore_sh", 0 );
    add_map( "mp_factory_sh", 0 );
    add_map( "mp_seatown_sh", 0 );
    add_map( "mp_highrise_sh", 1 );
    add_map( "mp_boomtown", 0 );
    add_map( "mp_park", 0 );
    add_map( "mp_trailerpark", 0 ); 
    add_map( "mp_meteora", 0 );
    add_map( "mp_nola", 0 );
    add_map( "mp_overgrown", 0 );
    add_map( "mp_italy", 0 );
    add_map( "mp_creek", 1 );
    add_map( "mp_nukearena_sh", 0 );
    add_map( "mp_roughneck", 0 );
    add_map( "mp_shipbreaker", 0 );
    add_map( "mp_kwakelo", 0 );
    add_map( "mp_csgo_mirage", 0 );
    add_map( "mp_cha_quad", 0 );
    add_map( "mp_overwatch", 0 );
    add_map( "so_deltacamp", 0 );
    add_map( "mp_broadcast", 1 );
}

add_map( name, hard, map_function )
{
    map = SpawnStruct();
    map.name = name;
    map.hard = hard;

    level.map_list[ level.map_list.size ] = map;

    if( getdvar( "mapname" ) == name )
    {
        level.cur_map = map;

        if( isdefined( map_function ) )
        {
            [ [ map_function ] ]( );
        }
    }
}

map_terminal()
{
    scripts\custom\maps\_objects::spawn_teleporter( ( 1580, 7090, 205 ), ( 1780, 7090, 205 ) );
    scripts\custom\maps\_objects::spawn_teleporter( ( 1780, 7290, 205 ), ( 1580, 7290, 205 ) );

    scripts\custom\maps\_objects::spawn_teleporter( ( 3009, 4287, 203 ), ( 2776, 4287, 59 ) );
    scripts\custom\maps\_objects::spawn_teleporter( ( 2456, 6111, 203 ), ( 4103, 2157, 204 ) );
}