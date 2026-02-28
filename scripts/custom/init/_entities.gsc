init()
{
    foreach( elem in GetEntArray( "misc_turret", "classname" ) )
    {
        elem delete();
    }

    foreach( entry in getentarray() )
    {
        if( isdefined( entry.targetname ) && entry.targetname == "destructible_toy" && isdefined( entry.model ) && issubstr( entry.model, "chicken" ) )
        {
            entry thread on_damage_chicken();
        }
    }   
}

on_damage_chicken()
{
    for ( ;; )
    {
        self waittill( "damage", var_0, var_1 );

        if( ! isdefined( var_1 ) )
        {
            continue;
        }

        if( self.health > 0 )
        {
            continue;
        }

        level.player_stats[ ToLower( var_1.guid )  ][ "chickens_killed" ]++;

        if( isdefined( self.origin ) )
        {
            PlayFX( level.money, self.origin );
        }

        var_1 notify( "new_stats" );

        break;
    }
}
