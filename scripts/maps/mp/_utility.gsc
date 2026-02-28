init()
{
    replacefunc( maps\mp\_utility::updatemainmenu, ::on_updatemainmenu );
}

on_updatemainmenu()
{   
    if ( self.pers[ "team" ] == "spectator" )
    {
        self setclientdvar( "g_scriptMainMenu", game[ "menu_team" ] );
    }
    else
    {
        self setclientdvar( "g_scriptMainMenu", "menu_window" );
    }
}