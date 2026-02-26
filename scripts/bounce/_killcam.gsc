init()
{
    replacefunc( maps\mp\gametypes\_killcam::killcam, ::on_killcam );
}

on_killcam( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );

    if ( var_0 < 0 )
    {
        return;
    }

    if ( getdvar( "scr_killcam_time" ) == "" )
    {
        if ( var_3 == "artillery_mp" || var_3 == "stealth_bomb_mp" || var_3 == "remote_mortar_missile_mp" )
        {
            var_10 = ( gettime() - var_2 ) / 1000 - var_4 - 0.1;
        }
        else if ( level.showingfinalkillcam )
        {
            var_10 = 4.0;
        }
        else if ( var_3 == "apache_minigun_mp" )
        {
            var_10 = 3.0;
        }
        else if ( var_3 == "javelin_mp" || var_3 == "uav_strike_projectile_mp" )
        {
            var_10 = 8;
        }
        else if ( issubstr( var_3, "remotemissile_" ) )
        {
            var_10 = 5;
        }
        else if ( !var_6 || var_6 > 5.0 )
        {
            var_10 = 5.0;
        }
        else if ( var_3 == "frag_grenade_mp" || var_3 == "frag_grenade_short_mp" || var_3 == "semtex_mp" )
        {
            var_10 = 4.25;
        }
        else
        {
            var_10 = 2.5;
        }
    }
    else
    {
        var_10 = getdvarfloat( "scr_killcam_time" );
    }

    if ( isdefined( var_7 ) )
    {
        if ( var_10 > var_7 )
        {
            var_10 = var_7;
        }

        if ( var_10 < 0.05 )
        {
            var_10 = 0.05;
        }
    }

    if ( getdvar( "scr_killcam_posttime" ) == "" )
    {
        var_11 = 2;
    }
    else
    {
        var_11 = getdvarfloat( "scr_killcam_posttime" );

        if ( var_11 < 0.05 )
        {
            var_11 = 0.05;
        }
    }

    var_12 = var_10 + var_11;

    if ( isdefined( var_7 ) && var_12 > var_7 )
    {
        if ( var_7 < 2 )
        {
            return;
        }

        if ( var_7 - var_10 >= 1 )
        {
            var_11 = var_7 - var_10;
        }
        else
        {
            var_11 = 1;
            var_10 = var_7 - 1;
        }

        var_12 = var_10 + var_11;
    }

    var_13 = var_10 + var_4;
    var_14 = gettime();
    self notify( "begin_killcam", var_14 );

    if ( isdefined( var_8 ) )
    {
        var_8 visionsyncwithplayer( var_9 );
    }

    self.sessionstate = "spectator";
    self.forcespectatorclient = var_0;
    self.killcamentity = -1;

    if ( var_1 >= 0 )
    {
        thread maps\mp\gametypes\_killcam::setkillcamentity( var_1, var_13, var_2 );
    }

    self.archivetime = var_13;
    self.killcamlength = var_12;
    self.psoffsettime = var_5;
    self allowspectateteam( "allies", 1 );
    self allowspectateteam( "axis", 1 );
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );

    if ( isdefined( var_8 ) && level.showingfinalkillcam )
    {
        self setclientdvar( "playercard_outline", level.playercards_outlines[ level.player_stats[ ToLower( var_8.guid )  ][ "playercard_outline" ] ] );
        self setclientdvar( "playercard_icon", level.playercards_icons[ level.player_stats[ ToLower( var_8.guid )  ][ "playercard_icon" ] ] );
        self setcarddisplayslot( var_8, 7 );
        self openmenu( "killedby_card_display" );
    }

    thread maps\mp\gametypes\_killcam::endedkillcamcleanup();
    wait 0.05;

    if ( self.archivetime < var_13 )
    {

    }

    var_10 = self.archivetime - 0.05 - var_4;
    var_12 = var_10 + var_11;
    self.killcamlength = var_12;

    if ( var_10 <= 0 )
    {
        self.sessionstate = "dead";
        self.forcespectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self notify( "killcam_ended" );

        return;
    }

    if ( level.showingfinalkillcam )
    {
        thread maps\mp\gametypes\_killcam::dofinalkillcamfx( var_10 );
    }

    self.killcam = 1;
    maps\mp\gametypes\_killcam::initkcelements();

    if ( ! ( level.splitscreen || self issplitscreenplayer() ) )
    {
        self.kc_timer.alpha = 1;
        self.kc_timer settenthstimer( var_10 );
    }

    if ( var_6 && !level.gameended )
    {
        maps\mp\_utility::setlowermessage( "kc_info", &"PLATFORM_PRESS_TO_SKIP", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
    }
    else if ( ! level.gameended )
    {
        maps\mp\_utility::setlowermessage( "kc_info", &"PLATFORM_PRESS_TO_RESPAWN", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
    }

    if ( ! level.showingfinalkillcam )
    {
        self.kc_skiptext.alpha = 1;
    }
    else
    {
        self.kc_skiptext.alpha = 0;
    }

    self.kc_othertext.alpha = 0;
    self.kc_icon.alpha = 0;
    thread maps\mp\gametypes\_killcam::spawnedkillcamcleanup();

    if ( self == var_9 && var_9 maps\mp\_utility::_hasperk( "specialty_copycat" ) && isdefined( var_9.pers[ "copyCatLoadout" ] ) && !var_8 maps\mp\_utility::isjuggernaut() )
    {
        thread maps\mp\gametypes\_killcam::waitkccopycatbutton( var_8 );
    }

    if ( ! level.showingfinalkillcam )
    {
        thread maps\mp\gametypes\_killcam::waitskipkillcambutton( var_6 );
    }
    else
    {
        self notify( "showing_final_killcam" );
    }

    thread maps\mp\gametypes\_killcam::endkillcamifnothingtoshow();
    maps\mp\gametypes\_killcam::waittillkillcamover();

    if ( level.showingfinalkillcam )
    {
        thread maps\mp\gametypes\_playerlogic::spawnendofgame();

        return;
    }

    thread maps\mp\gametypes\_killcam::calculatekillcamtime( var_14 );
    thread maps\mp\gametypes\_killcam::killcamcleanup( 1 );
}