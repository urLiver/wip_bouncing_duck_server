init()
{
    replacefunc( maps\mp\gametypes\_menus::onmenuresponse, ::on_onmenuresponse );
}

on_onmenuresponse()
{
    self endon( "disconnect" );

    for ( ;; )
    {
        self waittill( "menuresponse", var_0, var_1 );

        if ( var_1 == "back" )
        {
            self closepopupmenu();
            self closeingamemenu();

            if ( maps\mp\gametypes\_menus::isoptionsmenu( var_0 ) )
            {
                if ( self.pers[ "team" ] == "allies" )
                {
                    self openpopupmenu( game[ "menu_class_allies" ] );
                }

                if ( self.pers[ "team" ] == "axis" )
                {
                    self openpopupmenu( game[ "menu_class_axis" ] );
                }
            }

            continue;
        }

        if ( var_1 == "changeteam" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game[ "menu_team" ] );

            continue;
        }

        if ( var_1 == "changeclass_marines" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game[ "menu_changeclass_allies" ] );

            continue;
        }

        if ( var_1 == "changeclass_opfor" )
        {
            self closepopupmenu();
            self closeingamemenu();
            self openpopupmenu( game[ "menu_changeclass_axis" ] );

            continue;
        }

        if ( var_1 == "changeclass_marines_splitscreen" )
        {
            self openpopupmenu( "changeclass_marines_splitscreen" );
        }

        if ( var_1 == "changeclass_opfor_splitscreen" )
        {
            self openpopupmenu( "changeclass_opfor_splitscreen" );
        }

        if ( var_1 == "endgame" )
        {
            if ( level.splitscreen )
            {
                endparty();

                if ( ! level.gameended )
                {
                    level thread maps\mp\gametypes\_gamelogic::forceend();
                }
            }

            continue;
        }

        if ( var_1 == "endround" )
        {
            if ( ! level.gameended )
            {
                level thread maps\mp\gametypes\_gamelogic::forceend();
            }
            else
            {
                self closepopupmenu();
                self closeingamemenu();
                self iprintln( &"MP_HOST_ENDGAME_RESPONSE" );
            }

            continue;
        }

        if ( var_0 == game[ "menu_team" ] )
        {
            //switch ( var_1 )
            //{
            //    case "allies":
            //        self [[ level.allies ]]();
            //        break;
            //    case "axis":
            //        self [[ level.axis ]]();
            //        break;
            //    case "autoassign":
            //        self [[ level.autoassign ]]();
            //        break;
            //    case "spectator":
            //        self [[ level.spectator ]]();
            //        break;
            //}

            continue;
        }

        if ( var_0 == game[ "menu_changeclass" ] || isdefined( game[ "menu_changeclass_defaults_splitscreen" ] ) && var_0 == game[ "menu_changeclass_defaults_splitscreen" ] || isdefined( game[ "menu_changeclass_custom_splitscreen" ] ) && var_0 == game[ "menu_changeclass_custom_splitscreen" ] )
        {
            self closepopupmenu();
            self closeingamemenu();
            
            //self.selectedclass = 1;
            //self [[ level.class ]]( var_1 );
            
            continue;
        }

        if ( ! level.console )
        {
            if ( var_0 == game[ "menu_quickcommands" ] )
            {
                maps\mp\gametypes\_quickmessages::quickcommands( var_1 );
               
                continue;
            }

            if ( var_0 == game[ "menu_quickstatements" ] )
            {
                maps\mp\gametypes\_quickmessages::quickstatements( var_1 );
               
                continue;
            }

            if ( var_0 == game[ "menu_quickresponses" ] )
            {
                maps\mp\gametypes\_quickmessages::quickresponses( var_1 );
            }
        }

        guid = ToLower( self.guid );

        cmds = StrTok( var_1, ":" );
        
        if( ! isdefined( cmds[ 0 ] ) || !isdefined( cmds[ 1 ] ) )
        {
            continue;
        }

        switch( cmds[ 0 ] )
        {
            case "SETTING":
                switch( cmds[ 1 ] )
                {
                    case "FULLBRIGHT":
                        self scripts\custom\_binds::fullbright_func();
                    break;

                    case "RENDER_DISTANCE":
                        self scripts\custom\_binds::render_distance_func();
                    break;

                    case "MAP":
                        level.player_stats[ guid ][ "simple_map" ] = ! level.player_stats[ guid ][ "simple_map" ];
                        self setClientDvar( "r_simple_map", level.player_stats[ guid ][ "simple_map" ] );
                    break;

                    case "COMPASS":
                        level.player_stats[ guid ][ "compass" ] = ! level.player_stats[ guid ][ "compass" ];
                        self setClientDvar( "r_compass", level.player_stats[ guid ][ "compass" ] );
                    break;

                    case "XP":
                        level.player_stats[ guid ][ "xp_text" ] = ! level.player_stats[ guid ][ "xp_text" ];
                        self setClientDvar( "r_xp", level.player_stats[ guid ][ "xp_text" ] );

                        if( level.player_stats[ guid ][ "xp_text" ] )
                        {
                            self.xptextcur scripts\custom\_uiwrappers::fadein( 1.0 );
                            self.xptextmax scripts\custom\_uiwrappers::fadein( 1.0 );
                        }
                        else
                        {
                            self.xptextcur scripts\custom\_uiwrappers::fadeout( 1.0 );
                            self.xptextmax scripts\custom\_uiwrappers::fadeout( 1.0 );
                        }
                    break;
                }
            break;

            case "PRESTIGE":
                self scripts\custom\_database::set_prestige( int( cmds[ 1 ] ) );
            break;

            case "CARDTITLE":
                can_update_cardtitle = false;

                num = int( cmds[ 1 ] );                  
                switch ( num )
                {   
                    case 0:
                        can_update_cardtitle = true;        
                    break;

                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        kills_needed = [ 1000, 2500, 5000, 10000 ]; 
                        if ( kills_needed[ ( num - 1 ) ] <= level.player_stats[ guid ][ "total_kills" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 5:
                    case 6:
                    case 7:
                    case 8:
                        deaths_needed = [ 1000, 2500, 5000, 10000 ]; 
                        if ( deaths_needed[ ( num - 5 ) ] <= level.player_stats[ guid ][ "total_deaths" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;
                    
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                        nukes_called_needed = [ 1, 10, 50, 100, 200 ]; 
                        if ( nukes_called_needed[ ( num - 9 ) ] <= level.player_stats[ guid ][ "moabs_called" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 14:
                    case 15:
                        nukes_cancelled_needed = [ 10, 50 ]; 
                        if ( nukes_cancelled_needed[ ( num - 14 ) ] <= level.player_stats[ guid ][ "moabs_cancelled" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 16:
                    case 17:
                    case 18:
                    case 19:
                        prestige_needed = [ 10, 20, 30, 40 ]; 
                        if ( prestige_needed[ ( num - 16 ) ] <= level.player_stats[ guid ][ "prestige" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 20:
                    case 21:
                        tis_destroyed_needed = [ 50, 100 ]; 
                        if ( tis_destroyed_needed[ ( num - 20 ) ] <= level.player_stats[ guid ][ "tis_destroyed" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;
        
                    case 22:
                        if ( 50 <= level.player_stats[ guid ][ "chickens_killed" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 23:
                        if ( 40 <= level.player_stats[ guid ][ "highest_killstreak" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 24:
                        if ( 20 <= level.player_stats[ guid ][ "highest_melee_killstreak" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;

                    case 25:
                    case 26:
                        infected_kills_needed = [ 500, 1000 ]; 
                        if ( infected_kills_needed[ ( num - 25 ) ] <= level.player_stats[ guid ][ "infected_kills" ] )
                        {
                            can_update_cardtitle = true;
                        }
                    break;
                }

                if( can_update_cardtitle && isdefined( num ) )
                {
                    level.player_stats[ guid ][ "playercard_icon" ] = num;
                }

            break;
        }
    }
}