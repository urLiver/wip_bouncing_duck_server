init()
{

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