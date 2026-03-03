#include "ui/style/ui.inc"

#define RenderMainWindow() \
		onOpen \
		{ \
            lerp x from -640 to 0 over "0.25"; \
			open "menu_window_map"; \
			focusfirst; \
		} \
        onRequestClose \
        { \
			close "menu_window_map"; \
            lerp x from 0 to -640 over "0.25"; \
        } \
		onEsc \
		{ \
			close self; \
		} \
		itemDef \
		{ \
			rect 237.5 -236 13 680 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 0.596078 0.654902 10.603922 0.75 \
			background "navbar_edge" \
		} \
		itemDef \
		{ \
			rect -264 -236 501.5 680 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 0 0 0 0.4 \
			background "white" \
		} \
		itemDef \
		{ \
			rect -64 30 301.5 5.333 1 1 \
			decoration \
			visible 1 \
			style 3 \
			forecolor 1 1 1 1 \
			background "navbar_tick" \
		} \
		itemDef \
		{ \
			rect -64 3 276.667 24.233 1 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 9 \
			textalign 10 \
			textscale 0.5 \
			exp text ( "@MENU_OPTIONS_UPPER_CASE" ) \
		} \
		MainWindowButton( 0, "Continue", close "menu_window", "tab_time_0" ); \
		MainWindowButton( 1, "Settings", close "menu_window"; open pc_options_video_ingame; execnow "set ui_allow_graphic_change 0";, "tab_time_1" ); \
		MainWindowButton( 2, "Mute Players", open "menu_mute";, "tab_time_2" ); \
		MainWindowButton( 3, "Friends", open popup_friends, "tab_time_3" ); \
		MainWindowButton( 4, "Prestige", open "menu_prestige", "tab_time_4" ); \
		MainWindowButton( 5, "Cardtitles", open "menu_cardtitles", "tab_time_5" ); \
		MainWindowButton( 6, "Intel Cardtitles", open "menu_cardtitles_page2", "tab_time_6" ); \
		MainWindowButton( 7, "Mod Settings", open "menu_mod_settings", "tab_time_7" ); \
		MainWindowButton( 8, "Information", open "menu_information", "tab_time_8" ); \
		MainWindowButton( 9, "^1Leave Game", open "popup_leavegame", "tab_time_9" ); \
		MainWindowSepartor( 4 ); \
		MainWindowSepartor( 9 );