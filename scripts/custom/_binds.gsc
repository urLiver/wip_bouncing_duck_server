init()
{

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

do_spawn()
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