init()
{
    replacefunc( maps\mp\perks\_perkfunctions::glowstickenemyuselistener, ::on_glowstickenemyuselistener );
    replacefunc( maps\mp\perks\_perkfunctions::glowstickdamagelistener, ::on_glowstickdamagelistener );
	replacefunc( maps\mp\perks\_perkfunctions::glowsticksetupandwaitfordeath, ::on_glowsticksetupandwaitfordeath );
}

on_glowsticksetupandwaitfordeath( var_0 )
{
    self setmodel( level.precachemodel[ "enemy" ] );

    thread maps\mp\perks\_perkfunctions::glowstickdamagelistener( var_0 );
    thread maps\mp\perks\_perkfunctions::glowstickenemyuselistener( var_0 );
    thread maps\mp\perks\_perkfunctions::glowstickuselistener( var_0 );
    thread maps\mp\perks\_perkfunctions::glowstickteamupdater( level.otherteam[ self.team ], level.spawnglow[ "enemy" ], var_0 );
   
    var_1 = spawn( "script_model", self.origin + ( 0.0, 0.0, 0.0 ) );
    var_1.angles = self.angles;
    var_1 setmodel( level.precachemodel[ "friendly" ] );
    var_1 setcontents( 0 );
    var_1 thread maps\mp\perks\_perkfunctions::glowstickteamupdater( self.team, level.spawnglow[ "friendly" ], var_0 );
    var_1 playloopsound( "emt_road_flare_burn" );
    
	self waittill( "death" );
    
	var_1 stoploopsound();
    var_1 delete();
}

on_glowstickenemyuselistener( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self.enemytrigger setcursorhint( "HINT_NOICON" );
    self.enemytrigger sethintstring( &"MP_PATCH_DESTROY_TI" );
    self.enemytrigger maps\mp\_utility::makeenemyusable( var_0 );

    for ( ;; )
    {
        self.enemytrigger waittill( "trigger", var_1 );

        var_1 notify( "destroyed_insertion", var_0 );
        var_1 notify( "destroyed_explosive" );

        level.player_stats[ ToLower( var_1.guid )  ][ "tis_destroyed" ]++; 

        var_1 notify( "new_stats" );

        if ( isdefined( var_0 ) && var_1 != var_0 )
        {
            var_0 thread maps\mp\_utility::leaderdialogonplayer( "ti_destroyed" );
        }

        var_1 thread maps\mp\perks\_perkfunctions::deleteti( self );
    }
}

on_glowstickdamagelistener( var_0 )
{
    self endon( "death" );
    self setcandamage( 1 );
    self.health = 999999;
    self.maxhealth = 100;
    self.damagetaken = 0;

    for ( ;; )
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( ! maps\mp\gametypes\_weapons::friendlyfirecheck( self.owner, var_2 ) )
        {
            continue;
        }

        if ( isdefined( var_10 ) )
        {
            switch ( var_10 )
            {
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "flash_grenade_mp":
                    continue;
            }
        }

        if ( ! isdefined( self ) )
        {
            return;
        }

        if ( var_5 == "MOD_MELEE" )
        {
            self.damagetaken += self.maxhealth;
        }

        if ( isdefined( var_9 ) && var_9 & level.idflags_penetration )
        {
            self.wasdamagedfrombulletpenetration = 1;
        }

        self.wasdamaged = 1;
        self.damagetaken += var_1;

        if ( isplayer( var_2 ) )
        {
            var_2 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "tactical_insertion" );
        }

        if ( self.damagetaken >= self.maxhealth )
        {
            if ( isdefined( var_0 ) && var_2 != var_0 )
            {
                var_2 notify( "destroyed_insertion", var_0 );
                var_2 notify( "destroyed_explosive" );

                level.player_stats[ ToLower( var_2.guid )  ][ "tis_destroyed" ]++; 

                var_2 notify( "new_stats" );

                var_0 thread maps\mp\_utility::leaderdialogonplayer( "ti_destroyed" );
            }

            var_2 thread maps\mp\perks\_perkfunctions::deleteti( self );
        }
    }
}
