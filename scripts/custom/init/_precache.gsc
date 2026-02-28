init()
{
    precachestring( &"RANK_PROMOTED" );  

    precachelocationselector( "map_artillery_selector" );

    precachemodel( "vehicle_b2_bomber" );
    precachemodel( "vehicle_mig29_desert" );

    precacheshader( "death_moab" );
    precacheshader( "iw5_cardicon_frank" );
    precacheshader( "iw5_cardicon_cat" );
    precacheshader( "cardicon_weed" );
    precacheshader( "iw5_cardicon_devil" );
    precacheshader( "cardicon_gears" );

    precachemenu( "menu_window" );

    precacheminimapicon( "compass_objpoint_airstrike_friendly" );
    precacheminimapicon( "compass_objpoint_airstrike_busy" );
}