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
    SetDvar( "motd", "**^3Gnome Peniz Picture here^7**" );
    SetDvar( "sv_consoleNameSay", "^3Gnome Peniz" );
    SetDvar( "sv_consoleNameTell", "^3Gnome Peniz" );
    SetDvar( "sv_sayName", "^3Gnome Peniz" );

    SetDvar( "scr_xpscale", "2" );
            
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
}