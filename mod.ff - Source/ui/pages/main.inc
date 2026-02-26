#define WINDOW_SPACER( idx ) \
		itemDef \
		{ \
			rect -64 ( 33.334 + 20 * idx ) 301.5 2 1 1 \
			visible 1 \
			style 3 \
			decoration \
			forecolor 1 1 1 1 \
			background "navbar_tick" \
		}

#define WINDOW_SELECTOR( idx, txt, func, time ) \
		itemDef \
		{ \
			rect -64 ( 33.334 + 19.567 + 20 * idx ) 301.5 1 1 1 \
			visible 1 \
			style 1 \
			decoration \
			backcolor 0 0 0 0 \
			background "navbar_selection_bar" \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
		} \
		itemDef \
		{ \
			rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
			visible 1 \
			style 1 \
			type 1 \
			backcolor 1 1 1 1 \
			background "navbar_selection_bar" \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
			action \
            { \
				play "mouse_click"; \
				func; \
            } \
            onFocus \
			{ \
				setLocalVarInt time ( ( 1 ) * milliseconds( ) ); \
				play "mouse_over"; \
			} \
			leaveFocus \
			{ \
				setLocalVarInt time ( ( -1 ) * milliseconds( ) ); \
			} \
		} \
		itemDef \
		{ \
			rect -64 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 3 \
			textalign 10 \
			textscale 0.375 \
			exp text ( txt ) \
		}

#define RENDER_MAIN() \
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
		WINDOW_SELECTOR( 0, "Continue", close "menu_window", "tab_time_0" ); \
		WINDOW_SELECTOR( 1, "Settings", close "menu_window"; open pc_options_video_ingame; execnow "set ui_allow_graphic_change 0";, "tab_time_1" ); \
		WINDOW_SELECTOR( 2, "Mute Players", open "menu_mute";, "tab_time_2" ); \
		WINDOW_SELECTOR( 3, "Friends", open popup_friends, "tab_time_3" ); \
		WINDOW_SELECTOR( 4, "Prestige", open "menu_prestige", "tab_time_4" ); \
		WINDOW_SELECTOR( 5, "Cardtitle", open "menu_cardtitles", "tab_time_5" ); \
		WINDOW_SELECTOR( 6, "Mod Settings", open "menu_mod_settings", "tab_time_6" ); \
		WINDOW_SELECTOR( 7, "Information", open "menu_information", "tab_time_7" ); \
		WINDOW_SELECTOR( 8, "^1Leave Game", open "popup_leavegame", "tab_time_8" ); \
		WINDOW_SPACER( 4 ); \
		WINDOW_SPACER( 8 );