init()
{
	replacefunc( maps\mp\gametypes\infect::choosefirstinfected, ::on_choosefirstinfected );
	replacefunc( maps\mp\gametypes\infect::getspawnpoint, ::on_getspawnpoint );
	replacefunc( maps\mp\gametypes\infect::onspawnplayer, ::on_onspawnplayer );
}

on_choosefirstinfected()
{
    level endon( "game_ended" );

    maps\mp\_utility::gameflagwait( "prematch_done" );
    
	if( isdefined( level.infect_timerDisplay ) )
    {
		level.infect_timerDisplay destroy();
	}

    level.infect_timerdisplay = maps\mp\gametypes\_hud_util::createservertimer( "bigfixed", 0.6 );
    level.infect_timerdisplay maps\mp\gametypes\_hud_util::setpoint( "CENTER", "TOP", 0, 10 );
    level.infect_timerdisplay.label = &"Infected Cooldown: ^3";
    level.infect_timerdisplay settimer( 15 );
    level.infect_timerdisplay.alpha = 0;
    level.infect_timerdisplay fadeovertime( 1.0 );
    level.infect_timerdisplay.alpha = 1;
    level.infect_timerdisplay.archived = 0;
    level.infect_timerdisplay.hidewheninmenu = 1;

    maps\mp\gametypes\_hostmigration::waitlongdurationwithhostmigrationpause( 15 );

    level.infect_timerdisplay fadeovertime( 1.0 );
    level.infect_timerdisplay.alpha = 0;

    var_0 = level.players[ randomint( level.players.size ) ];
    var_0.infect_isbeingchosen = 1;
    var_0 endon( "disconnect" );

    while ( ! maps\mp\_utility::isreallyalive( var_0 ) || var_0 maps\mp\_utility::isusingremote() )
    {
        wait 0.05;
    }

    if ( isdefined( var_0.iscarrying ) && var_0.iscarrying == 1 )
    {
        var_0 notify( "force_cancel_placement" );
        wait 0.05;
    }

    if ( var_0 maps\mp\_utility::isjuggernaut() )
    {
        var_0 notify( "lost_juggernaut" );
        wait 0.05;
    }

    var_0 maps\mp\gametypes\_playerlogic::removefromalivecount();
    var_0 maps\mp\gametypes\_menus::addtoteam( "axis" );
    level.infect_chosefirstinfected = 1;
    var_0.infect_isbeingchosen = undefined;
    var_0.isinitialinfected = 1;

    level.infect_teamscores[ "allies" ]--;
    level.infect_teamscores[ "axis" ]++;

    maps\mp\gametypes\infect::updateteamscores();
    var_1 = maps\mp\_utility::getwatcheddvar( "numlives" );

    if ( var_1 && var_0.pers[ "lives" ] )
    {
        var_0.pers[ "lives" ]--;
    }
    
    var_0 maps\mp\gametypes\_playerlogic::addtoalivecount();
    var_0.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];

    var_2 = spawn( "script_model", var_0.origin );
    var_2.angles = var_0.angles;
    var_2.playerspawnpos = var_0.origin;
    var_2.notti = 1;

    var_0.setspawnpoint = var_2;
    var_0 notify( "faux_spawn" );
    var_0.faux_spawn_stance = var_0 getstance();
    var_0 thread maps\mp\gametypes\_playerlogic::spawnplayer( 1 );
    
    //thread maps\mp\_utility::teamplayercardsplash( "callout_first_mercenary", var_0 );
    maps\mp\_utility::playsoundonplayers( "mp_enemy_obj_captured" );

    level.first_was_choosen = 1;
    
    level notify( "first_spawn_done" );
    
    if( isdefined( level.first_chosen ) )
    {
       [ [  level.first_chosen ] ] ();
    }
    
    wait 1;
    
	if( isdefined( level.infect_timerDisplay ) )
    {
		level.infect_timerDisplay destroy();
	}
}

on_getspawnpoint()
{
    if ( self.custom_infect_firstspawn )
    {
        self.infect_firstactualspawn = 1;
        self.pers["class"] = "gamemode";
        self.pers["lastClass"] = "";
        self.class = self.pers["class"];
        self.lastclass = self.pers["lastClass"];
		
		if( self.custom_infect_firstspawn == 1 )
		{
	        maps\mp\gametypes\_menus::addtoteam( "allies", 1 );
		}
		else
		{
	        maps\mp\gametypes\_menus::addtoteam( "axis", 1 );
		}

        self.custom_infect_firstspawn = 0;
    }

    if ( level.ingraceperiod )
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getspawnpointarray( "mp_tdm_spawn" );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_random( var_0 );
    }
    else
    {
        var_0 = maps\mp\gametypes\_spawnlogic::getteamspawnpoints( self.pers["team"] );
        var_1 = maps\mp\gametypes\_spawnlogic::getspawnpoint_nearteam( var_0 );
    }

    return var_1;
}

camera_movein()
{
    self waittill( "spawned_player" );

	self hide();
	self freezeControls( 1 );
	self disableweapons();

    camera_height = 2000;

    spawn_origin = self.origin;
    spawn_angles = self.angles;

	camera = spawn( "script_model", ( spawn_origin + ( 0, 0, camera_height ) ) );	
	camera setmodel( "tag_origin" );
	camera.angles = ( 89, spawn_angles[ 1 ], 0 );

    if( level.script == "mp_nuked" )
    {
		self PlayerLinkWeaponviewToDelta( camera, "tag_player", 1.0, 0, 0, 0, 0, true ); 
    }
	else
    {
		self PlayerLinkToAbsolute( camera, "tag_player", 1.0, 0, 0, 0, 0, true );
    }

    wait( 0.01 );

	camera moveto ( ( spawn_origin + ( 0, 0, 40 ) ), 1.2 );

    wait( 1.3 );

	camera rotateto( spawn_angles, 0.5 );

    wait( 0.6 );

    self SetOrigin( spawn_origin );
    self SetPlayerAngles( spawn_angles );
	self enableweapons();
    self Unlink();
    self show();
	self freezeControls( 0 );
	camera delete();
}

on_onspawnplayer()
{
    maps\mp\gametypes\infect::updateteamscores();

    if ( ! level.infect_choosingfirstinfected )
    {
        level.infect_choosingfirstinfected = 1;
        level thread maps\mp\gametypes\infect::choosefirstinfected();
    }

    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers["gamemodeLoadout"] = level.infect_loadouts[ "axis_initial" ];
    }
    else
    {
        self.pers["gamemodeLoadout"] = level.infect_loadouts[ self.pers["team"] ];
    }

    if ( self.infect_firstactualspawn )
    {
        self thread camera_movein();

        self.infect_firstactualspawn = 0;
        
        if( self.sessionteam == "allies" )
        {
            level.infect_teamscores[ "allies" ]++;        
        }
        else
        {
            level.infect_teamscores[ "axis" ]++;        
        }

        maps\mp\gametypes\infect::updateteamscores();
    }

    level notify( "spawned_player" );
}
