init()
{
    replacefunc( maps\mp\gametypes\_deathicons::adddeathicon, ::on_adddeathicon );
}

on_adddeathicon( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0.origin;

    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );

    wait 0.05;

    maps\mp\_utility::waittillslowprocessallowed();

    if ( isdefined( self.lastdeathicon ) )
	{
        self.lastdeathicon destroy();
	}

    var_5 = newteamhudelem( var_2 );
    var_5.x = var_4[ 0 ];
    var_5.y = var_4[ 1 ];
    var_5.z = var_4[ 2 ] + 54;
    var_5.alpha = 0.61;
    var_5.archived = 1;
    var_5 setshader( "headicon_dead", 7, 7 );
    var_5 setwaypoint( 0 );

    self.lastdeathicon = var_5;

    var_5 thread destroyslowly( var_3 );
}

destroyslowly( var_0 )
{
    self endon( "death" );
    
	wait( var_0 );
    
	self fadeovertime( 0.5 );
    self.alpha = 0;
    
	wait 0.5;
    
	self destroy();
}
