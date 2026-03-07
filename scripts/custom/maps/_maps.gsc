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
    add_map( "mp_nuked", 0, ::map_nuketown );
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
    add_map( "mp_crosswalk_ss", 0, ::map_crosswalk );
    add_map( "mp_restrepo_ss", 0 );
    add_map( "mp_qadeem", 1 );
    add_map( "mp_six_ss", 0, ::map_vortex );
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
    add_map( "mp_backlot_sh", 1, ::map_backlot_sh );
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
    add_map( "mp_brecourt", 1, ::map_wasteland );
    add_map( "mp_wasteland_sh", 0 );
    add_map( "mp_offshore_sh", 0 );
    add_map( "mp_factory_sh", 0, ::map_der_riese );
    add_map( "mp_seatown_sh", 0 );
    add_map( "mp_highrise_sh", 1 );
    add_map( "mp_boomtown", 0 );
    add_map( "mp_park", 0 );
    add_map( "mp_trailerpark", 0, ::map_trailerpark ); 
    add_map( "mp_meteora", 0, ::map_meteora );
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
    add_map( "mp_broadcast", 1, ::map_broadcast );
    add_map( "mp_pipeline", 0, ::map_pipeline );

    // Non GilletteClan maps
    add_map( "mp_afghan", 0, ::map_afghan );
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
    scripts\custom\maps\_objects::spawn_intel( ( 2864, 2743, 52 ), ( 0, -90, 0 ), "intel_terminal" );

    scripts\custom\maps\_objects::spawn_teleporter( ( 1580, 7090, 205 ), ( 1780, 7090, 205 ) );
    scripts\custom\maps\_objects::spawn_teleporter( ( 1780, 7290, 205 ), ( 1580, 7290, 205 ) );

    scripts\custom\maps\_objects::spawn_teleporter( ( 3009, 4287, 203 ), ( 2776, 4287, 59 ) );
    scripts\custom\maps\_objects::spawn_ineractiv_teleporter( ( 2456, 6111, 203 ), ( 4103, 2157, 204 ), 20 );
}

map_trailerpark()
{
    scripts\custom\maps\_objects::spawn_intel_decoy( ( -573, 548, 88 ), ( 0, 22, 0 ) );
    scripts\custom\maps\_objects::spawn_intel( ( -573, 582, 47 ), ( 0, 0, 0 ), "intel_trailerpark", 40 );
}

map_pipeline()
{
    scripts\custom\maps\_objects::spawn_intel( ( 1483, -40, -63 ), ( 0, 100, 0 ), "intel_pipeline", 30 );
}

map_backlot_sh()
{
    scripts\custom\maps\_objects::spawn_intel( ( -1266, -588, -107 ), ( 0, -1.2, 0 ), "intel_backlot" );
}

map_der_riese()
{
    scripts\custom\maps\_objects::spawn_intel( ( 1464, -1379, 146 ), ( 0, -159, 0 ), "intel_derriese" );
}

map_wasteland()
{
    scripts\custom\maps\_objects::spawn_intel( ( -1403, -3681, 87 ), ( 0, -119, 0 ), "intel_wasteland" );
}

map_nuketown()
{
    scripts\custom\maps\_objects::spawn_intel( ( 1310, 1141, -44 ), ( 0, -74, 0 ), "intel_nuketown", 30 );
}

map_broadcast()
{
    scripts\custom\maps\_objects::spawn_intel( ( 436, -191, 40 ), ( 0, -59, 0 ), "intel_broadcast", 10 );

    scripts\custom\maps\_objects::spawn_ineractiv_teleporter( ( -525, 1151, 48 ), ( 957, -38, 147 ), 10 );

    scripts\custom\maps\_objects::spawn_teleporter( ( 655, 651, 147 ), ( 583, 758, 147 ) );
}

// new maps need testing

map_afghan()
{
    scripts\custom\maps\_objects::spawn_intel( ( -900, 1875, 307 ), ( 0, -67, 0 ), "intel_afghan", 10, 10 );
}

map_vortex() // six_ss
{
    precachemodel( "fx_tornado" ); // for mp_six_ss
    
    scripts\custom\maps\_objects::spawn_model_with_trace( ( 11087, 17154, 336 ), ( 0, -52, 0 ), "fx_tornado" );
}

map_crosswalk()
{
    precachemodel( "mp_cw_pinata" ); // for mp_crosswalk_ss

    leader_origin = ( -1245, -895, 687 );
    scripts\custom\maps\_objects::spawn_model_with_trace( leader_origin, ( 0, 180, 0 ), "mp_cw_pinata" );

    for( i = 0; i < 6; i++ )
    {
        for( j = 0; j < 4; j++ )
        {
            origin = ( -1145 - j * 20, -845 - i * 20, 687 );
            angles = vectorToAngles( origin - leader_origin );
            scripts\custom\maps\_objects::spawn_model_with_trace( origin, ( angles[ 0 ], angles[ 1 ], 0 ), "mp_cw_pinata" );
            
            wait 0.1;
        }   
    }
    
    scripts\custom\maps\_objects::spawn_sacrifice_trigger( ( -1195, -895, 687 ), 50, "sacrifice_axis_crosswalk", "sacrifice_allies_crosswalk" );
}

map_meteora()
{
    scripts\custom\maps\_objects::spawn_intel( ( 736, 3318, 1644 ), ( 0, 0, 0 ), "intel_meteora", 10, 10 );
}