init()
{
    level.survivor_spawn = ::do_survivor_spawn;
    level.first_infected_spawn = ::do_first_infected_spawn;
    level.infected_spawn = ::do_infected_spawn;
    level.any_spawn = ::do_special_spawn;

    //Survivor
    level.infect_loadouts[ "allies" ][ "loadoutPrimary" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment2" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPrimaryBuff" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPrimaryCamo" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPrimaryReticle" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutSecondary" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment2" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutSecondaryBuff" ] = "specialty_null";
    level.infect_loadouts[ "allies" ][ "loadoutSecondaryCamo" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutSecondaryReticle" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutEquipment" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutOffhand" ] = "none";
    level.infect_loadouts[ "allies" ][ "loadoutPerk1" ] = "specialty_longersprint";
    level.infect_loadouts[ "allies" ][ "loadoutPerk2" ] = "specialty_hardline";
    level.infect_loadouts[ "allies" ][ "loadoutPerk3" ] = "specialty_null";
    level.infect_loadouts[ "allies" ][ "loadoutStreakType" ] = "streaktype_specialist";
    level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = "specialty_fastreload_ks";
    level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = "specialty_quieter_ks";
    level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = "_specialty_blastshield_ks";
    level.infect_loadouts[ "allies" ][ "loadoutDeathstreak" ] = "specialty_null";
    level.infect_loadouts[ "allies" ][ "loadoutJuggernaut" ] = 0;

    //First Infected
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimary" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment2" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryBuff" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryCamo" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryReticle" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondary" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment2" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryBuff" ] = "specialty_null";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryCamo" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryReticle" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutEquipment" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutOffhand" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPerk1" ] = "specialty_longersprint";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPerk2" ] = "specialty_quickdraw";
    level.infect_loadouts[ "axis_initial" ][ "loadoutPerk3" ] = "specialty_quieter";
    level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
    level.infect_loadouts[ "axis_initial" ][ "loadoutDeathstreak" ] = "specialty_c4death";
    level.infect_loadouts[ "axis_initial" ][ "loadoutJuggernaut" ] = 0;

    //Any other Infected
    level.infect_loadouts[ "axis" ][ "loadoutPrimary" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment2" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutPrimaryBuff" ] = "specialty_null";
    level.infect_loadouts[ "axis" ][ "loadoutPrimaryCamo" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutPrimaryReticle" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutSecondary" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment2" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutSecondaryBuff" ] = "specialty_null";
    level.infect_loadouts[ "axis" ][ "loadoutSecondaryCamo" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutSecondaryReticle" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutEquipment" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutOffhand" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutPerk1" ] = "specialty_longersprint";
    level.infect_loadouts[ "axis" ][ "loadoutPerk2" ] = "specialty_quickdraw";
    level.infect_loadouts[ "axis" ][ "loadoutPerk3" ] = "specialty_quieter";
    level.infect_loadouts[ "axis" ][ "loadoutStreakType" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutKillstreak1" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutKillstreak2" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutKillstreak3" ] = "none";
    level.infect_loadouts[ "axis" ][ "loadoutDeathstreak" ] = "specialty_grenadepulldeath";
    level.infect_loadouts[ "axis" ][ "loadoutJuggernaut" ] = 0;

    level.nades = [];
    add_nade( "c4_mp" );
    add_nade( "semtex_mp" );
    add_nade( "bouncingbetty_mp" );
    add_nade( "claymore_mp" );
    add_nade( "throwingknife_mp" );

    level.nades2 = [];
    add_nade2( "flash_grenade_mp" );
    add_nade2( "smoke_grenade_mp" );

    level.launchers = [];
    add_launcher( "at4_mp" );
    add_launcher( "rpg_mp" );
    add_launcher( "iw5_smaw_mp" );

    level.infected_pistols = [];
    add_pistol_no_attachment( "iw5_44magnum_mp_tactical" );
    add_pistol_no_attachment( "iw5_usp45_mp_tactical" );
    add_pistol_no_attachment( "iw5_deserteagle_mp_tactical" );
    add_pistol_no_attachment( "iw5_mp412_mp_tactical" );
    add_pistol_no_attachment( "iw5_p99_mp_tactical" );
    add_pistol_no_attachment( "iw5_fnfiveseven_mp_tactical" );
    //level.infected_pistols[ level.infected_pistols.size ] = "iw5_deserteagle_mp_silencer02";
    
    level.survivor_pistols = [];
    Pistol_Attachments = [ "akimbo", "xmags", "tactical" ];
    add_pistol( "iw5_44magnum", Pistol_Attachments );
    add_pistol( "iw5_usp45", Pistol_Attachments );
    add_pistol( "iw5_deserteagle", Pistol_Attachments );
    add_pistol( "iw5_mp412", Pistol_Attachments );
    add_pistol( "iw5_p99", Pistol_Attachments );
    add_pistol( "iw5_fnfiveseven", Pistol_Attachments );

    level.weapon_stats = [];

    level.survivor_shotguns = [];
    Shotguns_Attachments = [ "grip", "silencer03", "xmags" ];
    Shotguns_Scopes = [ "reflex", "eotech" ];
    Empty_List = [];
    add_shotgun( "iw5_usas12", Shotguns_Scopes, Shotguns_Attachments, [ 45, 125, 750 ] );
    add_shotgun( "iw5_ksg", Shotguns_Scopes, Shotguns_Attachments, [ 55, 140, 780 ] );
    add_shotgun( "iw5_spas12", Shotguns_Scopes, Shotguns_Attachments, [ 50, 145, 700 ] );
    add_shotgun( "iw5_aa12", Shotguns_Scopes, Shotguns_Attachments, [ 25, 105, 780 ] );
    add_shotgun( "iw5_striker", Shotguns_Scopes, Shotguns_Attachments, [ 25, 115, 700 ] );
    add_shotgun( "iw5_1887", Empty_List, Empty_List, [ 45, 125, 750 ] );

    level thread prematch_vision_fix();
    level thread half_timer();
}

half_timer()
{
    level endon( "game_ended" );

    level.half_time = undefined;

    wait ( 5 * 60 );

    level.half_time = 1;
}

add_launcher( internal_name )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;

    level.launchers[ level.launchers.size ] = newWeapon;
}

