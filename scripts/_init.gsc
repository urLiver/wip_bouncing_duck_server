init() 
{
    port = GetDvarInt( "net_port" );

    if( ! isdefined( port ) )
    {
        return;
    }

    //Game Functions Replaced and only for a certain use, mostly to add ontop of them
    thread scripts\core\_playerlogic::init();
    thread scripts\core\_infect::init();
    thread scripts\core\_rank::init();
    thread scripts\core\_database::init();

    //Custom Nuke Killstreak
    thread scripts\core\_nuke::init();

    //Chat Commands
    thread scripts\core\_chat::init();

    //Binds what else
    thread scripts\core\_binds::init();

    //Stats
    thread scripts\core\_stats::init();

    //UI in the sense of helper functions / wrappers
    thread scripts\core\_ui::init();

    precacheshader( "iw5_cardicon_frank" );
    precacheshader( "iw5_cardicon_cat" );
    precacheshader( "cardicon_weed" );
    precacheshader( "iw5_cardicon_devil" );
    precacheshader( "cardicon_gears" );

    precachemenu( "menu_window" );

    SetDvar( "sv_voice", 1 );
    SetDvar( "sv_cheats", 0 );
    SetDvar( "g_teamicon_allies", "iw5_cardicon_mushroom" );
    SetDvar("g_TeamName_Allies", "^2SURVIVORS");
    SetDvar( "g_teamicon_axis", "iw5_cardicon_cooking" );
    SetDvar("g_TeamName_Axis", "^3INFECTED");
    SetDvar("g_scorescolor_axis", "1 0.64 0 0.75");
    SetDvar("g_scorescolor_allies", "0 1 0 0.75");
    SetDvar( "motd", "**^3Gnome Peniz Picture here^7**" );
    SetDvar( "sv_consoleNameSay", "^3Gnome Peniz" );
    SetDvar( "sv_consoleNameTell", "^3Gnome Peniz" );
    SetDvar( "sv_sayName", "^3Gnome Peniz" );

    level.xpscale = 2;
    SetDvar( "scr_xpscale", "2" );

    level.money = loadfx( "props/cash_player_drop" );

    switch( port )
    {
        case 27016: //Bounce
            thread scripts\bounce\_spawn::init();
            thread scripts\bounce\_menu::init();
            thread scripts\bounce\_damage::init();
            thread scripts\bounce\_maps::init();
            thread scripts\bounce\_events::init();
            thread scripts\bounce\_perkfunctions::init();
            thread scripts\bounce\_killcam::init();
            thread scripts\bounce\_weapons::init();
            
            setDvar( "sv_enableBounces", 1 );
            setDvar( "sv_allanglesbounces", 1 );
            setDvar( "sv_enableDoubleTaps", 0 );

            setDvar( "g_playercollision", 2 );
            setDvar( "g_playerejection", 2 );
            setDvar( "g_playercollisionejectspeed", 25 );
            setDvar( "g_gravity", 800 );

            setDvar( "jump_disableFallDamage", 1 );
            setDvar( "jump_height", 45 );
            setDvar( "jump_slowdownEnable", 0 );
            setDvar( "jump_autoBunnyHop", 0 );
            setDvar( "jump_ladderpushvel", 256 );
            setDvar( "jump_stepSize", 18 );
        break;
    }
}
