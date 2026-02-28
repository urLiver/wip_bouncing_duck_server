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