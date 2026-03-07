init()
{

}

spawn_model( origin, angles, model_name )
{
    entity = spawn( "script_model", origin );
    entity.angles = angles;
    entity setmodel( model_name );
}

spawn_model_with_trace( origin, angles, model_name )
{
    top = origin + ( 0.0, 0.0, 32.0 );
    bottom = origin + ( 0.0, 0.0, -32.0 );
    trace = bullettrace( top, bottom, 0, undefined );
    position = trace[ "position" ];
    entity = spawn( "script_model", position );
    entity.angles = angles;
    entity setmodel( model_name );
}

spawn_intel_decoy( origin, angles )
{
    top = origin + ( 0.0, 0.0, 32.0 );
    bottom = origin + ( 0.0, 0.0, -32.0 );
    trace = bullettrace( top, bottom, 0, undefined );
    position = trace[ "position" ];
    entity = spawn( "script_model", position );
    entity.angles = angles;
    entity setmodel( "prop_suitcase_bomb" );
}

spawn_intel( origin, angles, entry_name, trigger_range, trigger_height )
{
    top = origin + ( 0.0, 0.0, 32.0 );
    bottom = origin + ( 0.0, 0.0, -32.0 );
    trace = bullettrace( top, bottom, 0, undefined );
    position = trace[ "position" ];
    entity = spawn( "script_model", position );
    entity.angles = angles;
    entity setmodel( "prop_suitcase_bomb" );

    level thread watch_intel( origin, entry_name, trigger_range, trigger_height );
}

watch_intel( origin, entry_name, trigger_range, trigger_height )
{
    if( ! isdefined( trigger_range ) ) 
    {
        trigger_range = 50;
    }

    if( ! isdefined( trigger_height ) ) 
    {
        trigger_height = 50;
    }

    trigger = Spawn( "trigger_radius", origin, 0, trigger_range, trigger_height );

    for( ;; )
    {
        trigger waittill( "trigger", player );

        if( level.player_stats[ ToLower( player.guid ) ][ entry_name ] == 0 )
        {
            player maps\mp\_utility::setlowermessage( "pickup_hint", "Press ^6[{+activate}]^7 to Pick up ^6Intel", 1, undefined, undefined, undefined, undefined, undefined, 1 );

            if( player UseButtonPressed() )
            {
                level.player_stats[ ToLower( player.guid ) ][ entry_name ] = 1;

                player notify( "new_stats" );

                player IPrintLnBold( "^6Intel ^7collected!" );
                
                player playlocalsound( "mp_level_up" );
            }
        }
    }
}

spawn_ineractiv_teleporter( entry_origin, exit_origin, radius )
{
    entry_top = entry_origin + ( 0.0, 0.0, 32.0 );
    entry_bottom = entry_origin + ( 0.0, 0.0, -32.0 );
    entry_trace = bullettrace( entry_top, entry_bottom, 0, undefined );
    entry_position = entry_trace[ "position" ];

    exit_top = exit_origin + ( 0.0, 0.0, 32.0 );
    exit_bottom = exit_origin + ( 0.0, 0.0, -32.0 );
    exit_trace = bullettrace( exit_top, exit_bottom, 0, undefined );
    exit_position = exit_trace[ "position" ];

    level thread watch_interactiv_teleporter( entry_position, exit_position, radius ); 
}

watch_interactiv_teleporter( entry_origin, exit_origin, radius )
{
    trigger = Spawn( "trigger_radius", entry_origin, 0, radius, 50 );

    for( ;; )
    {
        trigger waittill( "trigger", player );

        player maps\mp\_utility::setlowermessage( "pickup_hint", "Press ^6[{+activate}]^7 to ^6Teleport", 1, undefined, undefined, undefined, undefined, undefined, 1 );

        if( player UseButtonPressed() )
        {
            player SetOrigin( exit_origin + ( 0, 0, 1 ) );
            player SetVelocity( ( 0, 0, 0 ) );

            player thread flag_protection();
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
    trigger = Spawn( "trigger_radius", entry_origin, 0, 50, 50 );

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

spawn_sacrifice_trigger( origin, trigger_range, entry_name_axis, entry_name_allies )
{
    level thread watch_sacrifice_trigger( origin, trigger_range, entry_name_axis, entry_name_allies );
}

watch_sacrifice_trigger( origin, trigger_range, entry_name_axis, entry_name_allies )
{
    trigger = Spawn( "trigger_radius", origin, 0, trigger_range, 20 );

    for( ;; )
    {
        trigger waittill( "trigger", player );

        if( level.player_stats[ ToLower( player.guid ) ][ entry_name_axis ] == 0 && player.team == "axis" )
        {
            if( player UseButtonPressed() )
            {
                level.player_stats[ ToLower( player.guid ) ][ entry_name_axis ] = 1;

                player notify( "new_stats" );

                player Suicide();
            }
        }

        if( level.player_stats[ ToLower( player.guid ) ][ entry_name_allies ] == 0 && player.team == "allies" )
        {
            if( player UseButtonPressed() )
            {
                level.player_stats[ ToLower( player.guid ) ][ entry_name_allies ] = 1;

                player notify( "new_stats" );

                player Suicide();
            }
        }
    }
}