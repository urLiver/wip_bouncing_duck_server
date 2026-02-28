init() 
{
    // Initizalizing any Game Function which we Replace

    thread scripts\maps\mp\gametypes\_damage::init();
    thread scripts\maps\mp\gametypes\_gamelogic::init();
    thread scripts\maps\mp\gametypes\_killcam::init();
    thread scripts\maps\mp\gametypes\_menus::init();
    thread scripts\maps\mp\gametypes\_playerlogic::init();
    thread scripts\maps\mp\gametypes\_rank::init();
    thread scripts\maps\mp\gametypes\_weapons::init();
    thread scripts\maps\mp\gametypes\infect::init();

    thread scripts\maps\mp\perks\_perkfunctions::init();

    thread scripts\maps\mp\_events::init();
    thread scripts\maps\mp\_utility::init();

    // INitizalizing our own Scripts
    
    thread scripts\custom\init\_dvars::init();
    thread scripts\custom\init\_entities::init();
    thread scripts\custom\init\_level::init();
    thread scripts\custom\init\_logic::init();
    thread scripts\custom\init\_player::init();
    thread scripts\custom\init\_precache::init();

    thread scripts\custom\killstreaks\_nuke::init(); 

    thread scripts\custom\_binds::init();
    thread scripts\custom\_chat::init();
    thread scripts\custom\_database::init();
    thread scripts\custom\_player::init();
    thread scripts\custom\_uiwrappers::init();
    thread scripts\custom\_weapons::init();
}
