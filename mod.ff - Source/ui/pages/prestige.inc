#include "ui/style/defines.inc"

#define PRESTIGE( column, row, prestige, response, time ) \
		itemDef \
		{ \
			rect 0 0 PRESTIGE_W PRESTIGE_H 0 0 \
			style 1 \
            decoration \
            visible 1 \
			backcolor PRIMARY_COLOR \
			exp rect x ( ( column * PRESTIGE_SPACE_X ) ) \
			exp rect y ( ( row * PRESTIGE_SPACE_Y ) ) \
		    exp material ( "roundedrect" ) \
			exp backcolor a ( select ( ( localvarint( time ) > 0 ) , \
						max( min( ( milliseconds( ) - localvarint( time ) ) / 250 , 1 ) , 0 ), \
						max( min( 1 - ( milliseconds( ) + localvarint( time ) ) / 250 , 1 ) , 0 ) \
					) ) \
    		} \
        itemDef \
		{ \
			rect 0 0 ( PRESTIGE_W - PADDING_S * 2 ) ( PRESTIGE_H - PADDING_S * 2 ) 0 0 \
			style 1 \
            type 1 \
            visible 1 \
			backcolor 1 1 1 1 \
			exp rect x ( ( column * PRESTIGE_SPACE_X ) + PADDING_S ) \
			exp rect y ( ( row * PRESTIGE_SPACE_Y ) + PADDING_S ) \
		    exp material ( select( ( dvarint( "rank_prestige_unlocked" ) < prestige ), "icon_lock", ( tableLookup( "mp/rankIconTable.csv", 0, 1, prestige + 1 ) ) ) ) \
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
		}

#define PRESTIGE_LOCKED( column, row ) \
		itemDef \
		{ \
			rect 0 0 PRESTIGE_W PRESTIGE_H 0 0 \
			style 1 \
            decoration \
            visible 1 \
			backcolor 1 0.84 0 1 \
			exp rect x ( ( column * PRESTIGE_SPACE_X ) ) \
			exp rect y ( ( row * PRESTIGE_SPACE_Y ) ) \
			exp material ( "icon_lock" ) \
		}

#define RENDER_PRESTIGE_SELECTION() \
        PRESTIGE( 0, 0,  0, "PRESTIGE:0", "pre_time_0" ); \
        PRESTIGE( 1, 0,  1, "PRESTIGE:1", "pre_time_1" ); \
        PRESTIGE( 2, 0,  2, "PRESTIGE:2", "pre_time_2" ); \
        PRESTIGE( 3, 0,  3, "PRESTIGE:3", "pre_time_3" ); \
        PRESTIGE( 4, 0,  4, "PRESTIGE:4", "pre_time_4" ); \
        PRESTIGE( 5, 0,  5, "PRESTIGE:5", "pre_time_5" ); \
        PRESTIGE( 6, 0,  6, "PRESTIGE:6", "pre_time_6" ); \
        PRESTIGE( 7, 0,  7, "PRESTIGE:7", "pre_time_7" ); \
        PRESTIGE( 0, 1,  8, "PRESTIGE:8", "pre_time_8" ); \
        PRESTIGE( 1, 1,  9, "PRESTIGE:9", "pre_time_9" ); \
        PRESTIGE( 2, 1, 10, "PRESTIGE:10", "pre_time_10" ); \
        PRESTIGE( 3, 1, 11, "PRESTIGE:11", "pre_time_11" ); \
        PRESTIGE( 4, 1, 12, "PRESTIGE:12", "pre_time_12" ); \
        PRESTIGE( 5, 1, 13, "PRESTIGE:13", "pre_time_13" ); \
        PRESTIGE( 6, 1, 14, "PRESTIGE:14", "pre_time_14" ); \
        PRESTIGE( 7, 1, 15, "PRESTIGE:15", "pre_time_15" ); \
        PRESTIGE( 0, 2, 16, "PRESTIGE:16", "pre_time_16" ); \
        PRESTIGE( 1, 2, 17, "PRESTIGE:17", "pre_time_17" ); \
        PRESTIGE( 2, 2, 18, "PRESTIGE:18", "pre_time_18" ); \
        PRESTIGE( 3, 2, 19, "PRESTIGE:19", "pre_time_19" ); \
        PRESTIGE( 4, 2, 20, "PRESTIGE:20", "pre_time_20" ); \
        PRESTIGE( 5, 2, 21, "PRESTIGE:21", "pre_time_21" ); \
        PRESTIGE( 6, 2, 22, "PRESTIGE:22", "pre_time_22" ); \
        PRESTIGE( 7, 2, 23, "PRESTIGE:23", "pre_time_23" ); \
        PRESTIGE( 0, 3, 24, "PRESTIGE:24", "pre_time_24" ); \
        PRESTIGE( 1, 3, 25, "PRESTIGE:25", "pre_time_25" ); \
        PRESTIGE( 2, 3, 26, "PRESTIGE:26", "pre_time_26" ); \
        PRESTIGE( 3, 3, 27, "PRESTIGE:27", "pre_time_27" ); \
        PRESTIGE( 4, 3, 28, "PRESTIGE:28", "pre_time_28" ); \
        PRESTIGE( 5, 3, 29, "PRESTIGE:29", "pre_time_29" ); \
        PRESTIGE( 6, 3, 30, "PRESTIGE:30", "pre_time_30" ); \
        PRESTIGE( 7, 3, 31, "PRESTIGE:31", "pre_time_31" ); \
        PRESTIGE( 0, 4, 32, "PRESTIGE:32", "pre_time_32" ); \
        PRESTIGE( 1, 4, 33, "PRESTIGE:33", "pre_time_33" ); \
        PRESTIGE( 2, 4, 34, "PRESTIGE:34", "pre_time_34" ); \
        PRESTIGE( 3, 4, 35, "PRESTIGE:35", "pre_time_35" ); \
        PRESTIGE( 4, 4, 36, "PRESTIGE:36", "pre_time_36" ); \
        PRESTIGE( 5, 4, 37, "PRESTIGE:37", "pre_time_37" ); \
        PRESTIGE( 6, 4, 38, "PRESTIGE:38", "pre_time_38" ); \
        PRESTIGE( 7, 4, 39, "PRESTIGE:39", "pre_time_39" ); \
        PRESTIGE( 0, 5, 40, "PRESTIGE:40", "pre_time_40" ); \
        PRESTIGE( 1, 5, 41, "PRESTIGE:41", "pre_time_41" ); \
        PRESTIGE_LOCKED( 2, 5 ); \
        PRESTIGE_LOCKED( 3, 5 ); \
        PRESTIGE_LOCKED( 4, 5 ); \
        PRESTIGE_LOCKED( 5, 5 );
