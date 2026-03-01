#include "ui/style/defines.inc"

#define CARDTITLE2( column, row, mat, cur, goal, quest, response, time ) \
        itemDef \
		{ \
			rect 0 0 CARDTITLE_W CARDTITLE_H 0 0 \
			style 1 \
            type 1 \
            visible 1 \
			backcolor PRIMARY_COLOR \
			exp rect x ( ( column * CARDTITLE_SPACE_X ) ) \
			exp rect y ( ( row * CARDTITLE_SPACE_Y ) ) \
		    exp material ( "roundedrect" ) \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
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
			rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) ( CARDTITLE_SHADER_H ) 0 0 \
			style 1 \
            decoration \
            visible 1 \
			backcolor 1 1 1 1 \
			exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
			exp rect y ( ( row * CARDTITLE_SPACE_Y ) + PADDING_S ) \
		    exp material ( mat ) \
		} \
		itemDef \
		{ \
			rect 0 0 ( CARDTITLE_H - PADDING_S * 4 ) ( CARDTITLE_SHADER_H - PADDING_S * 2 ) 0 0 \
			style 1 \
            decoration \
            visible when ( cur < goal ) \
			backcolor 1 1 1 1 \
			exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S * 2 ) \
			exp rect y ( ( row * CARDTITLE_SPACE_Y ) + PADDING_S * 2 ) \
		    exp material ( "icon_lock" ) \
		} \
		itemDef \
		{ \
			rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) CARDTITLE_TEXT_H 0 0 \
			style 1 \
            decoration \
            visible 1 \
			forecolor 1 1 1 1 \
            textalign 10 \
            textscale 0.275 \
            textfont 1 \
			exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
			exp rect y ( ( row * CARDTITLE_SPACE_Y + CARDTITLE_SHADER_H + PADDING_S ) ) \
		    exp text ( cur + " / " + goal ) \
		} \
		itemDef \
		{ \
			rect 0 0 ( CARDTITLE_W - PADDING_S * 2 ) CARDTITLE_TEXT_H 0 0 \
			style 1 \
            decoration \
            visible 1 \
			forecolor 1 1 1 1 \
            textalign 8 \
            textscale 0.275 \
            textfont 1 \
			exp rect x ( ( column * CARDTITLE_SPACE_X ) + PADDING_S ) \
			exp rect y ( ( row * CARDTITLE_SPACE_Y + CARDTITLE_SHADER_H + PADDING_S ) ) \
		    exp text (  quest ) \
		}

#define RENDER_CARDTITLE_PAGE2_SELECTION() \
		CARDTITLE2( 0, 0, "iw5_cardtitle_mastodon", dvarint( "intel_terminal" ), 1, "Terminal Intel", "CARDTITLE:27", "ct_time_27" );