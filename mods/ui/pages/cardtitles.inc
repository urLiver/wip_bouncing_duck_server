#include "ui/style/defines.inc"

#define CARDTITLE( column, row, mat, cur, goal, quest, response, time ) \
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

#define RENDER_CARDTITLE_SELECTION() \
		CARDTITLE( 0, 0, "iw5_cardtitle_camo_classic", 1, 1, "Just Play", "CARDTITLE:0", "ct_time_0" ); \
		CARDTITLE( 1, 0, "iw5_cardtitle_camo_snow", dvarint( "total_kills" ), 1000, "Kills", "CARDTITLE:1", "ct_time_1" ); \
		CARDTITLE( 2, 0, "iw5_cardtitle_camo_multi", dvarint( "total_kills" ), 2500, "Kills", "CARDTITLE:2", "ct_time_2" ); \
		CARDTITLE( 0, 1, "iw5_cardtitle_camo_hex", dvarint( "total_kills" ), 5000, "Kills", "CARDTITLE:3", "ct_time_3" ); \
		CARDTITLE( 1, 1, "iw5_cardtitle_camo_choco", dvarint( "total_kills" ), 10000, "Kills", "CARDTITLE:4", "ct_time_4" ); \
		CARDTITLE( 2, 1, "iw5_cardtitle_camo_snake", dvarint( "total_deaths" ), 1000, "Deaths", "CARDTITLE:5", "ct_time_5" ); \
		CARDTITLE( 0, 2, "iw5_cardtitle_boombox", dvarint( "total_deaths" ), 2500, "Deaths", "CARDTITLE:6", "ct_time_6" ); \
		CARDTITLE( 1, 2, "iw5_cardtitle_bulletbelt", dvarint( "total_deaths" ), 5000, "Deaths", "CARDTITLE:7", "ct_time_7" ); \
		CARDTITLE( 2, 2, "iw5_cardtitle_cartepillar", dvarint( "total_deaths" ), 10000, "Deaths", "CARDTITLE:8", "ct_time_8" ); \
		CARDTITLE( 0, 3, "iw5_cardtitle_duel", dvarint( "moabs_called" ), 1, "Nukes called", "CARDTITLE:9", "ct_time_9" ); \
		CARDTITLE( 1, 3, "iw5_cardtitle_dynamite", dvarint( "moabs_called" ), 10, "Nukes called", "CARDTITLE:10", "ct_time_10" ); \
		CARDTITLE( 2, 3, "iw5_cardtitle_elite_01", dvarint( "moabs_called" ), 50, "Nukes called", "CARDTITLE:11", "ct_time_11" ); \
		CARDTITLE( 0, 4, "iw5_cardtitle_elite_11", dvarint( "moabs_called" ), 100, "Nukes called", "CARDTITLE:12", "ct_time_12" ); \
		CARDTITLE( 1, 4, "iw5_cardtitle_elite_11_green", dvarint( "moabs_called" ), 200, "Nukes called", "CARDTITLE:13", "ct_time_13" ); \
		CARDTITLE( 2, 4, "iw5_cardtitle_elite_04", dvarint( "moabs_cancelled" ), 10, "Nukes cancelled", "CARDTITLE:14", "ct_time_14" ); \
		CARDTITLE( 0, 5, "iw5_cardtitle_elite_05", dvarint( "moabs_cancelled" ), 50, "Nukes cancelled", "CARDTITLE:15", "ct_time_15" ); \
		CARDTITLE( 1, 5, "iw5_cardtitle_elite_06", dvarint( "rank_prestige_unlocked" ), 10, "Prestige", "CARDTITLE:16", "ct_time_16" ); \
		CARDTITLE( 2, 5, "iw5_cardtitle_elite_10", dvarint( "rank_prestige_unlocked" ), 20, "Prestige", "CARDTITLE:17", "ct_time_17" ); \
		CARDTITLE( 0, 6, "iw5_cardtitle_explosion_a", dvarint( "rank_prestige_unlocked" ), 30, "Prestige", "CARDTITLE:18", "ct_time_18" ); \
		CARDTITLE( 1, 6, "iw5_cardtitle_explosion_b", dvarint( "rank_prestige_unlocked" ), 40, "Prestige", "CARDTITLE:19", "ct_time_19" ); \
		CARDTITLE( 2, 6, "iw5_cardtitle_explosion_c", dvarint( "tis_destroyed" ), 50, "Insertions Destroyed", "CARDTITLE:20", "ct_time_20" ); \
		CARDTITLE( 0, 7, "iw5_cardtitle_eyes", dvarint( "tis_destroyed" ), 100, "Insertions Destroyed", "CARDTITLE:21", "ct_time_21" ); \
		CARDTITLE( 1, 7, "iw5_cardtitle_feathers", dvarint( "chickens_killed" ), 50, "Chickens Killed", "CARDTITLE:22", "ct_time_22" ); \
		CARDTITLE( 2, 7, "iw5_cardtitle_gargole", dvarint( "highest_killstreak" ), 40, "Highest Gun Killstreak", "CARDTITLE:23", "ct_time_23" ); \
		CARDTITLE( 0, 8, "iw5_cardtitle_gazin", dvarint( "highest_melee_killstreak" ), 20, "Highest Melee Killstreak", "CARDTITLE:24", "ct_time_24" ); \
		CARDTITLE( 1, 8, "iw5_cardtitle_golden_guns", dvarint( "infected_kills" ), 500, "Kills as Infected", "CARDTITLE:25", "ct_time_25" ); \
		CARDTITLE( 2, 8, "iw5_cardtitle_knife", dvarint( "infected_kills" ), 1000, "Kills as Infected", "CARDTITLE:26", "ct_time_26" );