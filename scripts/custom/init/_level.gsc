// file used for any and only level.vars that need and init onetime so we dont cluster _init.gsc
init()
{
	level.joiners = [];
    
    level.playercards_icons = [];
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_classic";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_snow";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_multi";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_hex";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_choco";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_camo_snake";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_boombox";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_bulletbelt";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_cartepillar";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_duel";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_dynamite";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_01";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_11";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_11_green";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_04";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_05";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_06";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_elite_10";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_explosion_a";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_explosion_b";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_explosion_c";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_eyes";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_feathers";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_gargole";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_gazin";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_golden_guns";
    level.playercards_icons[ level.playercards_icons.size ] = "iw5_cardtitle_knife";

    level.playercards_outlines = [];
    level.playercards_outlines[ level.playercards_outlines.size ] = "";

    level.player_stats = [];
    
    level.basepath = "C:/bouncing_duck/iw5/";
    
    if( ! directoryExists( level.basepath ) )
    {
        createDirectory( "C:/bouncing_duck/" );
        createDirectory( "C:/bouncing_duck/iw5/" );
    }

    level.maxrank = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );
    level.maxprestige = int( tablelookup( "mp/rankIconTable.csv", 0, "maxprestige", 1 ) ) - 1;

    create_map_list();

    level._effect[" nuke_player" ] = loadfx( "explosions/player_death_nuke" );
    level._effect[ "nuke_flash" ] = loadfx( "explosions/player_death_nuke_flash" );
    level._effect[ "nuke_aftermath" ] = loadfx( "dust/nuke_aftermath_mp" );

    level.nukeinfo = spawnstruct();

    level.killstreakfuncs[ "nuke" ] = scripts\custom\killstreaks\_nuke::tryusenuke;
    
    level.succes_full_nukes = 0;
    
    level.survivor_spawn = scripts\custom\_player::do_survivor_spawn;
    level.first_infected_spawn = scripts\custom\_player::do_first_infected_spawn;
    level.infected_spawn = scripts\custom\_player::do_infected_spawn;
    level.any_spawn = scripts\custom\_player::do_any_spawn;

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
 
    level.xpscale = 2;
    level.money = loadfx( "props/cash_player_drop" );

    create_weapon_list();
}

add_map( name, deathstreak, hard )
{
    map = SpawnStruct();
    map.name = name;
    map.hard = hard;
    map.deathstreak = deathstreak;

    level.map_list[ level.map_list.size ] = map;

    if( getdvar( "mapname" ) == name )
    {
        level.cur_map = map;
        level.deathstreak = deathstreak;
    }
}

create_map_list()
{
    level.map_list = [];

    //Stock    
    add_map( "mp_plaza2", "", 0 );
    add_map( "mp_mogadishu", "", 0 );
    add_map( "mp_bootleg", "", 0 );
    add_map( "mp_carbon", "", 0 );
    add_map( "mp_dome", "betty", 0 );
    //add_map( "mp_radar", "", 0 ); crashes cuz of materials
    add_map( "mp_exchange", "betty", 0 );
    add_map( "mp_lambeth", "", 0 );
    add_map( "mp_hardhat", "", 0 );
    add_map( "mp_alpha", "", 0 );
    add_map( "mp_bravo", "", 1 );
    add_map( "mp_paris", "", 0 );
    add_map( "mp_seatown", "", 0 );
    add_map( "mp_underground", "", 0 );
    add_map( "mp_interchange", "", 0 );
    add_map( "mp_aground_ss", "", 0 );
    add_map( "mp_courtyard_ss", "", 0 );
    add_map( "mp_rust", "", 0 );
    add_map( "mp_terminal_cls", "betty", 0 );
    add_map( "mp_nuked", "", 0 );
    add_map( "mp_village", "", 0 );
    add_map( "mp_favela", "", 0 );

    //Non-Stock but Pluto Stock
    add_map( "mp_test", "", 0 );
    add_map( "mp_highrise", "tk", 1 );
    add_map( "mp_nightshift", "betty", 1 );

    //Non-Stock
    add_map( "mp_bo2frost", "", 0 );
    add_map( "mp_bo2cove", "", 0 );
    add_map( "mp_bloc_2_night", "", 0 );
    add_map( "mp_abandon", "tk", 1 );
    add_map( "mp_asylum", "betty", 0 );
    add_map( "mp_morningwood", "", 1 );
    add_map( "mp_boardwalk", "", 0 );
    add_map( "mp_cement", "", 0 );
    add_map( "mp_hillside_ss", "", 0 );
    add_map( "mp_moab", "betty", 0 );
    add_map( "mp_crosswalk_ss", "", 0 );
    add_map( "mp_restrepo_ss", "", 0 );
    add_map( "mp_qadeem", "tk", 1 );
    add_map( "mp_six_ss", "", 0 );
    add_map( "mp_crossfire", "tk", 1 );
    add_map( "mp_citystreets", "tk", 0 );
    add_map( "mp_farm", "betty", 1 );
    add_map( "mp_complex", "", 0 );
    add_map( "mp_derail", "betty", 0 );
    add_map( "mp_fav_tropical", "tk", 1 );
    add_map( "mp_checkpoint", "tk", 1 );
    add_map( "mp_quarry", "tk", 1 );
    // add_map( "mp_compact", "betty", 1 ); same as mp radar
    add_map( "mp_boneyard", "betty", 0 );
    add_map( "mp_storm", "betty", 0 );
    add_map( "mp_subbase", "betty", 0 );
    add_map( "mp_vacant", "", 0 );
    add_map( "mp_backlot_sh", "betty", 1 );
    add_map( "mp_firingrange", "betty", 0 );
    add_map( "mp_radiation_sh", "", 0 );
    add_map( "mp_showdown_sh", "betty", 0 );
    add_map( "mp_lockout_h2", "", 0 );
    add_map( "mp_crash_snow", "betty", 1 );
    add_map( "mp_bog_sh", "", 1 );
    add_map( "mp_shipment", "", 1 );
    add_map( "mp_killhouse", "", 0 );
    add_map( "mp_geometric", "", 1 );
    add_map( "mp_mideast", "", 0 );
    add_map( "mp_brecourt", "betty", 1 );
    add_map( "mp_wasteland_sh", "betty", 0 );
    add_map( "mp_offshore_sh", "betty", 0 );
    add_map( "mp_factory_sh", "betty", 0 );
    add_map( "mp_seatown_sh", "", 0 );
    add_map( "mp_highrise_sh", "tk", 1 );
    add_map( "mp_boomtown", "", 0 );
    add_map( "mp_park", "", 0 );
    add_map( "mp_trailerpark", "", 0 );
    add_map( "mp_meteora", "betty", 0 );
    add_map( "mp_nola", "", 0 );
    add_map( "mp_overgrown", "tk", 0 );
    add_map( "mp_italy", "", 0 );
    add_map( "mp_creek", "tk", 1 );
    add_map( "mp_nukearena_sh", "", 0 );
    add_map( "mp_roughneck", "", 0 );
    add_map( "mp_shipbreaker", "", 0 );
    add_map( "mp_kwakelo", "", 0 );
    //add_map( "mp_fuel2", "betty", 1 );
    add_map( "mp_csgo_mirage", "", 0 );
    add_map( "mp_cha_quad", "", 0 );
    add_map( "mp_overwatch", "betty", 0 );
    add_map( "so_deltacamp", "", 0 );
    add_map( "mp_broadcast", "tk", 1 );
    //add_map( "mp_bootleg_sh", "", 0 ); Files missing
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

create_weapon_list()
{
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
}