init()
{
    level thread half_timer();
}

half_timer()
{
    level endon( "game_ended" );

    level.half_time = undefined;

    wait ( 5 * 60 );

    level.half_time = 1;
}