add_nade( internal_name )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;

    level.nades[ level.nades.size ] = newWeapon;
}

add_nade2( internal_name )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;

    level.nades2[ level.nades2.size ] = newWeapon;
}

add_pistol_no_attachment( internal_name )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;

    level.infected_pistols[ level.infected_pistols.size ] = newWeapon;
}

add_pistol( internal_name, attachments )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;
    newWeapon.attachments = attachments;

    level.survivor_pistols[ level.survivor_pistols.size ] = newWeapon;
}

add_shotgun( internal_name, scopes, attachments, weapon_stats )
{
    newWeapon = SpawnStruct();
    newWeapon.internal_name = internal_name;
    newWeapon.scopes = scopes;
    newWeapon.attachments = attachments;

    level.weapon_stats[ internal_name ] = weapon_stats;

    level.survivor_shotguns[ level.survivor_shotguns.size ] = newWeapon;
}

random_pistol_no_attachments()
{
    struct = level.infected_pistols[ RandomInt( level.infected_pistols.size ) ];

    return struct.internal_name;
}

random_launcher()
{
    struct = level.launchers[ RandomInt( level.launchers.size ) ];

    return struct.internal_name;
}

random_nade()
{
    struct = level.nades[ RandomInt( level.nades.size ) ];

    return struct.internal_name;
}

random_nade2()
{
    struct =  level.nades2[ RandomInt( level.nades2.size ) ];

    return struct.internal_name;
}

random_pistol()
{
    struct = level.survivor_pistols[ RandomInt( level.survivor_pistols.size ) ];
    
    attachment = struct.attachments[ RandomInt( struct.attachments.size ) ];

    return maps\mp\gametypes\_class::buildWeaponName( struct.internal_name, attachment, "none", 0, 0 );
}

random_shotgun()
{
    struct = level.survivor_shotguns[ RandomInt( level.survivor_shotguns.size ) ];

    attachment1 = "none";
    attachment2 = "none";

    if( struct.scopes.size == 0 && struct.attachments.size == 0)
    {
        return maps\mp\gametypes\_class::buildWeaponName( struct.internal_name, attachment1, attachment2, 0, 0 );
    }

    scope = 0;
    reticle = 0;
    attachments = 0;

    if( struct.scopes.size != 0 )
    {
        scope = RandomInt( 2 );
        
        if( scope )
        {
            reticle = RandomInt( 7 );
            attachment1 = struct.scopes[ RandomInt( struct.scopes.size ) ];
        }
    }

    if( struct.attachments.size != 0 )
    {
        count = RandomInt( 3 );

        if( count >= 1 && !scope )
        {
            attachment1 =  struct.attachments[ RandomInt( struct.attachments.size ) ];
        }

        if( count == 2 )
        {
            attachment2 =  struct.attachments[ RandomInt( struct.attachments.size ) ];
            
            while( attachment1 == attachment2 )
            {
                attachment2 =  struct.attachments[ RandomInt( struct.attachments.size ) ];
            }
        }
    }

    self.current_shotgun = SpawnStruct();
    self.current_shotgun.internal_name = struct.internal_name;
    self.current_shotgun.attachment1 = attachment1;
    self.current_shotgun.attachment2 = attachment2;
    self.current_shotgun.reticle = reticle;
    self.current_shotgun.final_name = maps\mp\gametypes\_class::buildWeaponName( struct.internal_name, attachment1, attachment2, ( RandomInt( 13 ) + 1 ), reticle );

    return self.current_shotgun.final_name;
}

do_survivor_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );

    self TakeAllWeapons();

    nade = self random_nade();
    
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
    
    nade2 = self random_nade2();

    self GiveWeapon( nade2 );

    if( nade2 == "smoke_grenade_mp" )
    {
        self SetOffhandSecondaryClass( "smoke" );
    }

    pistol = self random_pistol();

    self GiveWeapon( pistol );
    self SetWeaponAmmoStock( pistol, 9999 );
    self SetWeaponAmmoClip( pistol, 9999 );

    shotgun = self random_shotgun();

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

    pistol = self random_pistol_no_attachments();

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

    pistol = self random_pistol_no_attachments();
    rpg = self random_launcher();

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

do_special_spawn()
{
    self endon( "death" );
    self endon( "disconnect" );

    guid = ToLower( self.guid );

    if( level.player_stats[ guid ][ "scoreboard_icon" ] != 0 )
    {
        // Readd the special icon on some 
    }
}

prematch_vision_fix()
{
    level endon( "game_ended" );

    maps\mp\_utility::gameflagwait( "prematch_done" );

    wait 0.1;

    foreach( player in level.players )
    {
        // originally here was a vision to maek the game darker but right now we dont need it
    }
}