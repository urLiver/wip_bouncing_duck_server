init()
{
  replacefunc( maps\mp\gametypes\_playerlogic::spawnplayer, ::on_spawnplayer );
}

on_spawnplayer( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );

    if ( ! isdefined( var_0 ) )
    {
        var_0 = 0;
    }

    if ( isdefined( self.setspawnpoint ) && ( isdefined( self.setspawnpoint.notti ) || self maps\mp\gametypes\_playerlogic::tivalidationcheck() ) )
    {
        var_1 = self.setspawnpoint;

        if ( ! isdefined( self.setspawnpoint.notti ) )
        {
            self playlocalsound( "tactical_spawn" );

            if ( level.teambased )
            {
                self playsoundtoteam( "tactical_spawn", level.otherteam[ self.team ] );
            }
            else
            {
                self playsound( "tactical_spawn" );
            }
        }

        foreach ( var_3 in level.ugvs )
        {
            if ( distancesquared( var_3.origin, var_1.playerspawnpos ) < 1024 )
            {
                var_3 notify( "damage", 5000, var_3.owner, ( 0.0, 0.0, 0.0 ), ( 0.0, 0.0, 0.0 ), "MOD_EXPLOSIVE", "", "", "", undefined, "killstreak_emp_mp" );
            }
        }

        var_5 = self.setspawnpoint.playerspawnpos;
        var_6 = self.setspawnpoint.angles;

        if ( isdefined( self.setspawnpoint.enemytrigger ) )
        {
            self.setspawnpoint.enemytrigger delete();
        }

        self.setspawnpoint delete();
        var_1 = undefined;
    }
    else
    {
        var_1 = self [ [  level.getspawnpoint  ] ]();
        var_5 = var_1.origin;
        var_6 = var_1.angles;
    }

    self maps\mp\gametypes\_playerlogic::setspawnvariables();
    var_7 = self.hasspawned;
    self.fauxdead = undefined;

    if ( !var_0 )
    {
        self.killsthislife = [];
        self maps\mp\gametypes\_playerlogic::updatesessionstate( "playing", "" );
        maps\mp\_utility::clearkillcamstate();
        self.cancelkillcam = 1;
        self openmenu( "killedby_card_hide" );
        self.maxhealth = maps\mp\gametypes\_tweakables::gettweakablevalue( "player", "maxhealth" );
        self.health = self.maxhealth;
        self.friendlydamage = undefined;
        self.hasspawned = 1;
        self.spawntime = gettime();
        self.wasti = !isdefined( var_1 );
        self.afk = 0;
        self.damagedplayers = [];
        self.killstreakscaler = 1;
        self.xpscaler = 1;
        self.objectivescaler = 1;
        self.clampedhealth = undefined;
        self.shielddamage = 0;
        self.shieldbullethits = 0;
        self.recentshieldxp = 0;
    }

    self.movespeedscaler = 1;
    self.inlaststand = 0;
    self.laststand = undefined;
    self.infinalstand = undefined;
    self.inc4death = undefined;
    self.disabledweapon = 0;
    self.disabledweaponswitch = 0;
    self.disabledoffhandweapons = 0;
    common_scripts\utility::resetusability();

    if ( !var_0 )
    {
        self.avoidkillstreakonspawntimer = 5.0;

        if ( self.pers[ "lives" ] == maps\mp\_utility::getgametypenumlives() )
        {
            self maps\mp\gametypes\_playerlogic::addtolivescount();
        }

        if ( self.pers[ "lives" ] )
        {
            self.pers[ "lives" ]--;
        }

        self maps\mp\gametypes\_playerlogic::addtoalivecount();

        if ( ! var_7 || maps\mp\_utility::gamehasstarted() || maps\mp\_utility::gamehasstarted() && level.ingraceperiod && self.hasdonecombat )
        {
            self maps\mp\gametypes\_playerlogic::removefromlivescount();
        }

        if ( ! self.wasaliveatmatchstart )
        {
            var_8 = 20;

            if ( maps\mp\_utility::gettimelimit() > 0 && var_8 < maps\mp\_utility::gettimelimit() * 60 / 4 )
            {
                var_8 = maps\mp\_utility::gettimelimit() * 60 / 4;
            }

            if ( level.ingraceperiod || maps\mp\_utility::gettimepassed() < var_8 * 1000 )
            {
                self.wasaliveatmatchstart = 1;
            }
        }
    }

    if ( isdefined( var_1 ) )
    {
        maps\mp\gametypes\_spawnlogic::finalizespawnpointchoice( var_1 );
        var_5 = self maps\mp\gametypes\_playerlogic::getspawnorigin( var_1 );
        var_6 = var_1.angles;
    }
    else
    {
        self.lastspawntime = gettime();
    }

    self.spawnpos = var_5;
    self spawn( var_5, var_6 );

    if ( var_0 && isdefined( self.faux_spawn_stance ) )
    {
        self setstance( self.faux_spawn_stance );
        self.faux_spawn_stance = undefined;
    }

    [ [  level.onspawnplayer  ] ]();

    if ( isdefined( var_1 ) )
    {
        self maps\mp\gametypes\_playerlogic::checkpredictedspawnpointcorrectness( var_1.origin );
    }

    if ( !var_0 )
    {
        maps\mp\gametypes\_missions::playerspawned();
    }

    maps\mp\gametypes\_class::setclass( self.class );
    maps\mp\gametypes\_class::giveloadout( self.team, self.class ) ;

    if ( !maps\mp\_utility::gameflag( "prematch_done" ) )
    {
        maps\mp\_utility::freezecontrolswrapper( 1 );
    }
    else
    {
        maps\mp\_utility::freezecontrolswrapper( 0 );
    }

    if ( ! maps\mp\_utility::gameflag( "prematch_done" ) || !var_7 && game[ "state" ] == "playing" )
    {
        self setclientdvar( "scr_objectiveText", maps\mp\_utility::getobjectivehinttext( self.pers[ "team" ] ) );
        var_9 = self.pers[ "team" ];

        if ( game[ "status" ] == "overtime" )
        {
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game[ "strings" ][ "overtime" ], game[ "strings" ][ "overtime_hint" ], undefined, ( 1.0, 0.0, 0.0 ), "mp_last_stand" );
        }
        else if ( maps\mp\_utility::getintproperty( "useRelativeTeamColors", 0 ) )
        {
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game[ "strings" ][ var_9 + "_name" ], undefined, game[ "icons" ][ var_9 ] + "_blue", game[ "colors" ][ "blue" ] );
        }
        else
        {
            thread maps\mp\gametypes\_hud_message::oldnotifymessage( game[ "strings" ][ var_9 + "_name" ], undefined, game[ "icons" ][ var_9 ], game[ "colors" ][ var_9 ] );
        }

        thread maps\mp\gametypes\_playerlogic::showspawnnotifies();
    }

    waittillframeend;
    
    self.spawningafterremotedeath = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );

    if ( game[ "state" ] == "postgame" )
    {
        maps\mp\gametypes\_gamelogic::freezeplayerforroundend();
    }

    wait 0.05;

    if( isdefined( level.any_spawn ) )
    {
        self [ [ level.any_spawn ] ] ();
    }

    if ( self.sessionteam == "allies" )
    {
        if( isdefined( level.survivor_spawn ) )
        {
            self [ [ level.survivor_spawn ] ] ();
        }
    }
    else if( self.sessionteam == "axis" )
    {
        if( isdefined( self.isinitialinfected ) )
        {
            if( isdefined( level.first_infected_spawn ) )
            {
                self [ [ level.first_infected_spawn ] ] ();
            }
            else 
            {
                self [ [ level.infected_spawn ] ] ();
            }
        }
        else
        {
            if( isdefined( level.infected_spawn ) )
            {
                self [ [ level.infected_spawn ] ] ();
            }
        }
    }

    self thread scripts\core\_binds::do_spawn();
}
