init()
{
    replacefunc( maps\mp\gametypes\_gamelogic::waittillfinalkillcamdone, ::on_waittillFinalKillcamDone );
}

end_level()
{
    level.found_map = undefined;
    
    foreach( elem in level.player_stats )
    {   
        if( isdefined( elem ) && isdefined( elem.guid ) )
        {
            scripts\custom\_database::write_client_data( elem.guid );
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