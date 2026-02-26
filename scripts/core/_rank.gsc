init()
{
    replacefunc( maps\mp\gametypes\_rank::syncxpstat, ::on_syncxpstat );
    replacefunc( maps\mp\gametypes\_rank::updaterankannouncehud, ::on_updaterankannouncehud );
    replacefunc( maps\mp\gametypes\_rank::giverankxp, ::on_giverankxp );
}

on_updaterankannouncehud()
{
    self endon( "disconnect" );

    self IPrintLnBold( "New Level: ^3" + ( self.pers[ "rank" ] + 1 ) );
}

on_syncxpstat()
{
    if( isdefined ( self.pers[ "rankxp" ] ) )
    {
        level.player_stats[ ToLower( self.guid ) ][ "xp" ] = self.pers[ "rankxp" ]; 
    }

    self thread scripts\core\_stats::upload_stats();
}

on_giverankxp( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    var_5 = "none";

    if ( ! maps\mp\_utility::rankingenabled() )
    {
        if ( var_0 == "assist" )
        {
            if ( isdefined( self.taggedassist ) )
            {
                self.taggedassist = undefined;
            }
            else
            {
                var_6 = &"MP_ASSIST";

                if ( maps\mp\_utility::_hasperk( "specialty_assists" ) )
                {
                    if ( ! ( self.pers[ "assistsToKill" ] % 2 ) )
                    {
                        var_6 = &"MP_ASSIST_TO_KILL";
                    }
                }

                thread maps\mp\gametypes\_rank::xpeventpopup( var_6 );
            }
        }

        return;
    }

    if ( level.teambased && ( ! level.teamcount[ "allies" ] || ! level.teamcount[ "axis" ] ) )
    {
        return;
    }
    else if ( ! level.teambased && level.teamcount[ "allies" ] + level.teamcount[ "axis" ] < 2 )
    {
        return;
    }

    if ( ! isdefined( var_1 ) )
    {
        var_1 = maps\mp\gametypes\_rank::getscoreinfovalue( var_0 );
    }

    if ( ! isdefined( self.xpgains[ var_0 ] ) )
    {
        self.xpgains[ var_0 ] = 0;
    }

    var_7 = 0;
    var_8 = 0;

    switch ( var_0 )
    {
        case "kill":
        case "headshot":
        case "shield_damage":
            var_1 *= self.xpscaler;
        case "save":
        case "destroy":
        case "assist":
        case "suicide":
        case "teamkill":
        case "return":
        case "capture":
        case "defend":
        case "assault":
        case "pickup":
        case "plant":
        case "defuse":
        case "kill_confirmed":
        case "kill_denied":
        case "tags_retrieved":
        case "team_assist":
        case "kill_bonus":
        case "kill_carrier":
        case "draft_rogue":
        case "survivor":
        case "final_rogue":
        case "gained_gun_rank":
        case "dropped_enemy_gun_rank":
        case "got_juggernaut":
        case "kill_as_juggernaut":
        case "kill_juggernaut":
        case "jugg_on_jugg":
            if ( maps\mp\_utility::getgametypenumlives() > 0 )
            {
                var_9 = max( 1, int( 10 / maps\mp\_utility::getgametypenumlives() ) );
                var_1 = int( var_1 * var_9 );
            }

            var_10 = 1;

            var_1 = int( var_1 * level.xpscale * var_10 );

            if ( isdefined( level.nukedetonated ) && level.nukedetonated )
            {
                if ( level.teambased && level.nukeinfo.team == self.team )
                {
                    var_1 *= level.nukeinfo._id_0036;
                }
                else if ( !level.teambased && level.nukeinfo.player == self )
                {
                    var_1 *= level.nukeinfo._id_0036;
                }

                var_1 = int( var_1 );
            }

            var_14 = maps\mp\gametypes\_rank::getrestxpaward( var_1 );
            var_1 += var_14;

            if ( var_14 > 0 )
            {
                if ( maps\mp\gametypes\_rank::islastrestxpaward( var_1 ) )
                {
                    thread maps\mp\gametypes\_hud_message::splashnotify( "rested_done" );
                }

                var_8 = 1;
            }

            break;
        case "challenge":
            var_10 = 0;

            if ( self getplayerdata( "challengeXPMultiplierTimePlayed", 0 ) < self.bufferedchildstatsmax["challengeXPMaxMultiplierTimePlayed"][ 0 ] )
            {
                var_10 += int( self getplayerdata( "challengeXPMultiplier", 0 ) );

                if ( var_10 > 0 )
                {
                    var_1 = int( var_1 * var_10 );
                }
            }

            break;
    }

    var_1 *= 7.5;

    if( var_1 == 750 )
    {
        var_1 *= 2;
    }

    if ( !var_8 )
    {
        if ( self getplayerdata( "restXPGoal" ) > maps\mp\gametypes\_rank::getrankxp() )
        {   
            self setplayerdata( "restXPGoal", self getplayerdata( "restXPGoal" ) + var_1 );
        }
    }

    var_15 = maps\mp\gametypes\_rank::getrankxp();
    self.xpgains[var_0] += var_1;
    maps\mp\gametypes\_rank::incrankxp( var_1 );

    if ( maps\mp\_utility::rankingenabled() && maps\mp\gametypes\_rank::updaterank( var_15 ) )
    {
        thread maps\mp\gametypes\_rank::updaterankannouncehud();
    }

    maps\mp\gametypes\_rank::syncxpstat();
    var_16 = maps\mp\gametypes\_missions::isweaponchallenge( var_4 );

    if ( var_16 )
    {
        var_2 = self getcurrentweapon();
    }

    if ( var_0 == "shield_damage" )
    {
        var_2 = self getcurrentweapon();
        var_3 = "MOD_MELEE";
    }

    if ( maps\mp\gametypes\_rank::weaponshouldgetxp( var_2, var_3 ) || var_16 )
    {
        var_17 = strtok( var_2, "_" );

        if ( var_17[ 0 ] == "iw5" )
        {
            var_18 = var_17[ 0 ] + "_" + var_17[ 1 ];
        }
        else if ( var_17[ 0 ] == "alt" )
        {
            var_18 = var_17[ 1 ] + "_" + var_17[2];
        }
        else
        {
            var_18 = var_17[ 0 ];
        }

        if ( var_17[ 0 ] == "gl" )
        {
            var_18 = var_17[ 1 ];
        }

        if ( self isitemunlocked( var_18 ) )
        {
            if ( self.primaryweapon == var_2 || self.secondaryweapon == var_2 || weaponaltweaponname( self.primaryweapon ) == var_2 || isdefined( self.tookweaponfrom ) && isdefined( self.tookweaponfrom[var_2] ) )
            {
                var_19 = maps\mp\gametypes\_rank::getweaponrankxp( var_18 );

                switch ( var_0 )
                {
                    case "kill":
                        var_20 = 100;
                        break;
                    default:
                        var_20 = var_1;
                        break;
                }

                if ( self.prestigedoubleweaponxp )
                {
                    var_21 = self getplayerdata( "prestigeDoubleWeaponXpTimePlayed" );

                    if ( var_21 >= self.bufferedstatsmax["prestigeDoubleWeaponXpMaxTimePlayed"] )
                    {
                        self setplayerdata( "prestigeDoubleWeaponXp", 0 );
                        self setplayerdata( "prestigeDoubleWeaponXpTimePlayed", 0 );
                        self setplayerdata( "prestigeDoubleWeaponXpMaxTimePlayed", 0 );
                        self.prestigedoubleweaponxp = 0;
                    }
                    else
                        var_20 *= 2;
                }

                if ( self getplayerdata( "weaponXPMultiplierTimePlayed", 0 ) < self.bufferedchildstatsmax["weaponXPMaxMultiplierTimePlayed"][ 0 ] )
                {
                    var_22 = int( self getplayerdata( "weaponXPMultiplier", 0 ) );

                    if ( var_22 > 0 )
                        var_20 *= var_22;
                }

                var_23 = var_19 + var_20;

                if ( !maps\mp\gametypes\_rank::isweaponmaxrank( var_18 ) )
                {
                    var_24 = maps\mp\gametypes\_rank::getweaponmaxrankxp( var_18 );

                    if ( var_23 > var_24 )
                    {
                        var_23 = var_24;
                        var_20 = var_24 - var_19;
                    }

                    if ( !isdefined( self.weaponsused ) )
                    {
                        self.weaponsused = [];
                        self.weaponxpearned = [];
                    }

                    var_25 = 0;
                    var_26 = 999;

                    for ( var_13 = 0; var_13 < self.weaponsused.size; var_13++ )
                    {
                        if ( self.weaponsused[ var_13 ] == var_18 )
                        {
                            var_25 = 1;
                            var_26 = var_13;
                        }
                    }

                    if ( var_25 )
                    {
                        self.weaponxpearned[ var_26 ] += var_20;
                    }
                    else
                    {
                        self.weaponsused[ self.weaponsused.size ] = var_18;
                        self.weaponxpearned[ self.weaponxpearned.size ] = var_20;
                    }

                    self setplayerdata( "weaponXP", var_18, var_23 );
                    maps\mp\_matchdata::logweaponstat( var_18, "XP", var_20 );
                    maps\mp\_utility::incplayerstat( "weaponxpearned", var_20 );

                    if ( maps\mp\_utility::rankingenabled() && maps\mp\gametypes\_rank::updateweaponrank( var_23, var_18 ) )
                    {
                        thread maps\mp\gametypes\_rank::updateweaponrankannouncehud();
                    }
                }
            }
        }
    }

    if ( ! level.hardcoremode )
    {
        if ( var_0 == "teamkill" )  
        {
            thread maps\mp\gametypes\_rank::xppointspopup( 0 - maps\mp\gametypes\_rank::getscoreinfovalue( "kill" ), 0, ( 1.0, 0.0, 0.0 ), 0 );
        }
        else
        {
            var_27 = ( 1.0, 1.0, 0.5 );

            if ( var_8 )
            {
                var_27 = ( 1.0, 0.65, 0.0 );
            }

            thread maps\mp\gametypes\_rank::xppointspopup( var_1, var_7, var_27, 0 );

            if ( var_0 == "assist" )
            {
                if ( isdefined( self.taggedassist ) )
                {
                    self.taggedassist = undefined;
                }
                else
                {
                    var_6 = &"MP_ASSIST";

                    if ( maps\mp\_utility::_hasperk( "specialty_assists" ) )
                    {
                        if ( ! ( self.pers[ "assistsToKill" ] % 2 ) )
                        {
                            var_6 = &"MP_ASSIST_TO_KILL";
                        }
                    }

                    thread maps\mp\gametypes\_rank::xpeventpopup( var_6 );
                }
            }
        }
    }

    switch ( var_0 )
    {
        case "kill":
        case "assist":
        case "suicide":
        case "teamkill":
        case "headshot":
        case "return":
        case "capture":
        case "defend":
        case "assault":
        case "pickup":
        case "plant":
        case "defuse":
        case "kill_confirmed":
        case "kill_denied":
        case "tags_retrieved":
        case "team_assist":
        case "kill_bonus":
        case "kill_carrier":
        case "draft_rogue":
        case "survivor":
        case "final_rogue":
        case "gained_gun_rank":
        case "dropped_enemy_gun_rank":
        case "got_juggernaut":
        case "kill_as_juggernaut":
        case "kill_juggernaut":
        case "jugg_on_jugg":
            self.pers[ "summary" ][ "score" ] += var_1;
            self.pers[ "summary" ][ "xp" ] += var_1;
            break;
        case "win":
        case "loss":
        case "tie":
            self.pers[ "summary" ][ "match" ] += var_1;
            self.pers[ "summary" ][ "xp" ] += var_1;
            break;
        case "challenge":
            self.pers[ "summary" ][ "challenge" ] += var_1;
            self.pers[ "summary" ][ "xp" ] += var_1;
            break;
        default:
            self.pers[ "summary" ][ "misc" ] += var_1;
            self.pers[ "summary" ][ "match" ] += var_1;
            self.pers[ "summary" ][ "xp" ] += var_1;
            break;
    }
}