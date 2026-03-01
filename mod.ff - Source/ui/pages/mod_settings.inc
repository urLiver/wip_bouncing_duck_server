#include "ui/style/defines.inc"

#define SPACER( idx ) \
		itemDef \
		{ \
			rect -64 ( 33.334 + 20 * idx ) 301.5 2 1 1 \
			visible 1 \
			style 3 \
			decoration \
			forecolor 1 1 1 1 \
			background "navbar_tick" \
		}

#define STRING( idx, txt, time, response, dvar_name ) \
		itemDef \
		{ \
			rect -64 ( 35.334 + 20 * idx ) 501.5 17.567 1 1 \
			visible 1 \
			style 1 \
            type 1 \
			action \
			{ \
				play "mouse_click"; \
                scriptMenuResponse response; \
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
			rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
			decoration \
			visible 1 \
			style 1 \
			backcolor 1 1 1 1 \
			background "navbar_selection_bar" \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
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
		} \
		itemDef \
		{ \
			rect 269.5 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 3 \
			textalign 4 \
			textscale 0.375 \
			exp text ( dvarstring( dvar_name ) ) \
		}

#define BOOL( idx, txt, time, response, dvar_name ) \
		itemDef \
		{ \
			rect -64 ( 35.334 + 20 * idx ) 501.5 17.567 1 1 \
			visible 1 \
			style 1 \
            type 1 \
			action \
			{ \
				play "mouse_click"; \
                scriptMenuResponse response; \
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
			rect -64 ( 35.334 + 20 * idx ) 301.5 17.567 1 1 \
			decoration \
			visible 1 \
			style 1 \
			backcolor 1 1 1 1 \
			background "navbar_selection_bar" \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
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
		} \
		itemDef \
		{ \
			rect 269.5 ( 33.334 + 20 * idx ) 276.667 19.567 1 1 \
			decoration \
			visible 1 \
			style 1 \
			forecolor 1 1 1 1 \
			textfont 3 \
			textalign 4 \
			textscale 0.375 \
			exp text ( select( dvarbool( dvar_name ), "Yes", "No" ) ) \
		}

#define RENDER_MOD_SETTINGS() \ 
        STRING( 0, "Render Distance", "set_0", "SETTING:RENDER_DISTANCE", "r_zfar_text" ); \
        STRING( 1, "Fullbright", "set_1", "SETTING:FULLBRIGHT", "r_lightmap_text" ); \
        BOOL( 2, "Render Killstreak", "set_2", "SETTING:RENDERKILLSTREAK", "r_killstreak" );
        BOOL( 3, "Render XP Text", "set_3", "SETTING:XP", "r_xp" );