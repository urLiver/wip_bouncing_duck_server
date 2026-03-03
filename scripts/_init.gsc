init() 
{
    thread scripts\maps\mp\gametypes\_damage::init();
    thread scripts\maps\mp\gametypes\_deathicons::init();
    thread scripts\maps\mp\gametypes\_gamelogic::init();
    thread scripts\maps\mp\gametypes\_killcam::init();
    thread scripts\maps\mp\gametypes\_menus::init();
    thread scripts\maps\mp\gametypes\_playerlogic::init();
    thread scripts\maps\mp\gametypes\_rank::init();
    thread scripts\maps\mp\gametypes\_weapons::init();
    thread scripts\maps\mp\gametypes\infect::init();

    thread scripts\maps\mp\killstreaks\_nuke::init(); 

    thread scripts\maps\mp\perks\_perkfunctions::init();

    thread scripts\maps\mp\_events::init();
    thread scripts\maps\mp\_utility::init();

    thread scripts\custom\init\_non_threaded::init();
    thread scripts\custom\init\_threaded::init();

    thread scripts\custom\maps\_maps::init();
    thread scripts\custom\maps\_objects::init();

    thread scripts\custom\_chat::init();
    thread scripts\custom\_database::init();
    thread scripts\custom\_player::init();
    thread scripts\custom\_uiwrappers::init();
    thread scripts\custom\_weapons::init();
}
