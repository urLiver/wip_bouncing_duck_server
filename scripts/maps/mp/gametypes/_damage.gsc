init()
{
    replacefunc( maps\mp\gametypes\_damage::handlesuicidedeath, ::on_handlesuicidedeath );
    replacefunc( maps\mp\gametypes\_damage::handlenormaldeath, ::on_handlenormaldeath );
    replacefunc( maps\mp\gametypes\_damage::resetplayervariables, ::on_resetplayervariables );
}

on_resetplayervariables()
{
    self.killedplayerscurrent = [];
    self.switching_teams = undefined;
    self.joining_team = undefined;
    self.leaving_team = undefined;
    self.pers[ "cur_kill_streak" ] = 0;
    self.pers[ "cur_kill_streak_for_nuke" ] = 0;
    maps\mp\gametypes\_gameobjects::detachusemodels();

    self.melee_killstreak = 0;
    self.normal_killstreak = 0;

    self setclientdvar( "cg_killstreak", self.pers[ "cur_kill_streak_for_nuke" ] );
}

on_handlesuicidedeath( var_0, var_1 )
{
    self thread scripts\custom\_database::upload_stats();
    
    self setclientdvar( "playercard_outline", level.playercards_outlines[ level.player_stats[ ToLower( self.guid ) ][ "playercard_outline" ] ] );
    self setclientdvar( "playercard_icon", level.playercards_icons[ level.player_stats[ ToLower( self.guid ) ][ "playercard_icon" ] ] );
    
    self setcarddisplayslot( self, 7 );
    
    self openmenu( "killedby_card_display" );
    
    self thread [ [ level.onxpevent ] ]( "suicide" );
    
    maps\mp\_utility::incpersstat( "suicides", 1 );
    
    self.suicides = maps\mp\_utility::getpersstat( "suicides" );

    if ( ! maps\mp\_utility::matchmakinggame() )
    {
        maps\mp\_utility::incplayerstat( "suicides", 1 );
    }

    var_2 = maps\mp\gametypes\_tweakables::gettweakablevalue( "game", "suicidepointloss" );
    maps\mp\gametypes\_gamescore::_getplayerscore( self, maps\mp\gametypes\_gamescore::_setplayerscore( self ) - var_2 );

    if ( var_0 == "MOD_SUICIDE" && var_1 == "none" && isdefined( self.throwinggrenade ) )
    {
        self.lastgrenadesuicidetime = gettime();
    }

    if( self.sessionteam == "allies" && isdefined( level.first_was_choosen ) && level.first_was_choosen == 1 ) //Fix for people suiciding and not switching to infected :D
    {
        self.blockroll = true;
        
        self maps\mp\gametypes\_playerlogic::removefromalivecount();
        self maps\mp\gametypes\_menus::addtoteam( "axis" );

        level.infect_teamscores[ "allies" ]--;
        level.infect_teamscores[ "axis" ]++;

        maps\mp\gametypes\infect::updateteamscores();
        var_1 = maps\mp\_utility::getwatcheddvar( "numlives" );

        if ( var_1 && self.pers[ "lives" ] )
        {
            self.pers[ "lives" ]--;
        }

        self maps\mp\gametypes\_playerlogic::addtoalivecount();

        if ( level.infect_teamscores[ "allies" ] == 1 )
        {
            maps\mp\_utility::playsoundonplayers( "mp_obj_captured" );

            foreach ( var_11 in level.players )
            {
                if ( var_11.team == "allies" && var_11 != self )
                {
                    var_11 thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_FINAL_ROGUE" );
                    maps\mp\gametypes\_gamescore::giveplayerscore( "final_rogue", var_11, undefined, 1 );
                    var_11 thread maps\mp\gametypes\_rank::giverankxp( "final_rogue" );
                    thread maps\mp\_utility::teamplayercardsplash( "callout_final_rogue", var_11 );

                    break;
                }
            }
        }
        else if ( level.infect_teamscores[ "allies" ] == 0 )
        {
            level.finalkillcam_winner = "axis";
            level thread maps\mp\gametypes\_gamelogic::endgame( "axis", game[ "strings" ][ "allies_eliminated" ] );
        }
    }
}

