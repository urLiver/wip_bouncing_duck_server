init()
{

}

do_survivor_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );

    self TakeAllWeapons();

    nade = self scripts\custom\_weapons::random_nade();
    
    if( nade == "throwingknife_mp" )
    {
        self SetOffhandPrimaryClass( "throwingknife" );
        self SetWeaponAmmoClip("throwingknife_mp", 1);
    }

    if( nade == "semtex_mp" )
    {
        self SetOffhandPrimaryClass( "other" );
    }

    self GiveWeapon( nade );
    
    nade2 = self scripts\custom\_weapons::random_nade2();

    self GiveWeapon( nade2 );

    if( nade2 == "smoke_grenade_mp" )
    {
        self SetOffhandSecondaryClass( "smoke" );
    }

    pistol = self scripts\custom\_weapons::random_pistol();

    self GiveWeapon( pistol );
    self SetWeaponAmmoStock( pistol, 9999 );
    self SetWeaponAmmoClip( pistol, 9999 );

    shotgun = self scripts\custom\_weapons::random_shotgun();

    self GiveWeapon( shotgun );
    self SetWeaponAmmoStock( shotgun, 9999 );
    self SetWeaponAmmoClip( shotgun, 9999 );

    waittillframeend;

    self SetSpawnWeapon( shotgun );
    self SwitchToWeapon( shotgun );
}

do_infected_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );

    self TakeAllWeapons();

    if( isdefined( level.half_time ) ) 
    {
        if( level.deathstreak == "betty" )
        {
            self GiveWeapon("bouncingbetty_mp");
        }
        else if( level.deathstreak == "tk" && self.stats[ "stats_deathstreak" ].value >= 4 )
        {
            self GiveWeapon( "throwingknife" );
            self SetOffhandPrimaryClass( "throwingknife" );
            self SetWeaponAmmoClip( "throwingknife_mp", 1 );
        }
    }

    self maps\mp\_utility::GivePerk( "specialty_tacticalinsertion", 1 );

    pistol = self scripts\custom\_weapons::random_pistol_no_attachments();

    self GiveWeapon( pistol );
    self SetWeaponAmmoStock( pistol, 0 );
    self SetWeaponAmmoClip( pistol, 0 );

    waittillframeend;
    
    self SetSpawnWeapon( pistol );
    self SwitchToWeapon( pistol );
}

do_first_infected_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );
    
    self TakeAllWeapons();

    self GiveWeapon( "c4_mp" );

    self maps\mp\_utility::GivePerk( "specialty_tacticalinsertion", 1 );

    pistol = self scripts\custom\_weapons::random_pistol_no_attachments();
    rpg = self scripts\custom\_weapons::random_launcher();

    self GiveWeapon( pistol );
    self SetWeaponAmmoStock( pistol, 0 );
    self SetWeaponAmmoClip( pistol, 0 );

    self GiveWeapon( rpg );
    self SetWeaponAmmoStock( rpg, 1 );
    self SetWeaponAmmoClip( rpg, 1 );

    waittillframeend;

    self SetSpawnWeapon( rpg );
    self SwitchToWeapon( rpg );
}

do_any_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );

    guid = ToLower( self.guid );

    if( level.player_stats[ guid ][ "scoreboard_icon" ] != 0 )
    {
        // Readd the special icon on some 
    }
}

watch_suicide()
{
    level endon ( "game_ended" );
    self endon ( "disconnect" );
    self endon ( "death" );

    while ( 1 )
    {
        self waittill( "SUICIDE" );
        
        if( self.sessionteam == "axis" )
        {
            self.blockroll = true;
        } 

        self Suicide();
    }
}

render_distance_func()
{
    render_distance = [ "0", "3000", "2000", "1500", "1000", "500" ];
    render_distance_text = [ "Default", "3000", "2000", "1500", "1000", "500" ];

    level.player_stats[ ToLower( self.guid ) ][ "render_distance" ]++;
    
    if( level.player_stats[ ToLower( self.guid ) ][ "render_distance" ] == render_distance.size)
    {
        level.player_stats[ ToLower( self.guid ) ][ "render_distance" ] = 0;
    }

    self setClientDvar ( "r_zfar", render_distance[ level.player_stats[ ToLower( self.guid ) ][ "render_distance" ] ] );
    self setClientDvar ( "r_zfar_text", render_distance_text[ level.player_stats[ ToLower( self.guid ) ][ "render_distance" ] ] );

    self IPrintLn( "^3" + render_distance_text[ level.player_stats[ ToLower( self.guid ) ][ "render_distance" ] ] );
}

watch_renderdistance()
{
    level endon ( "game_ended" );
    self endon ( "disconnect" );
    self endon ( "death" );
		
    while ( 1 )
    {
        self waittill( "TOGGLE_ZFAR" );
        
        self render_distance_func();
    }
}

fullbright_func()
{
    fullbright =  [ "1", "3", "2" ];
    fullbright_text =  [ "Default", "Grey Lightmap", "White Lightmap" ];

    level.player_stats[ ToLower( self.guid ) ][ "fullbright" ]++;

    if( level.player_stats[ ToLower( self.guid ) ][ "fullbright" ] == fullbright.size)
    {
        level.player_stats[ ToLower( self.guid ) ][ "fullbright" ] = 0;
    }

    self setClientDvar ( "r_lightmap", fullbright[ level.player_stats[ ToLower( self.guid ) ][ "fullbright" ] ] );
    self setClientDvar ( "r_lightmap_text", fullbright_text[ level.player_stats[ ToLower( self.guid ) ][ "fullbright" ] ] );
    
    self IPrintLn( "^3" + fullbright_text[ level.player_stats[ ToLower( self.guid ) ][ "fullbright" ] ] );
}

watch_fullbright()
{
    level endon ( "game_ended" );
    self endon ( "disconnect" );
    self endon ( "death" );

    while ( 1 )
    {
        self waittill( "TOGGLE_FULLBRIGHT" );

        self fullbright_func();
    }
}

set_binds_on_spawn()
{
    level endon ( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    
    self notifyOnPlayerCommand( "TOGGLE_ZFAR", "vote yes" );
    self notifyOnPlayerCommand( "TOGGLE_FULLBRIGHT", "vote no" );
    self notifyOnPlayerCommand( "SUICIDE", "+actionslot 6" );

    self thread watch_suicide();
    self thread watch_renderdistance();
    self thread watch_fullbright();
}