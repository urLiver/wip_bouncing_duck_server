init()
{
    replacefunc( maps\mp\_events::multikill, ::on_multikill );
    replacefunc( maps\mp\_events::firstblood, ::on_firstblood );
}

on_multikill( var_0, var_1 )
{
    if ( var_1 == 2 )
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_DOUBLEKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "double" );
    }
    else if ( var_1 == 3 )
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_TRIPLEKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "triple" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_3xkill", self );
    }
    else
    {
        thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_MULTIKILL" );
        maps\mp\killstreaks\_killstreaks::giveadrenaline( "multi" );
        thread maps\mp\_utility::teamplayercardsplash( "callout_3xpluskill", self );
    }

    thread maps\mp\_matchdata::logmultikill( var_0, var_1 );
    maps\mp\_utility::setplayerstatifgreater( "multikill", var_1 );
    maps\mp\_utility::incplayerstat( "mostmultikills", 1 );
}

on_firstblood( var_0, var_1, var_2 )
{
    self.modifiers[ "firstblood" ] = 1;
    thread maps\mp\gametypes\_rank::xpeventpopup( &"SPLASHES_FIRSTBLOOD" );
    thread maps\mp\gametypes\_rank::giverankxp( "firstblood", undefined, var_1, var_2 );
    thread maps\mp\_matchdata::logkillevent( var_0, "firstblood" );
    maps\mp\killstreaks\_killstreaks::giveadrenaline( "firstBlood" );
    thread maps\mp\_utility::teamplayercardsplash( "callout_firstblood", self );
}