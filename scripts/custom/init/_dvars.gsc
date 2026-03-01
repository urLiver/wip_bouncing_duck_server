init()
{
    SetDvar( "sv_voice", 1 );
    SetDvar( "sv_cheats", 0 );
    SetDvar( "g_teamicon_allies", "iw5_cardicon_mushroom" );
    SetDvar("g_TeamName_Allies", "^2SURVIVORS");
    SetDvar( "g_teamicon_axis", "iw5_cardicon_cooking" );
    SetDvar("g_TeamName_Axis", "^3INFECTED");
    SetDvar("g_scorescolor_axis", "1 0.64 0 0.75");
    SetDvar("g_scorescolor_allies", "0 1 0 0.75");
    SetDvar( "sv_consoleNameSay", "^6BD" );
    SetDvar( "sv_consoleNameTell", "^6BD" );
    SetDvar( "sv_sayName", "^6BD" );

    SetDvar( "scr_xpscale", "2" );
            
    setDvar( "sv_enableBounces", 1 );
    setDvar( "sv_allanglesbounces", 1 );
    setDvar( "sv_enableDoubleTaps", 1 );

    setDvar( "g_playercollision", 2 );
    setDvar( "g_playerejection", 2 );
    setDvar( "g_playercollisionejectspeed", 25 );
    setDvar( "g_gravity", 800 );
    setDvar( "g_speed", 220 );
    
    setDvar( "jump_disableFallDamage", 1 );
    setDvar( "jump_height", 45 );
    setDvar( "jump_slowdownEnable", 1 );
    setDvar( "jump_autoBunnyHop", 0 );
    setDvar( "jump_ladderpushvel", 128 );
    setDvar( "jump_stepSize", 18 );
}

setup_client_dvars()
{
    self setclientdvar( "cg_scoreboardPingText", "1" );
    self setclientdvar( "cg_teamcolor_allies", "0 1 0 1" );
    self setclientdvar( "cg_teamcolor_axis", "1 0.64 0 1" );
}