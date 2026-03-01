init()
{
    level thread half_timer();
}

half_timer()
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