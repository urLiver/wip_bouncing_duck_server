#include "ui/style/ui.inc"

#define RenderSettings() \ 
        SettingsSelector( 0, "Render Distance", "set_0", "SETTING:RENDER_DISTANCE", "r_zfar_text" ); \
        SettingsSelector( 1, "Fullbright", "set_1", "SETTING:FULLBRIGHT", "r_lightmap_text" ); \
        SettingsToggle( 2, "Render Killstreak", "set_2", "SETTING:RENDERKILLSTREAK", "r_killstreak" ); \
        SettingsToggle( 3, "Render XP Text", "set_3", "SETTING:XP", "r_xp" );