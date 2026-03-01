init()
{

}

spawn_intel( origin, angles, entry_name )
{
    top = origin + ( 0.0, 0.0, 32.0 );
    bottom = origin + ( 0.0, 0.0, -32.0 );
    trace = bullettrace( top, bottom, 0, undefined );
    position = trace[ "position" ];
    entity = spawn( "script_model", position );
    entity.angles = angles;
    entity setmodel( "prop_suitcase_bomb" );

    level thread watch_intel( origin, entry_name );
}

watch_intel( origin, entry_name )
{
    trigger = Spawn( "trigger_radius", origin, 0, 50, 50);

    for( ;; )
    {
        trigger waittill( "trigger", player );

        if( level.player_stats[ ToLower( player.guid )  ][ entry_name ] == 0 )
        {
            player maps\mp\_utility::setlowermessage( "pickup_hint", "Press ^6[{+activate}]^7 to Pick up ^6Intel", 1, undefined, undefined, undefined, undefined, undefined, 1 );

            if( player UseButtonPressed() )
            {
                level.player_stats[ ToLower( player.guid )  ][ entry_name ] = 1;

                player notify( "new_stats" );

                player IPrintLnBold( "^6Intel ^7collected!" );
                
                player playlocalsound( "mp_level_up" );
            }
        }
    }
}

spawn_teleporter( entry_origin, exit_origin )
{
    entry_top = entry_origin + ( 0.0, 0.0, 32.0 );
    entry_bottom = entry_origin + ( 0.0, 0.0, -32.0 );
    entry_trace = bullettrace( entry_top, entry_bottom, 0, undefined );
    entry_position = entry_trace[ "position" ];

    exit_top = exit_origin + ( 0.0, 0.0, 32.0 );
    exit_bottom = exit_origin + ( 0.0, 0.0, -32.0 );
    exit_trace = bullettrace( exit_top, exit_bottom, 0, undefined );
    exit_position = exit_trace[ "position" ];

    level thread spawn_teleporter_entry_model( entry_position );

    level thread watch_teleporter( entry_position, exit_position ); 
}

spawn_teleporter_entry_model( entry_origin )
{
    ent = spawn( "script_model", entry_origin );
   	ent setmodel( "mil_emergency_flare_mp" );
    ent.angles = ( 0, -90, 0 );
    ent playloopsound( "emt_road_flare_burn" );

    wait 0.05;
    
    var_3 = ent gettagangles( "tag_fire_fx" );
    var_4 = spawnfx( level.green_flare, ent gettagorigin( "tag_fire_fx" ), anglestoforward( var_3 ), anglestoup( var_3 ) );
    triggerfx( var_4 );
}

watch_teleporter( entry_origin, exit_origin )
{
    trigger = Spawn( "trigger_radius", entry_origin, 0, 50, 50);

    for( ;; )
    {
        trigger waittill( "trigger", player );

        player SetOrigin( exit_origin + ( 0, 0, 1 ) );
        player SetVelocity( ( 0, 0, 0 ) );

        player thread flag_protection();
    }
}

flag_protection()
{
    self.flag_protected = 1;

    wait 0.65;

    self.flag_protected = undefined;
}