on_handlenormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    if( var_1.sessionteam == "axis" )
    {
        level.player_stats[ ToLower( var_1.guid )  ][ "infected_kills" ]++;
    }

    level.player_stats[ ToLower( var_1.guid )  ][ "total_kills" ]++;
    level.player_stats[ ToLower( self.guid ) ][ "total_deaths" ]++;
    
    var_1 thread scripts\custom\_database::upload_stats();
    self thread scripts\custom\_database::upload_stats();

    var_1 setclientdvar( "playercard_outline", level.playercards_outlines[ level.player_stats[ ToLower( self.guid ) ][ "playercard_outline" ] ] );
    self setclientdvar( "playercard_outline", level.playercards_outlines[ level.player_stats[ ToLower( var_1.guid )  ][ "playercard_outline" ] ] );

    var_1 setclientdvar( "playercard_icon", level.playercards_icons[ level.player_stats[ ToLower( self.guid ) ][ "playercard_icon" ] ] );
    self setclientdvar( "playercard_icon", level.playercards_icons[ level.player_stats[ ToLower( var_1.guid )  ][ "playercard_icon" ] ] );

    var_1 thread maps\mp\_events::killedplayer( var_0, self, var_3, var_4 );
    
    var_1 setcarddisplayslot( self, 8 );
    var_1 openmenu( "youkilled_card_display" );

    self setcarddisplayslot( var_1, 7 );
    self openmenu( "killedby_card_display" );

    if ( var_4 == "MOD_HEAD_SHOT" )
    {
        var_1 maps\mp\_utility::incpersstat( "headshots", 1 );
        var_1.headshots = var_1 maps\mp\_utility::getpersstat( "headshots" );
        var_1 maps\mp\_utility::incplayerstat( "headshots", 1 );

        if ( isdefined( var_1.laststand ) )
        {
            var_5 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" ) * 2;
        }
        else
        {
            var_5 = undefined;
        }

        var_1 playlocalsound( "bullet_impact_headshot_2" );
    }
    else if ( isdefined( var_1.laststand ) )
    {
        var_5 = maps\mp\gametypes\_rank::getscoreinfovalue( "kill" ) * 2;
    }
    else
    {
        var_5 = undefined;
    }

    var_1 thread maps\mp\gametypes\_rank::giverankxp( "kill", var_5, var_3, var_4 );
    var_1 maps\mp\_utility::incpersstat( "kills", 1 );
    var_1.kills = var_1 maps\mp\_utility::getpersstat( "kills" );
    var_1 maps\mp\_utility::updatepersratio( "kdRatio", "kills", "deaths" );
    var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "kills", var_1.kills );
    var_1 maps\mp\_utility::incplayerstat( "kills", 1 );

    if ( maps\mp\gametypes\_damage::isflankkill( self, var_1 ) )
    {
        var_1 maps\mp\_utility::incplayerstat( "flankkills", 1 );
        maps\mp\_utility::incplayerstat( "flankdeaths", 1 );
    }

    var_6 = var_1.pers[ "cur_kill_streak" ];
    self.pers[ "copyCatLoadout" ] = undefined;

    if ( maps\mp\_utility::_hasperk( "specialty_copycat" ) )
    {
        self.pers[ "copyCatLoadout" ] = var_1 maps\mp\gametypes\_class::cloneloadout();
    }

    if ( isalive( var_1 ) )
    {
        if ( var_1 maps\mp\_utility::killshouldaddtokillstreak( var_3 ) )
        {
            guid = ToLower( var_1.guid );
            
            if( var_4 == "MOD_MELEE" )
            {
                var_1.melee_killstreak++;

                if( var_1.melee_killstreak > level.player_stats[ guid ][ "highest_melee_killstreak" ] )
                {
                    level.player_stats[ guid ][ "highest_melee_killstreak" ] = var_1.melee_killstreak;

                    var_1 notify( "new_stats" );
                }
            }
            else 
            {
                var_1.normal_killstreak++;

                if( var_1.normal_killstreak > level.player_stats[ guid ][ "highest_killstreak" ] )
                {
                    level.player_stats[ guid ][ "highest_killstreak" ] = var_1.normal_killstreak;

                    var_1 notify( "new_stats" );
                }
            }
                
            var_1 thread maps\mp\killstreaks\_killstreaks::giveadrenaline( "kill" );
            var_1.pers[ "cur_kill_streak" ]++;

            if ( ! maps\mp\_utility::iskillstreakweapon( var_3 ) )
            {
                var_1.pers[ "cur_kill_streak_for_nuke" ]++; 
                var_1 setclientdvar( "cg_killstreak", var_1.pers[ "cur_kill_streak_for_nuke" ] );
            }
            
            var_7 = 24;

            if ( !maps\mp\_utility::iskillstreakweapon( var_3 ) && var_1.pers[ "cur_kill_streak_for_nuke" ] == var_7 )
            {
                var_1 thread maps\mp\killstreaks\_killstreaks::givekillstreak( "nuke", 0, 1, var_1, 1 );
                var_1 thread maps\mp\gametypes\_hud_message::killstreaksplashnotify( "nuke", var_7 );
                var_1 IPrintLnBold( "M.O.A.B gained ^1use^7 it" );
                var_1.used_moab = 0;
                level.succes_full_nukes++;
            }

            if( var_1.pers[ "cur_kill_streak_for_nuke" ] == 30 && var_1.used_moab == 0 )
            {
                var_1 thread punish_respawn();
            }
        }

        var_1 maps\mp\_utility::setplayerstatifgreater( "killstreak", var_1.pers[ "cur_kill_streak" ] );

        if ( var_1.pers[ "cur_kill_streak" ] > var_1 maps\mp\_utility::getpersstat( "longestStreak" ) )
        {
            var_1 maps\mp\_utility::setpersstat( "longestStreak", var_1.pers[ "cur_kill_streak" ] );
        }
    }

    var_1.pers[ "cur_death_streak" ] = 0;

    if ( var_1.pers[ "cur_kill_streak" ] > var_1 maps\mp\gametypes\_persistence::statgetchild( "round", "killStreak" ) )
    {
        var_1 maps\mp\gametypes\_persistence::statsetchild( "round", "killStreak", var_1.pers[ "cur_kill_streak" ] );
    }

    if ( var_1.pers[ "cur_kill_streak" ] > var_1.kill_streak )
    {
        var_1 maps\mp\gametypes\_persistence::statset( "killStreak", var_1.pers[ "cur_kill_streak" ] );
        var_1.kill_streak = var_1.pers[ "cur_kill_streak" ];
    }

    maps\mp\gametypes\_gamescore::giveplayerscore( "kill", var_1, self );
    maps\mp\_skill::processkill( var_1, self );
    var_8 = maps\mp\gametypes\_tweakables::gettweakablevalue( "game", "deathpointloss" );
    maps\mp\gametypes\_gamescore::_getplayerscore( self, maps\mp\gametypes\_gamescore::_setplayerscore( self ) - var_8 );

    if ( isdefined( level.ac130player ) && level.ac130player == var_1 )
    {
        level notify( "ai_killed", self );
    }

    level notify( "player_got_killstreak_" + var_1.pers[ "cur_kill_streak" ], var_1 );
    var_1 notify( "got_killstreak", var_1.pers[ "cur_kill_streak" ] );
    var_1 notify( "killed_enemy" );

    if ( isdefined( self.uavremotemarkedby ) )
    {
        if ( self.uavremotemarkedby != var_1 )
        {
            self.uavremotemarkedby thread maps\mp\killstreaks\_remoteuav::remoteuav_processtaggedassist( self );
        }

        self.uavremotemarkedby = undefined;
    }

    if ( isdefined( level.onnormaldeath ) && var_1.pers["team"] != "spectator" )
    {
        [ [ level.onnormaldeath ] ]( self, var_1, var_0 );
    }

    if ( ! level.teambased )
    {
        self.attackers = [];
        
        return;
    }
    
    level thread maps\mp\gametypes\_battlechatter_mp::saylocalsounddelayed( var_1, "kill", 0.75 );

    if ( isdefined( self.lastattackedshieldplayer ) && isdefined( self.lastattackedshieldtime ) && self.lastattackedshieldplayer != var_1 )
    {
        if ( gettime() - self.lastattackedshieldtime < 2500 )
        {
            self.lastattackedshieldplayer thread maps\mp\gametypes\_gamescore::processshieldassist( self );

            if ( self.lastattackedshieldplayer maps\mp\_utility::_hasperk( "specialty_assists" ) )
            {
                self.lastattackedshieldplayer.pers[ "assistsToKill" ]++;

                if ( ! ( self.lastattackedshieldplayer.pers[ "assistsToKill" ] % 2 ) )
                {
                    self.lastattackedshieldplayer maps\mp\gametypes\_missions::processchallenge( "ch_hardlineassists" );
                    self.lastattackedshieldplayer maps\mp\killstreaks\_killstreaks::giveadrenaline( "kill" );
                    self.lastattackedshieldplayer.pers[ "cur_kill_streak" ]++;
                }
            }
            else
            {
                self.lastattackedshieldplayer.pers[ "assistsToKill" ] = 0;
            }
        }
        else if ( isalive( self.lastattackedshieldplayer ) && gettime() - self.lastattackedshieldtime < 5000 )
        {
            var_9 = vectornormalize( anglestoforward( self.angles ) );
            var_10 = vectornormalize( self.lastattackedshieldplayer.origin - self.origin );

            if ( vectordot( var_10, var_9 ) > 0.925 )
            {
                self.lastattackedshieldplayer thread maps\mp\gametypes\_gamescore::processshieldassist( self );

                if ( self.lastattackedshieldplayer maps\mp\_utility::_hasperk( "specialty_assists" ) )
                {
                    self.lastattackedshieldplayer.pers[ "assistsToKill" ]++;

                    if ( ! ( self.lastattackedshieldplayer.pers[ "assistsToKill" ] % 2 ) )
                    {
                        self.lastattackedshieldplayer maps\mp\gametypes\_missions::processchallenge( "ch_hardlineassists" );
                        self.lastattackedshieldplayer maps\mp\killstreaks\_killstreaks::giveadrenaline( "kill" );
                        self.lastattackedshieldplayer.pers[ "cur_kill_streak" ]++;
                    }
                }
                else
                {
                    self.lastattackedshieldplayer.pers[ "assistsToKill" ] = 0;
                }
            }
        }
    }

    if ( isdefined( self.attackers ) )
    {
        foreach ( var_12 in self.attackers )
        {
            if ( ! isdefined( var_12 ) )
            {
                continue;
            }

            if ( var_12 == var_1 )
            {
                continue;
            }

            var_12 thread maps\mp\gametypes\_gamescore::processassist( self );

            if ( var_12 maps\mp\_utility::_hasperk( "specialty_assists" ) )
            {
                var_12.pers[ "assistsToKill" ]++;

                if ( ! ( var_12.pers[ "assistsToKill" ] % 2 ) )
                {
                    var_12 maps\mp\gametypes\_missions::processchallenge( "ch_hardlineassists" );
                    var_12 maps\mp\killstreaks\_killstreaks::giveadrenaline( "kill" );
                    var_12.pers[ "cur_kill_streak" ]++;
                    var_7 = 24;

                    if ( var_12.pers[ "cur_kill_streak" ] == var_7 )
                    {
                        var_12 thread maps\mp\killstreaks\_killstreaks::givekillstreak( "nuke", 0, 1, var_12, 1 );
                        var_12 thread maps\mp\gametypes\_hud_message::killstreaksplashnotify( "nuke", var_7 );
                        var_12 IPrintLnBold( "M.O.A.B gained ^1use^7 it" );
                        var_12.used_moab = 0;
                        level.succes_full_nukes++;
                    }

                    if( var_12.pers[ "cur_kill_streak_for_nuke" ] == 30 && var_12.used_moab == 0 )
                    {
                        var_12 thread punish_respawn();
                    }
                }

                continue;
            }

            var_12.pers[ "assistsToKill" ] = 0;
        }

        self.attackers = [];
    }
}

punish_respawn()
{
    self endon( "disconnect" );
    self endon( "death" );

    spawnpoint = level.spawnpoints[ RandomInt( level.spawnpoints.size ) ];
    self setOrigin( spawnpoint.origin );
    self setplayerangles( spawnpoint.angles );
}