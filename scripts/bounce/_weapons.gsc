init()
{
    replacefunc( maps\mp\gametypes\_weapons::handlescavengerbagpickup, ::on_handlescavengerbagpickup );
}

on_handlescavengerbagpickup( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_1 );
    var_1 notify( "scavenger_pickup" );
    var_1 playlocalsound( "scavenger_pack_pickup" );
    var_2 = var_1 getweaponslistoffhands();

    level.player_stats[ ToLower( var_1.guid ) ][ "scavengerbags_collected" ]++;

    var_1 thread scripts\core\_stats::upload_stats();

    foreach ( var_4 in var_2 )
    {
        if ( var_4 != "throwingknife_mp" )
        {
            continue;
        }

        var_5 = var_1 getweaponammoclip( var_4 );
        var_1 setweaponammoclip( var_4, var_5 + 1 );
    }

    var_7 = var_1 getweaponslistprimaries();

    foreach ( var_9 in var_7 )
    {
        if ( ! maps\mp\_utility::iscacprimaryweapon( var_9 ) && !level.scavenger_secondary )
        {
            continue;
        }

        if ( issubstr( var_9, "alt" ) && ( issubstr( var_9, "m320" ) || issubstr( var_9, "gl" ) || issubstr( var_9, "gp25" ) || issubstr( var_9, "hybrid" ) ) )
        {
            continue;
        }

        if ( maps\mp\_utility::getweaponclass( var_9 ) == "weapon_projectile" )
        {
            continue;
        }

        var_10 = var_1 getweaponammostock( var_9 );
        var_11 = weaponclipsize( var_9 );
        var_1 setweaponammostock( var_9, var_10 + var_11 );
    }

    var_1 maps\mp\gametypes\_damagefeedback::updatedamagefeedback( "scavenger" );
}