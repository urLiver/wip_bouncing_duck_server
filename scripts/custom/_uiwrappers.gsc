init()
{

}

fadeout( time, alpha )
{
    if( ! isdefined( alpha ) )
    {
        alpha = 0;
    }

    self.alpha = 1;
    self FadeOverTime ( time );
    self.alpha = alpha;
}

fadein( time, alpha )
{
    if( ! isdefined( alpha ) )
    {
        alpha = 1;
    }

    self.alpha = 0;
    self FadeOverTime ( time );
    self.alpha = alpha;
}

clienttext( client, text, font, fontsize, x, y, alignx, aligny, alpha, sortkey, color, glowcolor )
{
    elem = NewClientHudElem( client );
    elem.x = x;
    elem.y = y;
    elem.alignx = alignx;
    elem.aligny = aligny;
    elem.horzalign = "FULLSCREEN";
    elem.vertalign = "FULLSCREEN";
    elem.alpha = alpha;
    elem.sort = sortkey;
    elem.archived = 1;
    elem.hidewheninmenu = 1;
    elem.fontscale = fontsize;
    elem.color = color;

    if( isdefined( glowcolor ) )
    {
        elem.glowcolor = glowcolor;
        elem.glowalpha = 1;
    }

    elem.font = font;

    if( text != "" )
    {
        elem settext( text );
    }

    return elem;
}

clientshader( client, material, x, y, widht, height, alignx, aligny, alpha, sortkey, color )
{
    elem = NewClientHudElem( client );
    elem.x = x;
    elem.y = y;
    elem.alignx = alignx;
    elem.aligny = aligny;
    elem.horzalign = "FULLSCREEN";
    elem.vertalign = "FULLSCREEN";
    elem.alpha = alpha;
    elem.sort = sortkey;
    elem.archived = 1;
    elem.hidewheninmenu = 1;
    elem.color = color;
    elem setshader( material, widht, height );

    return elem;
}

servertimer( text, time, font, fontsize, x, y, alignx, aligny, alpha, sortkey, color )
{
    elem = maps\mp\gametypes\_hud_util::createservertimer( font, fontsize );
    elem settimer( time );
    elem.x = x;
    elem.y = y;
    elem.alignx = alignx;
    elem.aligny = aligny;
    elem.horzalign = "FULLSCREEN";
    elem.vertalign = "FULLSCREEN";
    elem.alpha = alpha;
    elem.sort = sortkey;
    elem.archived = 1;
    elem.hidewheninmenu = 1;
    elem.color = color;
    elem.label = text;

    return elem;
}

servertext( text, font, fontsize, x, y, alignx, aligny, alpha, sortkey, color, glowcolor )
{
    elem = NewHudElem();
    elem.x = x;
    elem.y = y;
    elem.alignx = alignx;
    elem.aligny = aligny;
    elem.horzalign = "FULLSCREEN";
    elem.vertalign = "FULLSCREEN";
    elem.alpha = alpha;
    elem.sort = sortkey;
    elem.archived = 1;
    elem.hidewheninmenu = 1;
    elem.fontscale = fontsize;
    elem.color = color;

    if( isdefined( glowcolor ) )
    {
        elem.glowcolor = glowcolor;
        elem.glowalpha = 1;
    }

    elem.font = font;

    if( text != "" )
    {
        elem settext( text );
    }

    return elem;
}

servershader( material, x, y, widht, height, alignx, aligny, alpha, sortkey, color )
{
    elem = NewHudElem();
    elem.x = x;
    elem.y = y;
    elem.alignx = alignx;
    elem.aligny = aligny;
    elem.horzalign = "FULLSCREEN";
    elem.vertalign = "FULLSCREEN";
    elem.alpha = alpha;
    elem.sort = sortkey;
    elem.archived = 1;
    elem.hidewheninmenu = 1;
    elem.color = color;
    elem setshader( material, widht, height );

    return elem;
}